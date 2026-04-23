% !Mode:: "TeX:UTF-8"
% XAUTReport.cls — 西安理工大学结课设计报告模板
% 基于 XAUTPhD.cls 改造，使用 XeLaTeX 编译
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{XAUTReport}[2026/04/23 XAUT Course Design Report Template]

%------------------------ 文档类基础选项 ----------------------------------
% 单面打印，保留 \chapter 分章，A4，小四号字
\LoadClass[a4paper, zihao=-4, oneside, openany]{ctexbook}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions

%------------------------ 页面布局 ----------------------------------
\RequirePackage{fancyhdr, hyperref}
\hypersetup{pdfencoding=auto}
\hypersetup{hidelinks}  % 隐藏链接颜色边框，适合打印

\RequirePackage[
  top=2.5cm,
  bottom=2.1cm,
  left=2.5cm,
  right=2.5cm,
  headsep=0.5cm,
  footskip=0.5cm,
  includefoot,
  xetex
]{geometry}

%------------------------ 报告元数据 Token ----------------------------------
\newtoks\ReportTitle        % 报告题目
\newtoks\CourseName         % 课程名称
\newtoks\StudentName        % 学生姓名
\newtoks\StudentID          % 学号
\newtoks\Major              % 专业
\newtoks\ClassName          % 班级
\newtoks\CSchool            % 学院
\newtoks\Instructor         % 指导教师
\newtoks\InstructorTitle    % 指导教师职称（可选）
\newtoks\ReportDate         % 提交日期
\newtoks\CUniversity        % 学校名称

%------------------------ 页眉页脚 ----------------------------------
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}

% 正文页眉：左奇数页显示章节名，右偶数页显示学校+报告类型
\newcommand{\reportpagestyle}{%
  \fancypagestyle{plain}{%
    \fancyhf{}
    \setlength\headheight{22pt}
    \fancyhead[C]{\kaishu\zihao{5}\the\CUniversity\quad 结课设计报告}
    \fancyfoot[C]{\zihao{-5}\raisebox{0.5cm}{\thepage}}
    \setlength{\topmargin}{-12mm}
    \renewcommand{\headrulewidth}{0.5pt}
    \setlength{\footskip}{12mm}
  }%
}

\fancypagestyle{reportmain}{
  \fancyhf{}
  \setlength\headheight{22pt}
  \fancyhead[C]{\kaishu\zihao{5}\the\CUniversity\quad 结课设计报告}
  \fancyfoot[C]{\zihao{-5}\raisebox{0.5cm}{\thepage}}
  \setlength{\topmargin}{-12mm}
  \renewcommand{\headrulewidth}{0.5pt}
  \setlength{\footskip}{12mm}
}

% 前置页（摘要、目录）页眉无线，页脚页码
\fancypagestyle{frontplain}{
  \fancyhf{}
  \fancyfoot[C]{\zihao{-5}\raisebox{0.6cm}{\thepage}}
  \renewcommand{\headrulewidth}{0pt}
  \setlength{\footskip}{15mm}
}

\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{-5}\raisebox{0.5cm}{\thepage}}
  \renewcommand{\headrulewidth}{0pt}
}

%------------------------ 工具宏 ----------------------------------
\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows, calc}

% 带粗下划线的文本（用于封面填写框）
\newcommand{\thickuline}[2][1.8pt]{%
  \tikz[baseline]{\node[anchor=base,inner sep=0] (t) {#2};
  \draw[line width=#1] (t.south west) -- (t.south east);}}

% textpos：用于封面精确定位
\usepackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\usepackage{wrapfig}
\usepackage{ulem}
\usepackage{cancel}
\usepackage{rotating}

%------------------------ 字体 ----------------------------------
\let\heiti\relax
\newCJKfontfamily{\heiti}[AutoFakeBold={2.17}]{simhei.ttf}
\AtBeginDocument{~~ \vskip-2cm}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setCJKmainfont[Path=fonts/]{simsun.ttc}
\setCJKfamilyfont{zhsong}[Path=fonts/, AutoFakeBold={2.17}]{SimSun.ttc}
\renewcommand*{\songti}{\CJKfamily{zhsong}}

%------------------------ 常用宏包 ----------------------------------
\RequirePackage{amsmath, amssymb}
\RequirePackage[amsmath, thmmarks]{ntheorem}
\RequirePackage{graphicx}
\RequirePackage{color, xcolor}

% 参考文献：GB/T 7714-2015 中文标准
\usepackage[backend=biber, style=gb7714-2015, gbnamefmt=lowercase,
            gbpub=false, gbpunctin=false, gbalign=left,
            doi=false, gblocal=gb7714-2015]{biblatex}

% 代码高亮
\usepackage{listings}
\newfontfamily\courier{Courier New}
\lstset{
  numbers=left,
  basicstyle=\small\courier,
  numberstyle=\tiny\courier,
  keywordstyle=\color{blue}\courier,
  commentstyle=\it\color[cmyk]{1,0,1,0}\courier,
  stringstyle=\it\color[RGB]{128,0,0}\courier,
  frame=single,
  breaklines,
  extendedchars=false,
  xleftmargin=0em, xrightmargin=0em, aboveskip=1em,
  tabsize=4,
  showspaces=false
}

% 流程图支持
\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=2cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process}   = [rectangle, minimum width=5cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision}  = [diamond, shape aspect=3, minimum width=3cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{io}        = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=3cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow}     = [thick,->,>=stealth]

%------------------------ 定理环境 ----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti}
\theoremindent0em
\theoremnumbering{arabic}
\newtheorem{theorem}{\hspace{2em}定理}[section]
\newtheorem{definition}{\hspace{2em}定义}[section]
\newtheorem{lemma}{\hspace{2em}引理}[section]
\newtheorem{corollary}{\hspace{2em}推论}[section]
\newtheorem{proposition}{\hspace{2em}性质}[section]
\newtheorem{example}{\hspace{2em}例}[section]
\newtheorem{remark}{\hspace{2em}注}[section]

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont\rm\songti}
\theoremindent0em
\theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}

%------------------------ 摘要与关键词 ----------------------------------
\newcommand\cnkeywords[1]{{\noindent\songti\zihao{-4}\bfseries 关键词：}#1}
\newcommand\enkeywords[1]{{\noindent\bfseries\zihao{-4}Key words: }#1}

\newenvironment{cnabstract}{%
  \vspace*{25pt}
  \begin{center}{\zihao{-3}\songti\bfseries\makebox[3.5em][s]{摘要}}\end{center}
  \vspace*{16pt}
  \songti\zihao{-4}
  \setlength{\baselineskip}{20pt}
  \selectfont
  \@afterheading}
{\par}

\newenvironment{enabstract}{%
  \vspace*{20pt}
  \begin{center}{\zihao{-3}\textsf{\bfseries Abstract}}\end{center}
  \vspace*{16pt}
  \zihao{-4}
  \setlength{\baselineskip}{20pt}
  \selectfont
  \@afterheading}
{\par}

%------------------------ 目录 ----------------------------------
\usepackage{parts/tocconfig}

% 修复目录章节编号显示
\makeatletter
\patchcmd{\l@chapter}%
  {\leavevmode}%
  {\leavevmode%
   \renewcommand{\numberline}[1]{\hbox{\@cftbsnum ##1\@cftasnum}\@cftasnumb}}%
  {}{}%
\makeatother

%------------------------ 章节标题格式 ----------------------------------
\newlength{\SmallFourSkip}
\setlength{\SmallFourSkip}{\baselineskip}
{\normalfont\zihao{-4}
\setlength{\SmallFourSkip}{\baselineskip}}

\ctexset{
  chapter/nameformat  = {\normalfont\heiti\zihao{3}},
  chapter/titleformat = {\normalfont\heiti\zihao{3}\raggedright},
  chapter/number      = {\arabic{chapter}},
  chapter/name        = {第,章},
  chapter/afterskip   = {\SmallFourSkip},
  chapter/beforeskip  = {-1em},
  chapter/aftername   = {~~},
  section/format+     = {\normalfont\heiti\zihao{4}\raggedright},
  section/afterskip   = {0pt},
  section/beforeskip  = {0.1\baselineskip},
  section/aftername   = {\quad},
  subsection/format+  = {\normalfont\heiti\zihao{-4}\raggedright},
  subsection/afterskip  = {0pt},
  subsection/beforeskip = {0.2\baselineskip},
  subsection/aftername  = {\quad},
  bibname             = {\zihao{-2} 参考文献}
}

%------------------------ 图表设置 ----------------------------------
\usepackage{tabularx}
\usepackage{tabulary}
\usepackage{booktabs}
\AtBeginEnvironment{tabularx}{\small}
\AtBeginEnvironment{tabulary}{\small}
\setlength{\heavyrulewidth}{2.25pt}
\setlength{\lightrulewidth}{1pt}

\RequirePackage[labelsep=quad]{caption}
\usepackage{subcaption}

% 图表编号格式：章号-序号（与 \chapter 对应）
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% 双语标题命令（可选使用）
\newcommand{\bilingualfigure}[2]{%
  \centering
  \caption{#1\\[-1pt]
  \small{Fig.\thefigure}~#2}}

\newcommand{\bilingualtable}[2]{%
  \centering
  \caption{#1\\[-1pt]
  \small{Tab.\thetable}~#2}}

\captionsetup[figure]{
  font={small},
  labelsep=space,
  justification=centering,
  singlelinecheck=false,
  skip=0pt
}
\captionsetup[table]{
  font={small},
  labelsep=space,
  justification=centering,
  singlelinecheck=false,
  skip=0pt
}

\graphicspath{{figures/}}

%------------------------ 公式编号 ----------------------------------
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}

%------------------------ 其他宏包 ----------------------------------
\usepackage{float}
\usepackage[linesnumbered, boxed, ruled, commentsnumbered, vlined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
\SetAlgoSkip{0em}
\setlength{\interspacetitleruled}{0.5em}
\setlength{\interspacealgoruled}{0.5em}

\usepackage{titlesec}
\RequirePackage[title, titletoc]{appendix}

% 列表环境缩进
\RequirePackage{url}
\RequirePackage{enumerate}
\usepackage{enumitem}
\setenumerate{fullwidth, itemindent=2em, listparindent=2em,
              itemsep=0ex, partopsep=0pt, parsep=0ex}

\makeatletter
\setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini\parsep 0pt\topsep\parsep\itemsep\parsep}
\@listI
\def\@listii{\leftmargin\leftmarginii\labelwidth\leftmarginii
  \advance\labelwidth-\labelsep\parsep\z@\@plus\z@\@minus\z@
  \topsep\parsep\itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii\labelwidth\leftmarginiii
  \advance\labelwidth-\labelsep\parsep\z@\@plus\z@\@minus\z@
  \topsep\parsep\itemsep\parsep}
\makeatother

\setlength\leftmargini{2\ccwd}
\setlength\leftmarginii{\leftmargini}
\setlength\leftmarginiii{\leftmargini}
\setlength\listparindent{2\ccwd}

\setlength{\parskip}{0pt}
\allowdisplaybreaks
\endlinechar`\^^M
\endinput
