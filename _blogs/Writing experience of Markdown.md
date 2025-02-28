---
title: Writing experience of Markdown
date: 2025-02-28
permalink: /blogs/md
---

Basic Markdown syntax and Marp usage.

就像输入数学公式时运用AxMath是一种介于“Word内嵌公式”和“
$$\LaTeX$$
”之间的方法，使用Markdown输入文本也是一种介于Word和
$$\LaTeX$$
之间的方式。

Markdown是一种轻量级标记语言，由约翰·格鲁伯（John Gruber）于2004年创建，其核心功能是通过纯文本格式编写文档并转换为结构化格式（如 HTML、PDF 等）。

Markdown文档以`.md`为后缀‌，使用易读易写的纯文本格式，无需复杂排版工具，通过简单的标记符号（如`#`表示标题、`-`表示列表）实现排版，用户无需关注格式细节，可专注于内容创作；支持多种编辑器（如Typora、VS Code），实时预览，广泛应用于博客、论坛和知识库（如 GitHub、知乎专栏）的写作‌；支持多种输出格式（如HTML、Word、PDF等），适用于不同场景的文档生成需求‌。

我最开始使用的是VS Code，没有选择Typora是因为最新的版本需要付费，后来转向Obsidian，因其界面更加简洁、有丰富的第三方插件（VS Code拓展也很丰富但需要安装多个，能配置C、Python、R、Stata等环境但对我而言反而没那么“纯粹”）。

以我的投产笔记为例，如果想要分点，
$$\LaTeX$$
里需要写一长串：
```latex
在Excel里基于矩阵乘法分步实现部门合并，原理其实很简单，我们知道：
\begin{itemize}
	\item 非零矩阵乘单位阵都等于自身；
	\item 矩阵$A$左乘一个矩阵相当于对$A$做行变换；
	\item 矩阵$B$右乘一个矩阵相当于对$B$做列变换。
\end{itemize}
在单位阵的基础上考虑三种初等变换：
\begin{enumerate}
	\item 对换
	    \begin{pmatrix}
          0 & 1 \\
          1 & 0 \\
        \end{pmatrix}
          相当于一二行互换（$r_1 \mapsto r_1 \times 0 +  r_2 \times 1$, $r_2 \mapsto r_2 \times 0 +  r_1 \times 1$）/ 一二列互换（$c_1 \mapsto c_1 \times 0 +  c_2 \times 1$, $c_2 \mapsto c_2 \times 0 +  c_1 \times 1$）
    \item 倍乘
        \begin{pmatrix}
          1 & 0 \\
          0 & k \\
        \end{pmatrix}
        相当于第二行/列乘了$k$倍（$r_2 \mapsto r_2 \times k$ / $c_2 \mapsto c_2 \times k$）
    \item 倍加
        \begin{pmatrix}
          1 & 0 \\
          k & 1 \\
        \end{pmatrix}
        相当于第一行乘了$k$倍加到第二行上（$r_2 \mapsto r_2+ r_1 \times k$）/ 第二列乘了$k$倍加到第一列上（$c_1 \mapsto c_1+ c_2 \times k$） 
\end{enumerate}
```

但在Markdown语句里，仅仅需要敲一下`-`（个人习惯）或是`1.`然后按下空格键就行，而且换行就能自动续前分点或继续编号，不用像
$$\LaTeX$$
里需要再输入一遍`\item`；输入公式时运用的是
$$\LaTeX$$
语法。

用Marp的话更是所见即所得，不像
$$\LaTeX$$
每次编译都需要一定的时间。

所以如果不是非常严肃的场景，Markdown能满足我们绝大多数的需求，包括论文（先Mark一下）：

- [学术论文写作新武器：Markdown-上篇](https://www.lianxh.cn/details/603.html)
- [学术论文写作新武器：Markdown-中篇](https://www.lianxh.cn/details/605.html)
- [学术论文写作新武器：Markdown-下篇](https://www.lianxh.cn/details/604.html)

**Markdown基本语法如下：**
1. 用一个`# `表示一级标题，`## `表示二级标题，`### `表示三级标题...
2. 在文字前后各加两个`*`加粗字体；
3. 在文字前后各加一个`_`（或一个`*`）倾斜字体；
4. 在文字前后各加两个`=`高亮字体；
5. 用一个`- `（或一个`+ `或一个`* `）表示无序列表；
6. 用`1. `, `2. `, `3. `编号表示有序列表；
7. 用`> `表示注释；
8. 用`\[^1]`表示引用，会在篇末形成脚注；
9. 在文字前后各加一个\` 内嵌字体；
10. 用`$ $`在段落里插入公式，用`$$ $$`在段落间插入公式；
11. 用`[]()`形成超链接，中括号里加要显示的内容，圆括号里加网址；
12. 用Tab键分级；
13. 用`---`画一条横向分割线或分页；
14. 用上下两个\`\`\`或`~~~`显示代码块，在第一个后加编程语言名称（小写），系统会自动渲染。

此外，图片、表格等都能在Ob里直接插入，删除线、待办等个人不常用，此处不再赘述。

Marp在VS Code里需要安装一系列拓展，且我之前（使用Awesome Marp模板）存在图标导出为PPT时不显示的情况，因此以下均是最近我在使用Ob的心得。

在Ob里依次点击设置图标—>第三方插件—>社区插件市场：浏览，我常用的有Mousewheel Image zoom（按住Alt键滑动鼠标滚轮就能缩放图片大小）、Marp Slides（搜索Marp安装量最多且更新时间最近）。

当我在Ob里写完一篇`.md`文档时，上传到Github上几乎只需要把图片改成HTML语句再调整一下格式细节就行：
```
<div align=center>
	<img src='/images/Pasted image1.png' width="150">
	<img src='/images/Pasted image2.png' width="200">
</div>
```

用Marp做Slides就只需要用`---`分页，在篇首用`---`添加笔记属性（如marp: true，footer，paginate: true，tags，date等）；但一直困扰我的一个问题是图片在Marp里不显示，一次偶然间我从我的个人主页上直接复制图片链接粘到Ob里（而不是直接插入图片）就解决了这一问题；连老师给出了更多的方法：[Markdown图床：我们的图片存在哪里？](https://www.lianxh.cn/details/296.html)

这时，我们就可以使用各种模板（`.css`格式文件）做伪beamer，在Ob里基于Marp插件导出HTML、PDF、PPT（PPT里为图片无法编辑）等格式的成品！
