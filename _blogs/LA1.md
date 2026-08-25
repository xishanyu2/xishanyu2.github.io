---
title: Afterword of Linear Algebra (1)
date: 2026-08-25
permalink: /blogs/LA1
---

It's 2026, why do I learn Linear Algebra again?

2026年暑假，我花10天时间学完了[Gilbert Strang教授的MIT18.06线性代数课程](https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/)。

一、我的线代学习之路

我的线代学习之路可谓一波三折。大学时期，我曾不止一次学习宋浩的线性代数课程，但都一直止步于第一章行列式；在学校也听过不同老师讲线性代数，大多也是从行列式讲起；虽然学了很多线代的计算方法与技巧，但一直不得其道，于是我收获了我大学里唯一一门没有上80分的课程（一门线代毁了我的✕✕梦(bushi)）。在此之后，我对线性代数“补完”的愿望愈发强烈，在2024年暑假，我又学习了[刘思齐老师的课程](https://www.bilibili.com/video/BV1sH4y1S7gm/?spm_id_from=333.1387.homepage.video_card.click)，虽然只学到特征值和特征向量一章，稍显吃力便没有继续之后的内容，现在也几乎忘光了，但却开始从一个更高的维度重新审视线性代数。

BTW，647老师的课程最有趣的当属每一条视频下的简介，我这个网站设立的初衷深受刘老师主页个签“知识理应共享”的影响。

我的高数成绩中规中矩、差强人意，概率、统计、计量学得都不错，这说明并不是我的“数学能力”有问题，那只能是“外部知识源”和我不适配，所以选择一本适合的教材尤为重要。


二、线性代数应该从何开始

经常刷知乎可以看到，在一些“国内教材和国外教材对比”、"线性代数听不懂"类似的帖子下面，同济版紫皮线代教材一定“榜上有名”、赫然在列。不同于高数、概率论有相对统一的教材，线代的教材五花八门，大多又是照搬同济版。

<div align="center">
  <img src="https://img11.360buyimg.com/n1/jfs/t1/85527/5/10639/142407/5e1d18ffE13d50a14/a55310e47e582524.jpg" width="200" />
  <img src="https://img.alicdn.com/i3/859515618/O1CN013B2uIt1rN5tKz6Mwh_!!859515618.jpg" width="200" />
</div>  

以我所在的学校为例，除去数学、统计这种需要学习“高等代数”的专业，和一些学习“文科高等数学”的对线代谈及尚浅，剩下的理工科、商科对线代的要求应该在同一难度——比如材料学院、电光学院、商学院使用的都是同济紫皮线代，而化学院用的是Lay的《线性代数及其应用》，软件学院用的川大出的《高等数学（第三册）》，经济、金融用的又是自己学校出的经管类教材，更多的学院又有更多不同的教材......（不同年份、不同授课教师教材选用可能会有差异）下图为我校经济学专业大类和伯苓班教材：

<div align="center">
  <img src="https://img14.360buyimg.com/pop/jfs/t1/142923/11/34146/74755/64088453F8941e55b/f033c91841aa1bb8.jpg" width="200" />
  <img src="https://t13.baidu.com/it/u=3045645194,2883644068&fm=224&app=112&f=JPEG?w=500&h=500" width="200" />
</div>

虽说不同专业对线代的应用不同，但作为大学/考研数学三件套之一，以及基于同一难度层次的判断，一校之内的教材五花八门，用“混乱”来形容也不为过；放眼全国，线代教材更是良莠不齐。

为什么同济线代如此”臭名昭著“？第一个批评当属以行列式开篇，以至于判断线代教材好坏的成了是不是从行列式开始（这种办法不无道理，据此就能排除掉以行列式开始的里面99%的烂教材）。

<div align="center">
  <img src="https://img.alicdn.com/i2/2424358848/O1CN01J89R0j2FER3ZDIbjE_!!2424358848.jpg" width="200" />
  <img src="https://img14.360buyimg.com/pop/jfs/t1/51084/1/24901/64480/6454a9d1Fa09d91f4/7ceb493e8498524d.jpg" width="200" />
</div>

也有从矩阵开始讲起的，以下两种对应有B站视频：[厦门大学余铌娜老师](https://www.bilibili.com/video/BV1ip4y197vF/?spm_id_from=333.1387.homepage.video_card.click)、[东南大学张小向老师](https://www.bilibili.com/video/BV1y3411K72h/?spm_id_from=333.1387.favlist.content.click)

<div align="center">
  <img src="https://img14.360buyimg.com/pop/jfs/t1/464148/23/1287/41129/6a38c14dFe687c74f/008328a28a2da925.png" width="200" />
  <img src="https://img14.360buyimg.com/pop/jfs/t1/463363/33/14643/83768/6a424362Ff10c2b5e/008332032043c951.jpg" width="200" />
</div>

还有从线性方程组、线性映射、向量、向量空间开始的，既然有如此多个切入的角度，从行列式开始只会让学生感到莫名奇妙，失去对线性代数的兴趣以及对其本质认识的可能。

有人辩解：线性代数的发展的确就是从行列式开始的，如果把行列式的背景给交代清楚了那反而更加尊重线性代数的发展规律。对此，我们不妨先谈谈线性代数的起源。

三、《九章算术》——线性代数的中国根源

<div align="center">
  <img src="https://ts1.tc.mm.bing.net/th/id/OIP-C.sOZWt-SOSUCiZDuWWLmy1gHaLD?r=0&rs=1&pid=ImgDetMain&o=7&rm=3" width="200" />
</div>

在《九章算数》第八章”方程“里有这样一个问题：
> Given 3 bundles of superior paddy unhusked rice, 2 bundles of ordinary paddy, and 1 bundle of inferior paddy, together they yield 39 dou of grain; 2 bundles of superior paddy, 3 bundles of ordinary paddy, and 1 bundle of inferior paddy together yield 34 dou of grain; 1 bundle of superior paddy, 2 bundles of ordinary paddy, and 3 bundles of inferior paddy together yield]26 dou of grain. Problem: 1 bundle of superior, ordinary, and inferior paddy each yield how much grain?
> 
> 今有上禾三秉，中禾二秉，下禾一秉，實三十九斗；上禾二秉，中禾三秉，下禾一秉，實三十四斗；上禾一秉，中禾二秉，下禾三秉，實二十六斗。問上、中、下禾實一秉各幾何？

不必翻译成白话也能看懂，解线性方程组容易得到答案：
> Answer: 1 bundle of superior paddy yields 9¼ dou, 1 bundle of ordinary paddy yields 4¼ dou, and 1 bundle of inferior paddy yields 2¾ dou.
> 
> 答曰：上禾一秉，九斗四分斗之一；中禾一秉，四斗四分斗之一；下禾一秉，二斗四分斗之三。

该线性方程组的增广矩阵为：

<div align="center">
  <img src='/images/屏幕截图 2026-08-25 152709.png' width="400" />
</div>

算筹是算盘发明之前中国最重要的计算工具，上图应该从右往左、从上往下看，对应将整个矩阵顺时针旋转90度。算筹对应的数字表示如下：

<div align="center">
  <img src='/images/屏幕截图 2026-08-25 152812.png' width="400" />
</div>

之后的步骤和化矩阵为行阶梯形式（高斯消元法）、回代过程几无二致，一些教材关注到了线性代数的历史，但对行列式是线性代数起源的判断是站不住脚的。行列式的概念要到17世纪末期日本数学家关孝和的《解伏题之法》一书才有雏形。

四、对同济教材的三个批评

翻看同济线代目录：
```
第1章 行列式

1 二阶与三阶行列式

2 全排列和对换

3 n 阶行列式的定义

4 行列式的性质

5 行列式按行（列）展开
```

此教材第一不合理之处即为过早引入行列式，给一个线性方程组引入行列式，而行列式只是矩阵中方阵的数值特征。

我们知道，二阶与三阶行列式其实对应平行四边形的面积和平行六面体的体积，但教材对此只字不提，虽名为”工程数学“，却缺少几何直观与现实应用，此为第二处**内容之差**。

1.2节为全排列和对换，这里就引入了`逆序数`这个概念，此为第三处**编排之差**。

居余马老师的线性代数和谢启鸿老师的高等代数虽同为以行列式起，但居书认为采用简便的递归法即可定义 n 阶行列式，比用逆序法定义更节省学时；谢书也是采用行列式按行展开用数学归纳法定义，不采用逆序数这样复杂的组合定义，也不是采用多重线性交错型这样抽象的公理化定义。我在笔记里这部分也没有过多笔墨，因为一般不会用逆序数计算行列式，而其它地方也用不到，直接摘除毫无影响。

五、我在整理笔记时遵循的原则

网上前人对于MIT 18.06的笔记众多，我为什么还要费时费力重新整理呢？

网上对于MIT 18.06课程的笔记大致可分为三代人的努力，第一代见于丁坤博七年前的github仓库[GitHub - MLNLP-World/MIT-Linear-Algebra-Notes](https://github.com/MLNLP-World/MIT-Linear-Algebra-Notes)，第二代是知乎THU[三少爷的键](https://www.zhihu.com/people/san-shao-ye-de-jian-37)的[MIT—线性代数笔记00 - 知乎](https://zhuanlan.zhihu.com/p/45707832)，后续很多笔记对此都有所参考借鉴，所以我整理的其实已经是第三代了。

眼过千遍，不如手过一遍，只有自己真正过一遍、搭建起自己的知识框架与体系，才能将知识内化为自己的，此为第一点原因；其二，网络上的笔记或是排版不算美观、或是没有能直接下载的pdf版本、或是内容高度凝练简洁直接阅读缺少细节不适合初学，我在整理笔记时牢记以下原则：

- 规范性：采用LaTeX进行排版，部分图形用LaTeX进行绘制，如网络图、向量投影`\usepackage{tikz}`。
- 结构性：每一讲分为引言、正文和总结，正文按一二级标题划分结构。
- 系统性：全系列共35个视频，除去3次测验复习和1次总复习不在整理之列，以及第26讲复矩阵和快速傅里叶变换我直接略去（我认为有些破坏其前后两讲的衔接、一般不讨论复数域、埃尔米特矩阵在居书中也放在了附录），剩余29讲我又加上了《线性代数的艺术》作为总复习（总结），形成“线性代数三十讲”。
- 创新性：根据我自身学习与专业知识积累，补充跨专业知识应用，例如在图、网络、关联矩阵一讲将物理学中的基尔霍夫定理替换为了用社会网络分析中的”共识“、”意见领袖“、”信息流“表述，使得更易理解，同时补充空间计量经济学邻接矩阵相关知识，更符合经管学生的专业背景。
- 直观性：能插图就多插图、能画图就多画图，进而阐释线性代数的几何意义。
- 特别在课程的第三部分，我感觉”差点意思“，做了很多补充，比如九种二次曲面的标准型、矩阵的恒等/反射/伸缩/切变/投影/旋转变换等等。

由于我有一点线性代数基础（我真有吗？），一些初次出现的概念于我而言并不是新知识可能不会详说。

六、也谈线代教材选择

线性代数的几何意义：

<div align="center">
  <img src="https://th.bing.com/th/id/R.cb44341f6a4e69e487a552b86468e5f9?rik=GJNkfkoirQoz0Q&riu=http%3a%2f%2fimg13.360buyimg.com%2fn1%2fjfs%2ft2221%2f255%2f2373924388%2f137976%2f2a8f749e%2f56d7fc3dN93330807.jpg&ehk=UvT2t4HzU3AAsca1V6ScimRCtImiLPZ3QPu2BNJ%2fF34%3d&risl=&pid=ImgRaw&r=0" width="200" />
  <img src="https://cdn11.bigcommerce.com/s-phtso/images/stencil/2048x2048/products/5845/7326/9781292351216-800__92962.1639637851.jpg?c=2" width="200" />
</div>

Strang风格的教材：

<div align="center">
  <img src="https://www.tup.tsinghua.edu.cn/upload/bigbookimg3/097005-01.jpg" width="200" />
  <img src="https://img14.360buyimg.com/pop/jfs/t1/326465/32/27549/54661/68e88e66F531e17b2/ff7682b7e32b095e.jpg" width="200" />
</div>

针对矩阵分解，LU、QR、SVD三讲补充了Python和MATLAB代码，市面上也不乏相应教材：

<div align="center">
  <img src="https://t14.baidu.com/it/u=1940376275,2644280210&fm=224&app=112&f=JPEG?w=500&h=500" width="200" />
  <img src="https://www.tup.tsinghua.edu.cn/upload/bigbookimg3/104593-01.jpg" width="200" />
  <img src="https://ts3.tc.mm.bing.net/th/id/OIP-C.3M5CMMIKE3l4Fq6Gj0dNwgHaJ_?r=0&rs=1&pid=ImgDetMain&o=7&rm=3" width="200" />
</div>

七、鸣谢
