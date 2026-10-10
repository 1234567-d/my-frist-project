## 一、网页与前端

==网页==：网页是在**浏览器中呈现内容的文档或页面**。通常使用 HTML编写，网页包括：*HTML、CSS、JS。*
==前端==：前端是**构建网页的一部分**。前端开发是**创建网页的过程**，它涵盖了 HTML、CSS 和 JS的开发。前端开发人员负责将 UI 设计的的页面转化为可在浏览器中渲染的实际网页。

==HTML==（Hypertext Markup Language）：是**网页的骨架**，定义页面的结构，包括标题、段落、图像、链接等。
==CSS==（Cascading Style Sheets）：用于**控制页面的样式、外观**，包括字体、颜色、间距、布局等。它使网页看起来漂亮且一致。
==JS==（JavaScript）：是一种编程语言，**用于添加交互性、动态性**。前端开发人员使用JS来创建动态元素、处理用户输入、与服务器通信等，以提供更丰富的用户体验。

**总结**：*网页是通过前端开发来创建和维护的，前端技术包括 HTML、CSS 和 JavaScript，它们共同构建了用户在浏览器中看到和与之交互的内容。前端开发的目标是提供具有吸引力、易用性和高性能的网页。*

**VS code安装扩展插件**：
==Chinese (Simplified)==
==HTML CSS Support== 这是写 CSS 代码快捷神器
==Live Server== 这个插件可以让你在浏览器中实时预览页面的变化
==Auto Rename Tag== 这个插件可以让你在修改 HTML 标签的时候同步修改与之匹配的另一个标签。

**VS code 中 Windows常用快捷键**：
-  Ctrl + S ：保存
-  !  + Tab：生成HTML基础模板
-  Ctrl + / ：快速注释代码
-  Alt + ↑ / ↓ ：整行代码上下移动

## 二、HTML（超文本标记语言）
    它描述了页面的语义结构，使浏览器能够正确地显示和解释内容。它使用一系列的标签（也称为元素）来定义文本、图像、链接、表格等在网页上的排布和呈现方式。

![[Pasted image 20260922160000.png]]
### 1. 在 HTML 中，标签分为2种主要类型：
==单标签（Self-Closing Tags）：==
- 单标签通常**用于表示没有内容的元素**，例如图像、换行、横线等。
- 它们以自封闭的方式出现，不需要闭合标签，因为它们没有内部内容。
- 单标签的典型形式是 `<tagname>`，其中 tagname 是标签名称。
- 例：`<img src="image.jpg" />` 表示插入一张图片，而 `<br>` 表示换行。
==双标签（Paired Tags）：==
- 双标签**用于定义包含内容的元素**，例如段落、标题、列表等。
- 它们由两部分组成：**开始**标签和**结束**标签，成对使用，其分别定义开始和结束位置。
- 在开始标签和结束标签之间可以包含元素的内容。 
- 例：段落标签：`<p>这是一段文字</p>`，`<p>` 和 `</p>` 包住段落内容
     标题标签：`<h1>一级标题</h1>`
     列表：`<li>列表项</li>`

### 2. 一个 HTML 文档通常由以下部分组成：
![[Pasted image 20260922161925.png]]

### 3.HTML 的基本语法
![[Pasted image 20260922164040.png|518]]
渲染效果
![[Pasted image 20260922180028.png]]

![[Pasted image 20260922164714.png]]
渲染效果
![[Pasted image 20260922180005.png]]

![[Pasted image 20260922165649.png]]
![[Pasted image 20260922175938.png]]
渲染效果
![[Pasted image 20260922175812.png]]

![[Pasted image 20260922170549.png|643]]
![[Pasted image 20260922170950.png|643]]

![[Pasted image 20260922170639.png|643]]
![[Pasted image 20260922180203.png]]
渲染效果
![[Pasted image 20260922180116.png|578]]

![[Pasted image 20260922170718.png]]

### 4.属性
    属性在 HTML 中用于定义元素的行为和外观，以及与其他元素的关系。每个元素都可以有一个或多个属性

==属性的基本语法==：
![[Pasted image 20260922172455.png]]
    属性名：用于标识该属性
    属性值：定义该属性的值
    属性值一般要用引号将其括起来，可以是**单引号**、**双引号**
    例：
![[Pasted image 20260922172342.png]]

==常见属性：==
![[Pasted image 20260922172741.png]]
![[Pasted image 20260922174802.png]]

![[Pasted image 20260922175156.png]]
![[Pasted image 20260922175337.png]]

![[Pasted image 20260922175535.png]]
渲染效果：![[Pasted image 20260922175734.png]]

*以上3种是所有标签都有的属性，也有一些标签具有独特的属性，比如 a 标签的 href 属性，img 标签的 src 属性等等。*

### 5.区块
    当涉及到 HTML 元素时，可以将它们分为两个主要类别：行内元素 和 块级元素

==块级元素（block）==：
通常用于组织和布局页面的主要结构和内容，例如**段落、标题、列表、表格**等。它们用于创建页面的主要部分，将内容分隔成逻辑块。
![[Pasted image 20260922181045.png]]
==行内元素（inline）==：
通常用于添加文本样式或为文本中的一部分应用样式。它们可以在文本中插入小的元素，例如**超链接、强调文本**等。
![[Pasted image 20260922181309.png]]

![[Pasted image 20260922181456.png]]
渲染效果
![[Pasted image 20260922181657.png]]

### 6.表单 form 标签
    用于收集和提交用户输入的数据。表单允许用户输入文本、选择选项、上传文件等，然后将这些数据提交到服务器进行处理。
    一个基本的 HTML 表单由以下几个主要部分组成：

![[Pasted image 20260923165945.png]]
![[Pasted image 20260923170107.png]]
![[Pasted image 20260923170229.png]]

![[Pasted image 20260923171915.png]]
例如：
![[Pasted image 20260923172133.png]]
![[Pasted image 20260923173923.png]]
![[Pasted image 20260923174026.png]]
![[Pasted image 20260923174055.png]]
![[Pasted image 20260923174435.png]]
渲染效果：
![[Pasted image 20260923172322.png]]

![[Pasted image 20260923172501.png]]

例：使用表单来写一个用户注册的页面
![[Pasted image 20260923174837.png]]
渲染效果：
![[Pasted image 20260923175037.png]]



## 三、CSS
    用于定义网页样式和布局的样式表语言。它与 HTML 一起用于构建 Web 页面，HTML 负责定义页面的结构和内容，而 CSS 则负责控制页面的外观和样式。
    CSS 规则通常由选择器、属性和属性值组成，多个规则可以组合在一起，以便同时应用多个样式

==CSS基本语法：==
![[Pasted image 20260924121534.png]]
![[Pasted image 20260924133440.png]]

#### 1.三种常见的 CSS 导入方式
![[Pasted image 20260924122556.png]]
渲染效果：
![[Pasted image 20260924122851.png]]

![[Pasted image 20260924132009.png]]
渲染效果：
![[Pasted image 20260924132205.png]]

![[Pasted image 20260924132332.png]]
![[Pasted image 20260924132453.png]]
![[Pasted image 20260924133112.png]]
渲染效果：
![[Pasted image 20260924132745.png]]

![[Pasted image 20260924133340.png]]

#### 2.选择器（Selectors）
    用于选择要应用样式的 HTML 元素。可以选择所有的元素、特定元素、特定类或 ID 的元素，甚至更多。选择器位于规则的开头。

![[Pasted image 20260924134026.png]]
例如：
![[Pasted image 20260926214616.png]]
![[Pasted image 20260926214641.png]]
![[Pasted image 20260926214714.png]]
![[Pasted image 20260926214734.png]]
![[Pasted image 20260926214802.png]]
![[Pasted image 20260926214956.png]]
渲染效果：
![[Pasted image 20260924135051.png]]
鼠标悬停伪类选择器会出现紫色：
![[Pasted image 20260926215302.png|366]]

![[Pasted image 20260926215831.png]]

#### 3.CSS样式属性
[CSS 参考手册 | 菜鸟教程](https://www.runoob.com/cssref/css-reference.html)
 CSS 常用的样式属性：
![[Pasted image 20260926220238.png]]

#### 4.盒子模型
    是 CSS 中一种用于布局的基本概念，它描述了文档中的每个元素都被看作是一个矩形的盒子，这个盒子包含：内容、内边距、边框、外边距

![[Pasted image 20260926220534.png]]
![[Pasted image 20260926220602.png]]
![[Pasted image 20260928182658.png]]
![[Pasted image 20260928183143.png]]
![[Pasted image 20260928183206.png]]
![[Pasted image 20260928183305.png]]
![[Pasted image 20260928183513.png]]
![[Pasted image 20260928183621.png]]

 渲染效果：
![[Pasted image 20260928182930.png|648]]

#### 5.浮动（float）
    网页布局的本质其实就是通过块元素来放置盒子，把盒子放在相应的位置。

###### **（1）传统的网页布局方式**： ==标准流（普通流、文档流）== 、==浮动== 、 ==定位== 
    这三种传统布局方式都是用来摆放盒子的，盒子摆放到合适位置，布局自然完成了。
  多个块级元素**纵向排列**用 ==`标准流`==
  多个块级元素**横向排列**用 ==`浮动`==

![[Pasted image 20260928185004.png]]
###### （2）**浮动的三大特性：**
![[Pasted image 20260928185535.png]]
![[Pasted image 20260929150338.png]]

![[Pasted image 20260929150644.png]]
![[Pasted image 20260929150752.png|601]]
![[Pasted image 20260929151549.png]]
渲染效果：
![[Pasted image 20260929151136.png]]

![[Pasted image 20260929152352.png]]


###### （3）清除浮动
    清除浮动是为了解决浮动元素可能引起的布局问题，特别是在包含浮动元素的容器的高度无法自动适应内部浮动元素的情况下。常见的清除浮动的方法包括以下几种：

![[Pasted image 20261001135400.png]]
![[Pasted image 20261001135136.png]]
![[Pasted image 20261001135150.png]]
![[Pasted image 20261001135205.png]]
渲染效果：
![[Pasted image 20260929153701.png]]

![[Pasted image 20261001135430.png]]
![[Pasted image 20261001135246.png]]
![[Pasted image 20261001135302.png]]
![[Pasted image 20261001135325.png]]
渲染效果：
![[Pasted image 20260929155507.png]]


![[Pasted image 20261001140041.png]]
![[Pasted image 20261001140110.png]]
![[Pasted image 20261001140127.png]]
![[Pasted image 20261001140403.png]]
缺点：
![[Pasted image 20261001140634.png]]
渲染效果：
![[Pasted image 20261001140330.png]]

###### ==三种清除浮动方法对比==

| 方法                        | 核心原理                         | 优点               | 缺点                |
| ------------------------- | ---------------------------- | ---------------- | ----------------- |
| 1. 空块级 div + clear:both   | 在浮动元素后面新增真实空标签，设置 clear:both | 逻辑简单，好理解         | HTML 增加冗余空标签，结构混乱 |
| 2. 伪元素 clearfix (::after) | CSS 生成虚拟空元素，设置 clear:both    | 无多余 HTML 标签，生产推荐 | 代码稍长，需要理解伪元素      |
| 3. overflow:hidden（BFC）   | 给父容器开启 BFC，BFC 会计算内部浮动高度     | 代码最少，一行搞定        | **会裁剪溢出内容，有副作用**  |


#### 6.定位
    一种用于控制元素在网页上的位置的布局技术。通过定位，可以将元素放置在页面的特定位置，而不受文档流的约束。CSS 提供了几种定位属性，包括：相对定位、绝对定位、固定定位
    通常，相对定位用于微调元素的位置，而绝对、固定定位用于创建复杂的布局。

![[Pasted image 20261001141714.png]]

![[Pasted image 20261001141943.png]]
![[Pasted image 20261001141959.png]]
![[Pasted image 20261001142313.png]]
![[Pasted image 20261001142353.png]]
渲染效果：
![[Pasted image 20261001141852.png]]

![[Pasted image 20261001142447.png]]
![[Pasted image 20261001142528.png]]
![[Pasted image 20261001142540.png]]
![[Pasted image 20261001142921.png]]
渲染效果：
![[Pasted image 20261001142644.png]]

![[Pasted image 20261001143229.png]]
![[Pasted image 20261001143248.png]]
![[Pasted image 20261001143753.png]]
![[Pasted image 20261001143642.png]]
渲染效果：
![[Pasted image 20261001143457.png]]
向下滚动后：
![[Pasted image 20261001143536.png]]

###### ==三种定位对比==

| 定位   | 属性         | 是否脱离文档流 | 参照物                 | 特点                              |
| ---- | ---------- | ------- | ------------------- | ------------------------------- |
| 相对定位 | `relative` | ❌ 不脱离   | **自己原来的位置**         | 占位保留，视觉偏移；常用作父容器给子 absolute 做参考 |
| 绝对定位 | `absolute` | ✅ 脱离    | 最近非 static 祖先，无则为页面 | 不占位；父 relative，子 absolute 经典组合  |
| 固定定位 | `fixed`    | ✅ 脱离    | 浏览器窗口               | 页面滚动，元素不动；常用于悬浮按钮               |
![[Pasted image 20261001144002.png]]



## 四、JavaScript
    是一种轻量级、解释型、面向对象的脚本语言。它主要被设计用于在网页上实现动态效果，增加用户与网页的交互性。作为一种客户端脚本语言，JavaScript 可以直接嵌入 HTML，并在浏览器中执行。与 HTML 和 CSS 不同，JavaScript 使得网页不再是静态的，而是可以根据用户的操作动态变化的
    使开发者可以通过处理用户输入、修改页面内容、与服务器进行交互等方式，为用户提供丰富体验的网页

![[Pasted image 20261001144912.png]]

#### 1. 常见的JavaScript 的导入方式
    在网页开发中，JavaScript 可以通过多种方式导入到 HTML 文档中

![[Pasted image 20261001145302.png]]

![[Pasted image 20261001193533.png]]
![[Pasted image 20261001193617.png]]

#### 2. JavaScript基本语法
    变量、数据类型、操作符、控制流程和函数等基本概念

![[Pasted image 20261001194646.png|646]]
![[Pasted image 20261001194924.png|646]]

![[Pasted image 20261001195040.png]]
![[Pasted image 20261001195130.png|646]]

![[Pasted image 20261001195159.png|646]]

![[Pasted image 20261001195219.png]]
![[Pasted image 20261001200121.png|646]]

![[Pasted image 20261001201101.png]]
![[Pasted image 20261001201149.png]]
![[Pasted image 20261001202134.png]]
![[Pasted image 20261001202441.png]]
以上3个示例输出：
![[Pasted image 20261001202036.png]]
控制循环方式：
![[Pasted image 20261001202943.png|646]]
示例输出：
![[Pasted image 20261001202902.png]]

![[Pasted image 20261001203125.png]]
![[Pasted image 20261002191940.png]]
![[Pasted image 20261002193218.png]]
![[Pasted image 20261002193231.png]]
![[Pasted image 20261002193241.png]]

![[Pasted image 20261002193428.png]]
![[Pasted image 20261002193904.png]]
![[Pasted image 20261002195018.png]]
![[Pasted image 20261002195006.png|652]]
![[Pasted image 20261002195112.png]]

#### 3.事件
    事件是文档或浏览器窗口中发生的特定瞬间，例如用户的点击、键盘的按下、页面的加载等。
    常见的事件如下：

![[Pasted image 20261002201439.png]]

![[Pasted image 20261002201724.png|652]]
==三者对比：==

|方式|写法特点|能否绑定多个同类型事件|
|---|---|---|
|HTML 行内 onclick|写在标签上 `onclick="xxx()"`|不推荐，混合代码|
|DOM 属性 onclick|`元素.onclick = 函数`|❌会覆盖，只能 1 个|
|addEventListener|`元素.addEventListener('click',函数)`|✅可绑定多个，互不覆盖|

例如：
![[Pasted image 20261002204833.png]]
渲染效果：
![[Pasted image 20261002202536.png]]
![[Pasted image 20261002202630.png]]
![[Pasted image 20261002202612.png]]
![[Pasted image 20261002202702.png]]

#### 4. DOM 操作
    DOM（文档对象模型），DOM操作允许开发者通过 JavaScript 与 HTML 文档交互，动态地改变文档的结构、样式和内容。
    当网页被加载时，浏览器会创建页面的文档对象模型，也就是 DOM（Document Object Model）
    对象的作用：让函数和变量之前建立关系，对象中的属性就是变量，方法就是函数。与普通的变量、函数相比，区别就是在调用的使用前面需要加对象名

1. 在 Web 开发中，DOM 通常与 JavaScript 一起使用；
2. 每个 HTML 或 XML 文档都可以被视为一个**文档树**（整个文档的层次结构表示）；
3. 每个节点都有：**父节点**、**子节点**、**同级节点** ；
4. **文档节点**：指整个文档树的**根节点**；
5. DOM 为这个文档树提供了一个编程接口，开发者可以使用 JavaScript 来操作这个树状结构。
![[Pasted image 20261002210040.png]]
![[Pasted image 20261004194006.png]]
![[Pasted image 20261004194105.png]]
![[Pasted image 20261004194234.png]]
例如：
![[Pasted image 20261004194941.png]]
![[Pasted image 20261004195017.png]]
渲染效果：
![[Pasted image 20261004195045.png]]

![[Pasted image 20261004195112.png]]

![[Pasted image 20261004195122.png]]

![[Pasted image 20261004195134.png]]


![[Pasted image 20261004194642.png]]

![[Pasted image 20261004200427.png]]
例如：
![[Pasted image 20261004202111.png]]
![[Pasted image 20261004202139.png|700]]
![[Pasted image 20261004202203.png]]
![[Pasted image 20261004202221.png]]
![[Pasted image 20261004202237.png]]
![[Pasted image 20261004202248.png]]
渲染效果：
![[Pasted image 20261004201047.png]]
添加新行：
![[Pasted image 20261004201101.png]]
编辑选中的行名字：
![[Pasted image 20261004201123.png]]

![[Pasted image 20261004201140.png]]
删除所有行：
![[Pasted image 20261004201158.png]]

## 5. 移动端自适应布局
    移动端页面需要具备响应式设计，以适应不同大小和分辨率的移动设备屏幕。使用流体网格布局、弹性图片和媒体查询等技术，确保页面在各种设备上都能良好显示。
    采用适合移动设备的布局方式，以确保用户在小屏幕上浏览时获得良好的用户体验。

对于搞开发的来说，一般用：Chrome、火狐浏览器、 Edge 浏览器
![[Pasted image 20261005132706.png]]
![[Pasted image 20261005132740.png]]

![[Pasted image 20261005132957.png]]
![[Pasted image 20261005133117.png]]

#### 1. 移动端适配原理

###### 在 VSCode 中自动生成的 head 标签中的 viewport：
    viewport 即： 视区 或者 视口。指浏览器用来显示网页的区域，其决定网页在用户设备上的显示效果；由于移动设备和桌面设备有不同的屏幕尺寸和分辨率，使用视口可以使网页在不同设备上得到合适的显示。

![[Pasted image 20261005133923.png]]
![[Pasted image 20261005134139.png]]

![[Pasted image 20261005135231.png]]
![[Pasted image 20261005135207.png]]

![[Pasted image 20261005140955.png]]
![[Pasted image 20261005140938.png]]

![[Pasted image 20261005142317.png]]

新旧浏览器兼容方法：多写一个绝对单位的声明
![[Pasted image 20261005141445.png]]
![[Pasted image 20261005141804.png]]


#### 2. Flex 布局（弹性盒子布局）
    是一种用于在容器中进行布局的模型，它使得容器的子元素能够以弹性的方式排列，即实现横向 / 纵向排列、居中、自适应。可以配合 rem 处理尺寸以适应不同屏幕尺寸和设备

![[Pasted image 20261006133414.png]]

 1. **Flex 容器**（flex container）：采用 Flex 布局的元素
 2. **Flex 项目**（flex item）：Flex 容器的所有子元素自动成为容器成员
![[Pasted image 20261006133635.png|699]]

![[Pasted image 20261006134301.png]]

![[Pasted image 20261006134505.png]]

![[Pasted image 20261006134532.png]]

![[Pasted image 20261006134556.png]]

![[Pasted image 20261006135002.png]]
![[Pasted image 20261006135223.png]]
![[Pasted image 20261006135244.png]]
![[Pasted image 20261006140007.png]]


#### 3.  媒体查询
    可以让我们根据设备显示器的特性（如视口宽度、屏幕比例、设备方向：横向或纵向）为其设定 CSS 样式，媒体查询组成：媒体类型、一个或多个检测媒体特性的条件表达式。
    媒体查询中可用于检测的媒体特性： width 、 height 、 color（等）

![[Pasted image 20261006140441.png]]

![[Pasted image 20261006140520.png]]
![[Pasted image 20261006140600.png]]
![[Pasted image 20261006141618.png]]
![[Pasted image 20261006192017.png]]
![[Pasted image 20261006192132.png]]
![[Pasted image 20261006192432.png]]

![[Pasted image 20261006192706.png]]
![[Pasted image 20261006192919.png]]
![[Pasted image 20261006193147.png]]
![[Pasted image 20261006193101.png]]






