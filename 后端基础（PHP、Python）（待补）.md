# 一、PHP
    PHP 是一种创建动态交互性站点的强有力的服务器端脚本语言
    Hypertext Preprocessor，即：超文本预处理器
    通过 PHP，不再限于输出 HTML。可以输出图像、PDF 文件，甚至 Flash 电影。还可以输出任意的文本，比如 XHTML 和 XML
#### PHP文件
- PHP 文件可包含文本、HTML、JavaScript代码、 PHP 代码
- PHP 代码==在服务器上执行==，结果==以纯 HTML 形式返回给浏览器==
- PHP 文件的默认文件扩展名是 .php。
#### PHP能做的
- 生成动态页面内容
- 创建、打开、读取、写入、关闭服务器上的文件
- 收集表单数据
- 发送和接收 cookies
- 添加、删除、修改您的数据库中的数据
- 限制用户访问网站上的一些页面
- 加密数据
#### PHP 集成服务器组件（集成环境包）
- WampServer：Windows 专属集成包
- XAMPP：跨平台老牌国外集成包
- phpstudy：国产中文集成包
#### IDE (集成开发环境)
- PhpStorm（收费）
- Eclipse for PHP（免费）
- VS Code 
 基于 VS Code 开发的 AI IDE：
- **字节 Trae：**[https://www.trae.cn/](https://www.trae.cn/sem/?utm_source=advertising&utm_medium=runoob_ug_cpa&utm_term=hw_trae_runoob)
- **阿里 Qoder：**[https://qoder.com/](https://qoder.cn/referral?utm_source=paid&utm_medium=affiliate&utm_campaign=cainiaojiaocheng)

## 1. PHP语法
    PHP 脚本在服务器上执行，然后将纯 HTML 结果发送回浏览器。
    PHP 使用 <?php ?> 包裹代码

![[Pasted image 20261009171602.png]]
![[Pasted image 20261009171635.png]]
![[Pasted image 20261009172026.png]]
例如：
![[Pasted image 20261009171907.png]]
它可以向浏览器输出文本 "Hello World!"

## 2. PHP中的注释
    不会被执行，也不会输出到页面上

![[Pasted image 20261009173105.png]]

![[Pasted image 20261009172252.png]]

![[Pasted image 20261009172848.png|356]]

![[Pasted image 20261009172933.png]]

## 3. PHP变量
    变量是用于存储信息的"容器"
    PHP 是一门 弱类型语言，不必向 PHP 声明该变量的数据类型。
    PHP 会根据变量的值，自动把变量转换为正确的数据类型。

![[Pasted image 20261009173504.png]]
例如：
![[Pasted image 20261009173517.png]]
输出结果为11

## 4. PHP 变量作用域
    变量的作用域是脚本中变量可被引用/使用的部分。
    PHP 有四种不同的变量作用域：
     local
     global
     static
     parameter
 
#### （1）局部、全局作用域
    在所有函数外部定义的变量，拥有全局作用域。
    除了函数外，全局变量可以被脚本中的任何部分访问，要在一个函数中访问一个全局变量，需要使用
    global 关键字。
    
    在 PHP 函数内部声明的变量是局部变量，仅能在函数内部访问

例如：
![[Pasted image 20261009174737.png]]
输出：
![[Pasted image 20261009175446.png]]
![[Pasted image 20261009175748.png]]

#### （2）global 关键字
    global 关键字用于函数内访问全局变量。
    在函数内调用函数外定义的全局变量，我们需要在函数中的变量前加上 global 关键字

例如：
![[Pasted image 20261009180037.png]]

![[Pasted image 20261009223600.png|700]]
![[Pasted image 20261009223609.png]]

#### （3）Static 作用域
    当一个函数完成时，它的所有变量通常都会被删除。
    但有时候希望某个局部变量不要被删除，因此，在第一次声明变量时使用 static 关键字

例如：
![[Pasted image 20261009224310.png]]
输出：
![[Pasted image 20261009224452.png|279]]
每次调用该函数时，该变量将会保留着函数前一次被调用时的值

#### （4）参数作用域
    参数是通过调用代码将值传递给函数的局部变量。
    参数是在参数列表中声明的，作为函数声明的一部分

例如：
![[Pasted image 20261009225351.png]]

## 5. echo 和 print 语句

![[Pasted image 20261009230802.png]]

#### （1） echo 语句
    使用的时候可以不用加括号，也可以加上括号： echo 或 echo()

使用 echo 命令输出字符串（字符串可以包含 HTML 标签）：
![[Pasted image 20261009230940.png]]
输出：
![[Pasted image 20261009231008.png]]

使用 echo 命令输出变量和字符串：
![[Pasted image 20261009231105.png]]
输出：
![[Pasted image 20261009231116.png]]

#### （2）print语句
    可以使用括号，也可以不使用括号： print 或 print()

使用 print 命令输出字符串（字符串可以包含 HTML 标签）：
![[Pasted image 20261009231815.png]]
输出：
![[Pasted image 20261009231830.png]]

使用 print 命令输出变量和字符串：
![[Pasted image 20261009231848.png]]
输出：
![[Pasted image 20261009231925.png]]

## 6. PHP EOF
    PHP EOF(heredoc)是一种在命令行shell（如sh、csh、ksh、bash、PowerShell和zsh）和程序语言（像Perl、PHP、Python和Ruby）里定义一个字符串的方法。

![[Pasted image 20261009232405.png]]
例如：
![[Pasted image 20261009233319.png]]
![[Pasted image 20261009233329.png]]
输出：
![[Pasted image 20261009233342.png]]
![[Pasted image 20261009233354.png]]
![[Pasted image 20261009233403.png]]
输出：
![[Pasted image 20261009233415.png]]

![[Pasted image 20261009232615.png]]
例如：
![[Pasted image 20261009232640.png]]
输出：
![[Pasted image 20261009233052.png|291]]

## 7. PHP数据类型
    PHP 变量存储不同的类型的数据，不同的数据类型可以做不一样的事情
    
    PHP 包含以下数据类型:
     String（字符串）
     Integer（整型）
     Float（浮点型）
     Boolean（布尔型）
     Array（数组）
     Object（对象）
     NULL（空值）
     Resource（资源类型）

[var_dump()](https://www.runoob.com/php/php-var_dump-function.html) 函数返回变量的数据类型和值
#### （1）PHP字符串
    一个字符串是一串字符的序列，就像 "Hello world!"
    可以将任何文本放在单引号和双引号中：

例如：
![[Pasted image 20261009234712.png]]
输出：
![[Pasted image 20261009234732.png]]

#### （2）PHP整型
    整数是一个没有小数的数字。
    
    整数规则:
    整数必须至少有一个数字 (0-9)
    整数不能包含逗号或空格
    整数是没有小数点的
    整数可以是正数或负数
    整型可以用三种格式来指定：十进制， 十六进制（ 以 0x 为前缀）或八进制（前缀为 0）。

 例如：
![[Pasted image 20261009235438.png]]
输出：
![[Pasted image 20261009235451.png|139]]

#### （3）PHP布尔型
    布尔型可以是 TRUE 或 FALSE
    布尔型通常用于条件判断

![[Pasted image 20261009235859.png|181]]

#### （4）PHP数组
    数组可以在一个变量中存储多个值

例如：
![[Pasted image 20261010000030.png]]
输出：
![[Pasted image 20261010000339.png]]

#### （5）PHP对象
    对象数据类型也可以用于存储数据。
    在 PHP 中，对象必须声明。

首先，必须使用 class关键字 声明类对象。类是可以包含属性和方法的结构。
然后在类中定义数据类型，然后在实例化的类中使用数据类型：
![[Pasted image 20261010001653.png|669]]
输出：
![[Pasted image 20261010001716.png|275]]

#### （6）PHP NULL值
    NULL 值表示变量没有值。NULL 是数据类型为 NULL 的值。
    NULL 值指明一个变量是否为空值。同样可用于数据空值和NULL值的区别。

可以通过设置变量值为 NULL 来清空变量数据：
![[Pasted image 20261010002811.png]]
输出：
![[Pasted image 20261010002827.png]]

#### （7）PHP资源类型
    PHP 资源 resource 是一种特殊变量，保存了到外部资源的一个引用（即：用来操作外部东西）
    
    常见资源数据类型：打开文件、数据库连接、图形画布区域等。
    由于资源类型变量保存有为打开文件、数据库连接、图形画布区域等的特殊句柄，因此将其它类型的值转换为资源没有意义。

![[Pasted image 20261010003409.png]]
例如：
![[Pasted image 20261010004310.png]]

## 8. PHP类型比较








