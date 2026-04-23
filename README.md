# 西安理工大学硕士学位论文 LaTeX 模板

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![XeLaTeX](https://img.shields.io/badge/Compiler-XeLaTeX-blue.svg)]()
[![TeX Live](https://img.shields.io/badge/TeX%20Live-2022+-green.svg)]()

本项目是**西安理工大学学术型硕士学位论文** LaTeX 模板，格式遵循《西安理工大学研究生学位论文撰写规范》。

> **本模板改编自** [@imustwangxin/XAUT_Doctoral_Dissertation_Template](https://github.com/imustwangxin/XAUT_Doctoral_Dissertation_Template)（西安理工大学博士学位论文模板）。  
> 感谢原作者的贡献，本项目在其基础上调整为硕士学位论文格式。

---

## 目录

- [文件结构](#文件结构)
- [快速开始](#快速开始)
- [编译方法](#编译方法)
  - [方法一：命令行手动编译](#方法一命令行手动编译)
  - [方法二：latexmk 自动编译](#方法二latexmk-自动编译)
  - [方法三：VS Code + LaTeX Workshop](#方法三vs-code--latex-workshop)
  - [方法四：TeXStudio](#方法四texstudio)
- [论文信息填写](#论文信息填写)
- [写作指南](#写作指南)
  - [摘要](#摘要)
  - [正文章节](#正文章节)
  - [图](#图)
  - [表](#表)
  - [公式](#公式)
  - [参考文献](#参考文献)
  - [致谢与研究成果](#致谢与研究成果)
- [格式规范速查](#格式规范速查)
- [常见问题](#常见问题)
- [致谢](#致谢)

---

## 文件结构

```
西安理工大学硕士学位论文模板/
├── XAUTMaster.tex          # ★ 主文档入口（从这里开始编译）
├── XAUTMaster.cls          # 文档类定义（无需修改）
├── XAUTMaster.bib          # 参考文献数据库（在此添加文献）
├── gb7714-2015.bbx/cbx     # 国标 GB/T 7714-2015 参考文献样式
├── fonts/
│   ├── simsun.ttc          # 宋体（本地嵌入，无需安装）
│   └── simhei.ttf          # 黑体（本地嵌入，无需安装）
├── figures/
│   └── xaut01.png          # 学校徽标（封面使用）
│   └── ...                 # 在此放置论文图片
├── parts/
│   ├── coverpage.tex       # 封面（自动读取元数据，无需手动修改）
│   ├── abstract.tex        # 中英文摘要（在此填写摘要内容）
│   ├── originalitystate.tex # 独创性声明（一般无需修改）
│   ├── acknowledgment.tex  # 致谢（在此填写致谢内容）
│   ├── achievement.tex     # 攻读硕士期间研究成果
│   ├── appendix.tex        # 附录（可选）
│   └── tocconfig.sty       # 目录格式配置（无需修改）
└── chapters/
    ├── cha.1_绪论.tex       # 第一章（绪论模板）
    ├── cha.2_主体内容.tex   # 第二章（图/表/公式/算法/代码示例）
    └── cha.last_总结与展望.tex  # 末章（总结与展望模板）
```

---

## 快速开始

1. **克隆或下载**本仓库到本地
2. 进入 `西安理工大学硕士学位论文模板/` 目录
3. 打开 `XAUTMaster.tex`，修改[论文信息](#论文信息填写)
4. 按照[编译方法](#编译方法)编译，生成 `XAUTMaster.pdf`
5. 在 `parts/abstract.tex` 填写中英文摘要
6. 在 `chapters/` 目录下编写各章内容

> **环境要求**：TeX Live 2022 或更高版本（包含 XeLaTeX 和 biber）

---

## 编译方法

本模板必须使用 **XeLaTeX** 编译，参考文献由 **biber** 处理，**不支持 pdfLaTeX 和 BibTeX**。

### 方法一：命令行手动编译

在 `西安理工大学硕士学位论文模板/` 目录下，依次执行以下四条命令：

```bash
xelatex XAUTMaster.tex   # 第一次编译，生成辅助文件
biber XAUTMaster          # 处理参考文献
xelatex XAUTMaster.tex   # 第二次编译，插入参考文献
xelatex XAUTMaster.tex   # 第三次编译，修正交叉引用和目录页码
```

> **说明**：若未修改参考文献，仅修改正文内容时，只需运行两次 `xelatex` 即可。

---

### 方法二：latexmk 自动编译

`latexmk` 可自动判断编译次数，推荐在命令行中使用：

```bash
latexmk -xelatex -bibtex XAUTMaster.tex
```

持续监视文件变化、保存后自动重新编译：

```bash
latexmk -xelatex -bibtex -pvc XAUTMaster.tex
```

清理编译产物（保留 PDF）：

```bash
latexmk -c
```

---

### 方法三：VS Code + LaTeX Workshop

推荐使用 VS Code 配合 [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 插件。

**配置步骤：**

1. 安装 LaTeX Workshop 插件
2. 打开 VS Code 设置（`Ctrl+,`），搜索 `latex-workshop.latex.recipes`
3. 在 `settings.json` 中添加以下配置：

```json
"latex-workshop.latex.recipes": [
    {
        "name": "XeLaTeX + Biber (推荐)",
        "tools": ["xelatex", "biber", "xelatex", "xelatex"]
    }
],
"latex-workshop.latex.tools": [
    {
        "name": "xelatex",
        "command": "xelatex",
        "args": [
            "-synctex=1",
            "-interaction=nonstopmode",
            "-file-line-error",
            "%DOC%"
        ]
    },
    {
        "name": "biber",
        "command": "biber",
        "args": ["%DOCFILE%"]
    }
],
"latex-workshop.latex.recipe.default": "XeLaTeX + Biber (推荐)"
```

4. 打开 `XAUTMaster.tex`，按 `Ctrl+Alt+B` 开始编译，`Ctrl+Alt+V` 打开 PDF 预览

> **SyncTeX 支持**：在 PDF 中 `Ctrl+点击` 可跳转到对应 `.tex` 源码位置。

---

### 方法四：TeXStudio

1. 打开 TeXStudio，进入菜单 **选项 → 构建**
2. 将 **默认编译器** 改为 `XeLaTeX`
3. 将 **默认文献工具** 改为 `Biber`
4. 用 TeXStudio 打开 `XAUTMaster.tex`
5. 按 `F5`（构建并查看）完成完整编译

> 若只想快速编译查看效果（不更新参考文献），按 `F6` 单次 XeLaTeX 编译即可。

---

## 论文信息填写

打开 `XAUTMaster.tex`，找到元数据区（`\begin{document}` 之后），修改以下内容：

### 中文信息

```latex
\CTitle{论文完整题目}                    % 摘要页标题栏使用
\CTitleFirstLine{封面题目第一行}          % 封面显示，可用 ~ 调整间距
\CTitleSecondLine{封面题目第二行}         % 题目较短时可留空：{}

\StudentAuthor{姓名}
\StudentNumber{学号}
\Csupervisor{指导教师姓名}
\CsupervisorTitle{教授}                  % 职称：教授/副教授/研究员 等
\Cmajor{学科名称}                        % 如：控制科学与工程
\CSchool{所在学院}                       % 如：自动化与信息工程学院
\DegreeCategory{工学}                    % 学位类别：工学/理学/管理学 等
\ClassficationNumber{TP182}              % 中图分类号，在图书馆查阅
\AssistSupervistor{}                     % 协助指导教师，无则留空
```

### 英文信息

```latex
\ETitle{FULL TITLE IN ENGLISH UPPERCASE}
\Emajor{Control Science and Engineering}
\EStudentAuthor{San Zhang}              % 姓名拼音，姓在后：名 姓
\Esupervisor{Si Li}
\EsupervisorTitle{Prof.}
```

> **学校代码**（`\UniversityCode`）和 **学校名称**（`\CUniversity`）已预设为西安理工大学，一般无需修改。

---

## 写作指南

### 摘要

编辑 `parts/abstract.tex`：

- **中文摘要**：写在 `\begin{cnabstract} ... \end{cnabstract}` 之间，约 500 字
- **关键词**：用 `\cnkeywords{关键词1；关键词2；关键词3}` 设置，词间用中文分号
- **英文摘要**：写在 `\begin{enabstract} ... \end{enabstract}` 之间
- **英文关键词**：用 `\enkeywords{keyword1; keyword2}` 设置

---

### 正文章节

在 `chapters/` 下新建 `.tex` 文件，然后在 `XAUTMaster.tex` 的正文区用 `\include` 引入：

```latex
\include{chapters/cha.1_绪论}
\include{chapters/cha.2_我的研究}
\include{chapters/cha.3_实验结果}
\include{chapters/cha.last_总结与展望}
```

每章开头用 `\chapter{章标题}`，节使用 `\section`、`\subsection`。

---

### 图

**单幅图（推荐写法）：**

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.7\textwidth]{figures/图片文件名}
    \caption{图片标题}
    \label{fig:标签名}
\end{figure}
```

正文中引用：`如图~\ref{fig:标签名} 所示`

**子图排列：**

```latex
\begin{figure}[htbp]
    \centering
    \begin{subfigure}[b]{0.45\textwidth}
        \includegraphics[width=\linewidth]{figures/图a}
        \caption{子图说明(a)}
    \end{subfigure}
    \hspace{10pt}
    \begin{subfigure}[b]{0.45\textwidth}
        \includegraphics[width=\linewidth]{figures/图b}
        \caption{子图说明(b)}
    \end{subfigure}
    \caption{整体图标题}
    \label{fig:总标签}
\end{figure}
```

> 支持的图片格式：`.png`、`.jpg`、`.pdf`（推荐使用 PDF 矢量图以保证清晰度）

---

### 表

学位论文要求使用**三线表**：

```latex
\begin{table}[htbp]
    \centering
    \caption{表格标题}          % 表题在上方
    \label{tab:标签名}
    \begin{tabular}{ccc}
        \toprule
        列1标题 & 列2标题 & 列3标题 \\
        \midrule
        数据1   & 数据2   & 数据3   \\
        数据4   & 数据5   & 数据6   \\
        \bottomrule
    \end{tabular}
\end{table}
```

正文引用：`如表~\ref{tab:标签名} 所示`

---

### 公式

**单行公式（带编号）：**

```latex
\begin{equation}
    E = mc^2
    \label{eq:标签名}
\end{equation}
```

正文引用：`由式~(\ref{eq:标签名}) 可知`

**多行对齐公式：**

```latex
\begin{align}
    f(x) &= ax^2 + bx + c \\
    f'(x) &= 2ax + b
\end{align}
```

**行内公式**：用 `$公式$`，如 `设 $x \in \mathbb{R}^n$`

---

### 参考文献

**添加文献**：在 `XAUTMaster.bib` 中按 BibTeX 格式添加条目，例如：

```bibtex
@article{zhang2023,
    title   = {示例期刊文章},
    author  = {张三 and 李四},
    journal = {中国某学报},
    volume  = {40},
    number  = {2},
    pages   = {1--10},
    year    = {2023},
}

@inproceedings{smith2022,
    title     = {An Example Conference Paper},
    author    = {Smith, John and Doe, Jane},
    booktitle = {Proceedings of Example Conference},
    pages     = {100--110},
    year      = {2022},
}
```

**正文中引用**：`\cite{zhang2023}` 或 `\cite{zhang2023,smith2022}`（多篇）

> 文献格式自动按 **GB/T 7714-2015** 标准排版，无需手动调整格式。

---

### 致谢与研究成果

- **致谢**：编辑 `parts/acknowledgment.tex`，直接填写致谢文字
- **研究成果**：编辑 `parts/achievement.tex`，按格式列出攻读硕士期间发表的论文、获得的专利等

若需要**附录**，取消 `XAUTMaster.tex` 中以下行的注释：

```latex
\include{parts/appendix}
```

---

## 格式规范速查

| 项目 | 规范 |
|------|------|
| 纸张 | A4，双面印刷 |
| 页边距 | 上 2.5 cm，下 2.1 cm，左/右各 2.1 cm，装订线 0.5 cm |
| 正文字体 | 小四号宋体 |
| 正文行距 | 固定值 20 磅 |
| 章标题 | 三号黑体加粗，居中 |
| 节标题 | 四号黑体加粗 |
| 小节标题 | 小四号黑体加粗 |
| 图表编号 | 按章编号，如"图 2-3"、"表 3-1" |
| 图题位置 | 图的**下方**，五号楷体 |
| 表题位置 | 表的**上方**，五号楷体 |
| 公式编号 | 右对齐，格式为"(章号-序号)" |
| 页眉（奇数页） | 当前章标题，楷体五号 |
| 页眉（偶数页） | 西安理工大学硕士学位论文，楷体五号 |
| 前置部分页码 | 大写罗马数字（Ⅰ、Ⅱ、Ⅲ…） |
| 正文页码 | 阿拉伯数字，居中 |
| 参考文献格式 | GB/T 7714-2015 |

### 文档类选项

在 `XAUTMaster.tex` 第一行的 `\documentclass` 中可选择以下选项：

| 选项 | 说明 |
|------|------|
| `forprint`（默认） | **打印版**：超链接不显示彩色，适合打印提交 |
| 无选项 | **电子版**：超链接显示为蓝色/洋红色，适合电子提交 |

修改方式：

```latex
\documentclass[forprint]{XAUTMaster}   % 打印版（默认）
\documentclass{XAUTMaster}             % 电子版
```

---

## 常见问题

**Q：编译后中文显示为乱码或方块**  
A：确认使用 XeLaTeX 编译，而非 pdfLaTeX。检查 `fonts/` 目录下是否存在 `simsun.ttc` 和 `simhei.ttf`。

**Q：参考文献不显示**  
A：确保完整执行了四步编译（xelatex → biber → xelatex → xelatex）。biber 步骤缺失是最常见原因。

**Q：图片找不到**  
A：将图片放在 `figures/` 目录下，`\includegraphics` 中写相对路径，如 `figures/myfig.png`。

**Q：目录/交叉引用编号不正确**  
A：多次运行 xelatex（至少 2 次）即可解决，这是 LaTeX 的正常现象。

**Q：封面题目一行放不下**  
A：将题目拆为两行，分别填入 `\CTitleFirstLine{}` 和 `\CTitleSecondLine{}`。

---

## 致谢

- 本模板基于 [XAUT_Doctoral_Dissertation_Template](https://github.com/imustwangxin/XAUT_Doctoral_Dissertation_Template) 改编，原作者 [@imustwangxin](https://github.com/imustwangxin)
- 参考文献样式 `gb7714-2015` 来自 [hushidong/biblatex-gb7714-2015](https://github.com/hushidong/biblatex-gb7714-2015)

## License

MIT License — 详见 [LICENSE](LICENSE) 文件。
