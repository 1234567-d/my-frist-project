# ==🟣一、SQL注入（SQL Injection）==
## 1. ==认证绕过（Authentication Bypass）==
- **适用场景**：登录框、搜索框等存在**字符串拼接SQL**且**未做预编译/过滤**的登录表单（如截图中的 `POST` 请求），输入1'出现SQL语法报错，说明存在字符型注入点
![[Pasted image 20261010032625.png|700]]
![[Pasted image 20261010033158.png]]
- **前端特征**：
    - 表单以 `POST` 方式提交至根路径 `/`。
    - 参数名为 `username` 和 `password`。
    - 页面直接展示SQL语句片段（`SELECT * FROM USERS WHERE username =`），暗示后端是直接拼接SQL执行。
- **Payload**： admin' or '1'='1
- **现象**：
- 在密码框输入该Payload（用户名随意），点击登录后，无需正确密码即可成功登录系统。
- **解释**：  
    后端SQL语句原本为：
    `SELECT * FROM USERS WHERE username = '...' AND password = '...'`  
    
    注入后拼接为：
    `SELECT * FROM USERS WHERE username = '...' AND password = 'admin' or '1'='1'`  
    由于 `'1'='1'` 为恒真条件，且 `OR` 的优先级导致整个 `WHERE` 子句恒为真，数据库返回了用户表中的第一条记录（通常是admin），从而绕过了密码验证。
- **工具**：手工注入
- **修复/防御**：
    使用参数化查询（预编译语句）
    强制将用户输入视为“数据”而非“代码”，数据库会预先编译SQL结构，输入内容无法改变原定逻辑。
![[Pasted image 20261010034857.png]]

## 1.1 相关知识笔记
#### 一、SQL查询基础
- **SELECT语句结构**：`SELECT * FROM users WHERE username='...' AND password='...'`
- **WHERE子句**：用于条件过滤，认证场景下同时校验用户名与密码
#### 二、逻辑运算符与优先级
- **AND / OR**：用于连接多个条件
- **优先级**：`AND` 高于 `OR`
- **利用点**：`OR '1'='1'` 使整个WHERE子句恒真，绕过密码验证
#### 三、恒真条件
- **定义**：永远为真的表达式，如 `'1'='1`、`1=1`
- **作用**：打破原SQL逻辑，使查询返回非预期结果
#### 四、字符串拼接与引号闭合
- **拼接机制**：后端将用户输入直接拼入SQL字符串
- **引号闭合**：单引号 `'` 用于闭合原字符串边界
  - 原SQL：`password = '[输入]'`
  - 注入后：`password = 'admin' or '1'='1'`
- **转义缺失**：未对特殊字符转义是注入的前提
#### 五、注释符
- **常见注释符**：`--`、`#`、`/* */`
- **作用**：注释掉原SQL剩余部分
- **示例**：`admin'--` 可直接注释掉密码校验部分
#### 六、预编译与参数化查询
- **预编译（Prepared Statement）**：数据库预先编译SQL模板，参数以占位符传入
- **占位符**：`?`（MySQL/Python）、`:name`（Oracle/PHP PDO）、`$1`（PostgreSQL）
- **核心**：数据与代码分离，从根本上杜绝注入
#### 七、数据库权限模型
- **最小权限原则**：Web应用连接账号仅授予必要权限
- **建议**：登录查询仅需 `SELECT`，禁止 `DROP`、`DELETE`、`UPDATE` 等高危操作
#### 八、报错信息与元数据
- **报错注入**：数据库详细报错可能泄露表名、字段名、版本等元数据
- **防御**：生产环境关闭详细报错，统一返回模糊提示





# ==🟣二、文件包含漏洞（File Inclusion）==
## 1. ==代码审计与文件包含==（本地文件包含 LFI）

#### 适用场景：
PHP 网站中存在 `include`、`require` 等函数，且包含的文件路径参数（如 `?file=xxx`）用户可控，同时后端**仅通过白名单**或**简单过滤进行限制**
#### 前端/源码特征：
- **源码获取**：首页 HTML 注释中存在提示 `<!--source.php-->`，暗示存在源码泄露文件。
![[Pasted image 20261010140401.png|633]]
- **源码审计**：访问 `source.php` 后，看到后端使用了 `highlight_file(__FILE__)` 打印源码。
![[Pasted image 20261010140514.png|677]]
html过滤后：
![[Pasted image 20261010141307.png|568]]
![[Pasted image 20261010141322.png|640]]
- **关键危险函数**：代码底部存在 `include $_REQUEST['file'];`，这是执行文件包含的触发点。
- **防御机制**：代码中定义了 `checkFile()` 函数，利用 `$whitelist` 数组限制了只能包含 `source.php` 和 `hint.php`。
- **过滤逻辑缺陷**：`checkFile()` 的第三层利用 `mb_substr` 和 `mb_strpos` 截断了第一个 `?` 之前的内容，只比对 `?` 前的部分是否在白名单中，导致 `?` 后的任意内容被拼接执行。
#### Payload（攻击载荷）：?file=hint.php?/../../../../ffffllllaaaagggg
#### 现象：
在 URL 中构造上述 Payload 并访问，无需密码或特殊权限，成功读取到了根目录下的 `ffffllllaaaagggg` 文件
#### 解释：
1. **绕过白名单**：传入的 `file` 参数为 `hint.php?/../../../../ffffllllaaaagggg`。`checkFile()` 函数在第三层截取第一个 `?` 之前的内容，得到 `hint.php`。由于 `hint.php` 在白名单中，校验通过返回 `true`。
2. **目录穿越**：在校验通过后，`include` 函数执行的完整字符串是 `hint.php?/../../../../ffffllllaaaagggg`。由于 `?` 后的内容会被当作路径解析，系统从 `hint.php` 所在目录开始，利用多个 `../` 回退到系统根目录。
3. **最终读取**：回退到根目录后，拼接上目标文件名 `ffffllllaaaagggg`，成功读取文件
#### 工具：手工注入（源码审计 + URL 构造）
#### 修复/防御：
- **白名单严格校验**：不能仅仅截断 `?` 前的部分进行比对，必须严格限制用户输入（如使用 `basename()` 获取文件名，并禁止包含路径穿越符 `../`）。
- **禁用危险配置**：在 `php.ini` 中设置 `open_basedir` 限制 PHP 脚本只能访问特定目录，防止目录穿越。
- **避免动态包含**：尽量不要使用用户可控的参数去动态包含文件，改用固定的映射数组（如 `['page1' => 'file1.php']`）。
![[Pasted image 20261010135127.png|577]]

## 1.1. 相关技巧
### 1. 搜索技巧：Ctrl + F 

- **场景**：当“查看源代码”复制出大量带有 HTML 标签（如 `<span>`、`<br>`）的 PHP 代码时，肉眼阅读非常困难。
- **方法**：使用 `Ctrl + F` 调出浏览器搜索框，输入关键词如 `whitelist`（白名单）、`include`、`source.php`。
![[Pasted image 20261010141500.png]]
- **效果**：浏览器会瞬间定位到关键代码行，并高亮显示。你只需要看高亮部分附近的代码即可，这能极大地提高代码审计的效率
### 2. 代码审计技巧：过滤 HTML 标签

- **场景**：`highlight_file` 函数会将 PHP 代码渲染成带颜色的 HTML 标签（例如 `<span style="color: #0000BB">$whitelist</span>`）。
- **方法**：在阅读时，**忽略所有尖括号 `< >` 包围的标签**，只读里面的纯文本。
- **细节**：遇到 `&nbsp;` 当作空格
        遇到 `&gt;` 当作 `>`
        遇到 `&lt;` 当作 `<`
- 例如 `<span style="color: #007700">=&gt;</span>`，去掉标签还原后就是 `=>`。

### 3. 寻找漏洞的思维链路（从危险函数反推）

- **第一步：找 Sink（危险点）**：先看代码最后执行了什么危险操作（如 `include $_REQUEST['file']`）。
- **第二步：找 Filter（过滤器）**：看危险操作前面有什么限制条件（如 `emmm::checkFile()`）。
- **第三步：攻破 Filter**：集中精力分析过滤函数的逻辑，寻找逻辑漏洞（如本题的“只截取 `?` 之前的字符串进行白名单匹配”）。

### 4. 利用漏洞的思维链路（信息收集与路径构造）

- **信息收集**：从白名单中发现了 `hint.php` 这个没见过的文件，主动去访问它，获取了 `flag in ffffllllaaaagggg` 的关键线索。
![[Pasted image 20261010141724.png]]
![[Pasted image 20261010141548.png]]
- **路径构造**：在利用文件包含时，`../` 代表回退上一级目录。由于不知道目标服务器的具体目录深度（如 `/var/www/html/`），通常**多写几个 `../`**（如写 5 个），确保能回退到根目录，多写无害。
- **截断利用**：利用 `?` 截断白名单检查，同时 `?` 在文件包含路径中会被忽略，不影响最终的目录穿越。
  **本题在地址栏构造出最终的 Payload：**
  `http://ctf2.dasctf.com/source.php?file=hint.php?/../../../../ffffllllaaaagggg`

## 1.2 相关知识点
### 一、 PHP 基础语法与特性

#### 1. 变量与作用域
- **`$` 符号**：PHP 中所有变量都以 `$` 开头，如 `$page`、`$whitelist`。
- **引用传递（`&`）**：在 `checkFile(&$page)` 中，`&` 表示引用传递。这意味着在函数内部修改 `$page`，会直接改变外部传入的变量。这在本题中用于后续对 `$page` 进行 URL 解码和截断操作。
- **超全局变量**：`$_REQUEST`、`$_GET`、`$_POST` 等。本题使用了 `$_REQUEST['file']`，它包含了 GET、POST 和 COOKIE 提交的数据。
#### 2. 数组（Array）
- **定义**：`$whitelist = ["source"=>"source.php", "hint"=>"hint.php"];`
- **键值对**：`=>` 左边是键（Key），右边是值（Value）。
- **相关函数**：
    - `in_array($needle, $haystack)`：检查数组中是否存在某个值。本题中 `in_array($page, $whitelist)` 用于检查 `$page` 是否在白名单数组中。
    - `array_key_exists()`：检查数组中是否存在某个键。
#### 3. 类型判断与检查
- **`isset($var)`**：检测变量是否已设置并且非 NULL。
- **`is_string($var)`**：检测变量是否是字符串。
- **`empty($var)`**：检测变量是否为空（为空、0、false、空数组等均返回 true）。
- **逻辑运算符**：`&&`（与）、`||`（或）、`!`（非）。在 `if` 语句中常用于组合多个条件。
#### 4. 字符串操作（核心审计点）
- **`mb_substr($str, $start, $length)`**：获取字符串的部分。
-  本题中 `mb_substr($page, 0, mb_strpos($page . '?', '?'))` 用于截取从开头到第一个 `?` 之前的内容。
- **`mb_strpos($haystack, $needle)`**：查找字符串在另一字符串中第一次出现的位置。如果找不到，返回 `false`。
- **`urldecode($str)`**：解码 URL 编码的字符串（如 `%3F` 解码为 `?`）。本题第四层检查使用了它。
- **字符串拼接**：使用 `.` 符号，如 `$page . '?'`。
#### 5. 类与静态方法（面向对象）
- **`class emmm`**：定义一个类。
- **`public static function checkFile(&$page)`**：定义一个公有的静态方法。静态方法可以通过 `类名::方法名()` 直接调用，无需实例化对象。本题中调用方式为 `emmm::checkFile($_REQUEST['file'])`。

### 二、 PHP 文件包含与漏洞机制
#### 1. 文件包含函数
- **`include`**：包含并运行指定文件。如果文件不存在，会产生警告（Warning），但脚本会继续执行。
- **`require`**：与 `include` 类似，但如果文件不存在，会产生致命错误（Fatal Error），脚本终止。
- **`include_once` / `require_once`**：确保文件只被包含一次。
- **本题应用**：`include $_REQUEST['file'];`。这是漏洞的触发点，允许用户控制包含的文件路径。
#### 2. 路径解析机制（目录穿越）
- **`../`**：表示返回上一级目录。
- **绝对路径与相对路径**：如果传入绝对路径（如 `/etc/passwd`），则直接读取；如果是相对路径，则相对于当前脚本所在目录。
- **`?` 在路径中的作用**：在文件系统路径中，`?` 通常不是合法字符，但在 Web 服务器处理时，它会被当作查询字符串分隔符。在本题中，`hint.php?/../../...` 被 `include` 时，`?` 后面的内容会被当作路径的一部分进行解析，从而实现了路径穿越。
#### 3. `highlight_file` 函数
- **作用**：高亮显示文件内容（通常用于显示 PHP 源码）。
- **`__FILE__`**：这是一个魔术常量，表示当前文件的完整路径和文件名。
- **本题应用**：`highlight_file(__FILE__);` 使得访问 `source.php` 时，浏览器直接显示了该文件的源代码。这是题目故意泄露源码的方式。

### 三、 代码审计中的逻辑漏洞
#### 1. 检查与执行不一致
- **问题**：代码在 `checkFile()` 中检查的是 `$page` 截断后的部分（如 `hint.php`），但真正执行 `include` 时使用的是完整的 `$_REQUEST['file']`（如 `hint.php?/../../...`）。
- **后果**：检查逻辑看似严密，但实际执行时却可以利用 `?` 后面的内容进行攻击。
#### 2. 白名单绕过技巧
- **截断绕过**：利用 `?`、`#`、`%00`（空字节）等字符截断检查逻辑，使检查部分看起来合法，但实际执行部分包含恶意路径。
- **二次编码绕过**：利用 `urldecode()` 的多次解码特性，构造 `%253F` 等编码，绕过简单的 `?` 字符过滤。
#### 3. 防御策略
- **严格白名单**：不要检查用户输入的路径，而是将用户输入映射到固定的文件列表（如 `['page1' => 'file1.php']`）。
- **禁用目录穿越**：使用 `basename()` 函数去除路径中的目录部分，或者使用 `realpath()` 检查最终路径是否在允许的目录内。
- **配置 `open_basedir`**：在 `php.ini` 中限制 PHP 脚本只能访问特定目录，从根本上防止目录穿越。

## 2.==PHP 本地文件包含（LFI）+ `php://filter` 读源码（黑名单未拦截过滤器伪协议）==

#### 适用场景
PHP 页面用用户可控参数（如 `$_GET['file']`）做 `include` / `require`。  
直接包含目标 php 只会执行并回显，flag 写在注释或未输出代码里。  
后端用 `strstr` 黑名单拦了 `php://input`、`zip://`、`phar://`、`data:`，但没拦 `php://filter`

#### 前端特征
- 首页几乎无内容，仅一个 `tips` 链接：`?file=flag.php`
- 访问 `?file=flag.php` 只显示 `Can you find out the flag?`，无 flag 明文
- URL 存在可控包含参数 `file=`
- 直接打开 `/flag.php` 与 include 后现象相同（文件被当 PHP 执行）
#### payload
```
/?file=php://filter/convert.base64-encode/resource=flag.php
```
读入口源码（确认过滤逻辑）：
```
/?file=php://filter/convert.base64-encode/resource=index.php
```
#### 工具
浏览器访问 + Base64 解码（CyberChef / 在线解码 / `certutil` 均可）
#### 现象
过滤器返回一段 Base64：
![[Pasted image 20261010182158.png]]
```
PD9waHAKZWNobyAiQ2FuIHlvdSBmaW5kIG91dCB0aGUgZmxhZz8iOwovL0NURjJ7Nzk0MTFjMjUtYmEyNS00OTBhLWFhYmItNzIzMGFmMDYxZTFkfQo=
```
解码后：
```php
<?php
echo "Can you find out the flag?";
//CTF2{79411c25-ba25-490a-aabb-7230af061e1d}
```
#### 解释
1. `include($file)` 会把目标当 PHP 执行。`flag.php` 只 `echo` 一句话，flag 在 `//` 注释里，页面上看不到。
2. `php://filter/convert.base64-encode/resource=文件` 在包含前把文件转成 Base64 字符串再 include，相当于读源码而不是执行。
3. `index.php` 用 `strstr` 拦截部分伪协议，未包含 `php://filter`，payload 直接通过。
#### 防御
- 不要用用户输入当 `include` 路径；改用固定映射（如 `['home'=>'home.php']`）。
- 若必须动态包含：白名单校验真实路径（`realpath` + 限制目录），禁止 `../` 与所有 `php://`、`phar://`、`zip://`、`data:` 等伪协议。
- 敏感信息不要放在会被 include 的 php 注释里；flag 放不可 Web 访问的目录，并用 `open_basedir` 限制可读范围。
## 2.1相关知识点
- **LFI vs 直接访问**：include 执行 php；要看源码需 **filter / 包装器**，不能只看回显。
- **php://filter**：常用 `convert.base64-encode`；还可叠 `string.rot13` 等绕过对 `base64` 关键字的过滤。
- **黑名单伪协议**：本题拦了 `php://input`、`zip://`、`phar://`、`data:`，常见利用里后三者还可配合上传/phar 反序列化，filter 专用于读文件。
- **flag 常见藏法**：注释、未 echo 变量、`/flag`、环境变量、数据库。回显正常不等于没有秘密。
- **同类参数名**：`file` / `page` / `path` / `include` / `template`。

# ==🟣三、命令执行（Command Injection）==
## 1.==命令注入 。后端把 Ping 目标直接拼进系统命令==。

#### 适用场景
页面提供「Ping」等网络诊断功能，输入 IP/域名后由服务器执行 `ping`。输入未过滤或未用参数化/转义，可用 `;`、`|`、`&&`、`` ` ``、`$()` 拼接第二条命令。
![[Pasted image 20261010190314.png|499]]
#### 前端特征
- 标题为 `command execution`，页面大标题 `PING`
- 表单 `method="post"`，输入框 `name="target"`，占位符「请输入需要ping的地址」
- 提交后结果在 `<pre>` 中回显 ping 输出
#### payload
```
target=127.0.0.1
target=127.0.0.1;id
target=127.0.0.1;ls -la /
target=127.0.0.1;cat /flag
```
也可用：`127.0.0.1|id`、`127.0.0.1 && id`
#### 工具
浏览器提交表单，或 POST：`target=127.0.0.1;cat /flag`
#### 现象
- 只 ping：127.0.0.1 中出现 ICMP 统计
- `;id`：ping 输出后多一行 `uid=82(www-data)`
- `|id`：只显示 `id` 结果（管道吃掉 ping 输出）
- `ls -la /`：根目录有 `flag` 文件
- `cat /flag`：查看flag文件
#### 解释
1. 服务端类似 `ping -c 3 $target`，`$target` 未过滤。
2. `;` 在 shell 里分隔命令，先 ping 再执行后面的命令。
3. `|` 把 ping 的输出当下一命令的输入，页面往往只看到第二条命令的结果。
4. 本题 Web 目录只有 `index.php`，flag 在容器根目录 `/flag`。
#### 防御
- 不要把用户输入拼进 shell；需要 ping 时用白名单（仅 IP/域名字符）或禁用 shell 的 API。
- 过滤/转义 `; | & $ ( ) \` \n` 等，且不要只拦一种分隔符。
- Web 进程低权限，flag 不放在 www 可读的随意路径；能禁用的函数在 `disable_functions` 里关掉。
## 1.1相关知识点
- **命令分隔**：`;` 顺序执行；`&&` 前面成功才执行后面；`||` 前面失败才执行后面；`|` 管道；`` `cmd` `` / `$(cmd)` 命令替换（**把里面的命令先执行了，再把结果当作普通文本，塞回原来的位置**）
- **先确认回显再找 flag**：正常 ping → `id`/`whoami` → `ls` 当前目录与 `/` → `cat /flag`、`/flag.txt`。
- **过滤绕过（本题未拦）**：空格改 `$IFS`、关键字拆分、编码；有过滤时再考虑。
- **和代码执行的区别**：本题是 OS 命令注入（shell）；代码执行是 `eval`/`system` 等语言层。Ping 题优先想命令注入。

# ==🟣四、信息泄露（Information Disclosure）==
## 1.==HTML 注释泄露逻辑 + GET 参数弱判断==

#### 适用场景
页面几乎无交互，但源码/注释里写了 PHP 逻辑（参数名、比较值、假 flag）。把注释当提示，按注释构造 URL 即可触发真实输出。

#### 前端特征
- 标题「一起来撸猫」，CSS 动画猫，无表单
- 页脚 `Syclover @ cl4y`
- 查看源代码可见 HTML 注释：
```php
$cat=$_GET['cat'];
echo $cat;
if($cat=='dog'){
    echo 'Syc{cat_cat_cat_cat}';
}
```

#### payload
```
/?cat=dog
```

#### 工具
浏览器「查看网页源代码」（Ctrl+U）+ 改 URL 参数

#### 现象
- 不带参数：只有猫和注释里的假 flag 格式 `Syc{...}`
- `?cat=dog`：页面中出现平台真 flag `CTF2{ccab6347-73e0-4e2c-a38b-e52c3971ceaa}`
- 注释中的 `Syc{cat_cat_cat_cat}` 是诱饵，格式与 DASCTF 的 `CTF2{uuid}` 不符

#### 解释
1. 后端按注释所述读取 `$_GET['cat']`，等于 `dog` 时 echo 真 flag。
2. 注释把参数名、比较值直接写在前端，等于把后门条件公开。
3. 注释里的 flag 是误导；以赛题规定格式为准。

#### 防御
- 不要把真实业务逻辑、比较口令、flag 写进 HTML 注释。
- 敏感判断放服务端，且不要用可猜测的明文条件。
- 前端注释默认视为会泄露，上线前清掉调试代码。

## 1.1相关知识点
- **先看源码**：静态页也要 Ctrl+U / F12，搜 `flag`、`GET`、`<!--`。
- **假 flag**：格式不对（本题 `Syc{` vs `CTF2{`）先当诱饵，仍按注释逻辑打一遍。
- **弱判断**：`==` 明文比较 GET 参数，知道值就能过；不是注入，是条件被写死并泄露。
- **同类点**：`robots.txt`、`.git`、`<!-- todo -->`、JS 里的 api key，都是信息泄露而不是「打漏洞」。


