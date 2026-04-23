% !Mode:: "TeX:UTF-8"
%本模板在武汉大学硕士学位论文模板以及内蒙古科技大学硕士学位论文基础上修改，感谢原作者的工作！http://aff.whu.edu.cn/huangzh/ (武汉大学) and richey@imust.edu.cn (内蒙古科技大学)
%西安理工大学硕士学位论文模板，基于博士模板 XAUTPhD.cls 修改
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{XAUTMaster}[2025/04/23]

\newif\iflib\libfalse
% \DeclareOption{forlib}{\libtrue}
\libtrue
\newif\ifprint\printfalse
\DeclareOption{forprint}{\printtrue}
\ProcessOptions

\iflib
\LoadClass[a4paper,zihao=-4,twoside,openany]{ctexbook}
\else
\LoadClass[a4paper,zihao=-4,oneside]{ctexbook}
\fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
%------------------------ Page layout ----------------------------------
\RequirePackage{fancyhdr,hyperref}
\hypersetup{pdfencoding=auto}  %%% 
\hypersetup{citecolor=magenta,linkcolor=blue}
% 
\RequirePackage[top=2.5cm,bottom=2.1cm,left=2.1cm,right=2.1cm,bindingoffset=0.5cm,
headsep=0.5cm,
% headheight=1.5cm,
footskip=0.5cm,
% includehead,
includefoot,
xetex]{geometry}    % 页面设置%

\newtoks\Csupervisor     %指导教师中文名
\newtoks\CsupervisorTitle    %指导教师职称
\newtoks\ClassName      %班级名
\newtoks\StudentNumber  %学号
\newtoks\CTitle         %题目全部
\newtoks\CTitleFirstLine         %题目第一行
\newtoks\CTitleSecondLine         %题目第二行
\newtoks\ClassficationNumber    %分类号
\newtoks\SecretLevel    %密级
\newtoks\UDC            %UDC
\newtoks\UniversityCode    %学校代码
\newtoks\DegreeCategory    %学位类别
\newtoks\Cmajor          %学科专业中文名
\newtoks\CSchool    % 学院名称
\newtoks\AssistSupervistor    %协助指导教师
\newtoks\AssistSupervistorTitle    %协助指导教师职称
\newtoks\StudentAuthor    %学生姓名
\newtoks\PaperDate            %日期
\newtoks\CUniversity

\newtoks\ETitle         %英文题目
\newtoks\Emajor         %英文学科
\newtoks\EStudentAuthor      %英文学生姓名
\newtoks\Esupervisor         %指导教师英文名
\newtoks\EsupervisorTitle    %指导教师英文职称
%===============================================页眉设置=====================================================%
\renewcommand{\headrulewidth}{0.5pt}    %在页眉下画一个0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。

\newcommand{\fancyfancy}{\fancypagestyle{plain}{%
    \fancyhf{}
    \setlength\headheight{22pt}
    \fancyhead[CE]{\kaishu\zihao{5}西安理工大学硕士学位论文}  %偶数页页眉居中位置的设置. 不填则为空.
	\fancyhead[CO]{\kaishu\zihao{5}\leftmark}    %L,C,R 是左中右; O,E 是奇偶. 可以自己组合调整.
	\fancyfoot[C]{\zihao{-5}\raisebox{0.5cm}{\thepage}}
    \setlength{\topmargin}{-12mm}
    \renewcommand{\headrulewidth}{0.5pt}
    \setlength{\footskip}{12mm}
}}

\fancypagestyle{frontplain}{
  \fancyhf{} % 清空所有页眉页脚
  \fancyfoot[C]{\zihao{-5}\raisebox{0.6cm}{\thepage}} % 设置页脚居中，五号字
  \renewcommand{\headrulewidth}{0pt} % 移除页眉线
  \setlength{\footskip}{15mm}
}

\fancypagestyle{fancyfancyfancy}{
	\fancyhf{}
    \setlength\headheight{22pt}
    \fancyhead[CE]{\kaishu\zihao{5}西安理工大学硕士学位论文}  %偶数页页眉居中位置的设置. 不填则为空.
	\fancyhead[CO]{\kaishu\zihao{5}\leftmark}    %L,C,R 是左中右; O,E 是奇偶. 可以自己组合调整.
	\fancyfoot[C]{\zihao{-5}\raisebox{0.5cm}{\thepage}}
    \setlength{\topmargin}{-12mm}
    \renewcommand{\headrulewidth}{0.5pt}
    \setlength{\footskip}{12mm}}

\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{-5}\raisebox{0.5cm}{\thepage}}  % 五号
  \renewcommand{\headrulewidth}{0pt}
}

\newcommand{\tabincell}[2]{\begin{tabular}
		{@{}#1@{}}#2\end{tabular}}

\usepackage{wrapfig}
\usepackage{tikz}     % 绘制边框
\newcommand{\thickuline}[2][1.8pt]{%
  \tikz[baseline]{\node[anchor=base,inner sep=0] (t) {#2};
  \draw[line width=#1] (t.south west) -- (t.south east);}}
\usepackage[absolute,overlay]{textpos} % 页面任意位置

% 设置 textpos 单位（必须在 document 前）
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\usepackage{ulem}
\usepackage{cancel}

\usepackage{rotating}
\usepackage{CJKutf8}

\newcommand{\printSpine}{
    \linespread{0.9}\selectfont
    \vspace*{\fill}\par
    % 标题、姓名、校名
    \mdseries {\the\CTitle} \par\vfill\vfill
    \mdseries {\the\StudentAuthor} \par\vfill\vfill 
    \mdseries {\the\CUniversity} \par 
    \vspace*{\fill}\par 
}

\newcommand{\printCoverBox}[5]{
  \begin{tikzpicture}[remember picture,overlay,shift=(current page.north west)]
      \draw [line width=#5, black ] (#1, #2) rectangle (#3, #4);
  \end{tikzpicture}
}

\def\cleardoublepage{%
  \clearpage
  \if@twoside
    \ifodd\c@page
    \else
      \hbox{}\thispagestyle{empty}\newpage
      \if@twocolumn\hbox{}\thispagestyle{empty}\newpage\fi
    \fi
  \fi
}

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{}
\newcommand\enabstractname{}
\newcommand\cnkeywords[1]{ {\noindent\songti\zihao{-4}\bfseries\cnkeywordsname: }#1}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\noindent\bfseries\zihao{-4}\enkeywordsname: }#1}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{
    \vspace*{25pt}
    \begin{center}{\zihao{-3}\songti\bfseries \makebox[3.5em][s]{摘要}}\end{center}
    \vspace*{16pt}
    \songti\zihao{-4}
	\setlength{\baselineskip}{20pt}
    \selectfont
	\@afterheading}
{\par}

\newenvironment{enabstract}{
	\vspace*{20pt}
    \begin{center}{\zihao{-3}\textsf{\bfseries Abstract}}\end{center}
    \vspace*{16pt}
    \zihao{-4}
	\setlength{\baselineskip}{20pt}
    \selectfont
	\@afterheading}
{\par}

\let\heiti\relax 
\newCJKfontfamily{\heiti}[Path=fonts/, AutoFakeBold={2.17}]{simhei.ttf}
\AtBeginDocument{~~ \vskip-2cm}
\setmainfont{Times New Roman}
\setsansfont{Arial}  
\setCJKmainfont[Path=fonts/]{simsun.ttc}
\setCJKfamilyfont{zhsong}[Path=fonts/, AutoFakeBold = {2.17}]{SimSun.ttc}
\renewcommand*{\songti}{\CJKfamily{zhsong}}


%%------------------------常用宏包-----------------------------------

\RequirePackage{amsmath,amssymb}% AMSLaTeX宏包.
\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{graphicx}                 % 图形
\RequirePackage{color,xcolor}             %支持彩色

\usepackage[backend=biber,style=gb7714-2015,gbnamefmt = lowercase,gbpub=false,gbpunctin=false, gbalign=left,doi=false,gblocal=gb7714-2015]{biblatex}
\makeatletter
\DeclareStyleSourcemap{
	\maps[datatype=bibtex]{
		\map[overwrite]{
			\pertype{conference}%兼容老的conference类型
			\pertype{inproceedings}%兼容老的conference类型
			\pertype{incollection}%兼容老的conference类型
			\step[fieldset=usera, fieldvalue={A}]
		}
		\map{
			\step[typesource=conference, typetarget=customa]
			\step[typesource=inproceedings, typetarget=customa]
			\step[typesource=incollection, typetarget=customa]
		}
	}
}

\DeclareFieldFormat[customa]{title}{#1}

\renewbibmacro*{booktitlenew}{%
	\ifboolexpr{
		test {\iffieldundef{booktitle}}
		and
		test {\iffieldundef{booksubtitle}}
	}
	{}
	{\printtext[booktitle]{\bibtitlefont%
			\printfield[titlecase]{booktitle}\mbox{}\printtext{[C]}%
}}}

\renewbibmacro*{innew:}{%
	{\setunit{\adddot\addspace}%
		\iffieldequalstr{userd}{chinese}%
		{\printtext{\bibstring{incn}}}%
		{\printtext{\bibstring{in}}}%
}}%

%==============参考文献格式修改=================
\newcommand{\myprintbibliography}[1]{%
  \begingroup
    % ---- 设置字体 ----
    \renewcommand*{\bibfont}{
    \fontsize{12bp}{13.5bp}\selectfont % 12pt 字号，行距
    }
 
    % ---- 固定行距 ----
    \setlength{\bibitemsep}{0pt}%
    \setlength{\bibparsep}{0pt}%

    \widowpenalty=10000           % 禁止孤行
    \clubpenalty=10000            % 禁止寡行
    \interlinepenalty=100         % 增强行间灵活性
    \raggedbottom                 % 不强制对齐底部，允许自然分页

    \def\bibtitle{#1}%
    \printbibliography[heading=none,title={\bibtitle}]
  \endgroup
}

%
%   专著中的析出文献的格式修改
%
\DeclareBibliographyDriver{customa}{%源来自standard.bbx
	\usebibmacro{bibindex}%
	\usebibmacro{begentry}%
	\usebibmacro{author/translator+others}%
	\ifnameundef{author}{}{\setunit{\labelnamepunct}\newblock}%这一段用于去除作者不存在时多出的标点
	\usebibmacro{title}%
	\usebibmacro{innew:}%
	\usebibmacro{bybookauthor}%
	\ifnameundef{bookauthor}{%
		\ifnameundef{editor}{}{\newunit}%
	}{\newunit}%替换下一句
	\iffieldundef{series}{}{\usebibmacro{series+number}\setunit{\addcolon\addspace}}%
	\usebibmacro{booktitlenew}%
	\iffieldundef{volume}{}{\setunit{\addcolon\addspace}\printfield{volume}}%
	\iffieldundef{number}{}{\setunit{\addcolon\addspace}\printfield{number}}%
	\newunit\newblock%
	\printfield{edition}%
	\newunit
	\iftoggle{bbx:gbstrict}{}{%
	}%
	\newunit\newblock
	\usebibmacro{publisher+location+date}%
	\usebibmacro{chapter+pages}%
	\usebibmacro{doi+eprint+url}%
	\newunit\newblock
	\iftoggle{bbx:isbn}
	{\printfield{isbn}}
	{}%
	\newunit\newblock
	\usebibmacro{addendum+pubstate}%
	\setunit{\bibpagerefpunct}\newblock
	\usebibmacro{pageref}%
	\newunit\newblock
	\iftoggle{bbx:related}
	{\usebibmacro{related:init}%
		\usebibmacro{related}}
	{}%
	\usebibmacro{finentry}\usebibmacro{annotation}}

\makeatother

\RequirePackage{url}
\RequirePackage{enumerate}
\usepackage{listings}
\newfontfamily\courier{Courier New}

\lstset{
	numbers=left, %设置行号位置 
	basicstyle=\small\courier,
	numberstyle=\tiny\courier, %设置行号大小  
	keywordstyle=\color{blue}\courier, %设置关键字颜色  
	commentstyle=\it\color[cmyk]{1,0,1,0}\courier, %设置注释颜色 
	stringstyle=\it\color[RGB]{128,0,0}\courier,
	frame=single, %设置边框格式  
	breaklines, %自动折行  
	extendedchars=false, %解决代码跨页时，章节标题，页眉等汉字不显示的问题  
	xleftmargin=0em,xrightmargin=0em, aboveskip=1em, %设置边距  
	tabsize=4, %设置tab空格数  
	showspaces=false %不显示空格  
}  

\RequirePackage{flowchart}
\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}
\usetikzlibrary{calc}

% 流程图定义基本形状
\tikzstyle{top} = [circle, minimum height=0cm,text centered, draw=white ]
\tikzstyle{startstop} = [terminal, minimum width=2cm, minimum height=1cm,text centered, draw=black ]
\tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=3cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{process} = [rectangle, minimum width=5cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{decision} = [diamond, shape aspect=3,minimum width=3cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]

%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
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
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\square$}
\newtheorem{proof}{\hspace{2em}证明}

%%%---  Publications -------------------------------
\newenvironment{publications}[1]
{\renewcommand\bibname{}\begin{thebibliography}{#1}}
	{\end{thebibliography}}

%%%%%%%--判断是否需要彩色链接-----------------------------
\iflib
\hypersetup{allcolors=black}
\else
\fi
%%%%%%%--判断是否需要彩色链接-----------------------------
\ifprint
\hypersetup{hidelinks}
\else
\fi
%%%===  suppress extra inter-line spacing in \list environments
\makeatletter \setlength\partopsep{0pt}
\def\@listI{\leftmargin\leftmargini
	\parsep 0pt
	\topsep \parsep
	\itemsep \parsep}
\@listI
\def\@listii {\leftmargin\leftmarginii
	\labelwidth\leftmarginii
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
	\labelwidth\leftmarginiii
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
\def\@listiv{\leftmargin\leftmarginiv
	\labelwidth\leftmarginiv
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
\def\@listv{\leftmargin\leftmarginv
	\labelwidth\leftmarginv
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
\def\@listvi{\leftmargin\leftmarginvi
	\labelwidth\leftmarginvi
	\advance\labelwidth-\labelsep
	\parsep    \z@ \@plus\z@  \@minus\z@
	\topsep    \parsep
	\itemsep   \parsep}
%
% Change default margins for \list environments
\setlength\leftmargini   {2\ccwd} \setlength\leftmarginii
{\leftmargini} \setlength\leftmarginiii {\leftmargini}
\setlength\leftmarginiv  {\leftmargini} \setlength\leftmarginv
{\ccwd} \setlength\leftmarginvi  {\ccwd} \setlength\leftmargin
{\leftmargini} \setlength\labelsep      {.5\ccwd}
\setlength\labelwidth    {\leftmargini}
%
\setlength\listparindent{2\ccwd}
% Change \listparindent to 2\ccwd in \list
\def\list#1#2{\ifnum \@listdepth >5\relax \@toodeep
	\else \global\advance\@listdepth\@ne \fi
	\rightmargin \z@ \listparindent2\ccwd \itemindent \z@
	\csname @list\romannumeral\the\@listdepth\endcsname
	\def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
	\@trivlist
	\parskip\parsep \parindent\listparindent
	\advance\linewidth -\rightmargin \advance\linewidth -\leftmargin
	\advance\@totalleftmargin \leftmargin
	\parshape \@ne \@totalleftmargin \linewidth
	\ignorespaces}

\makeatother
\usepackage{enumitem} 

\setenumerate{fullwidth,itemindent=2em,listparindent=2em,itemsep=0ex,partopsep=0pt,parsep=0ex}


% %---------目录设置------------------------------------------
\usepackage{parts/tocconfig}

\makeatletter
\patchcmd{\l@chapter}% <cmd>
  {\leavevmode}% <search>
  {\leavevmode%
   \renewcommand{\numberline}[1]{\hbox{\@cftbsnum ##1\@cftasnum}\@cftasnumb}}% <replace>
  {}{}% <success><failure>
\makeatother

\newcommand\acknowledgement{\backmatter\chapter[致谢]{\centerline{\heiti\zihao{-2}\ziju{2}致谢}}}

%%% ---- 章节标题设置 ----- %%%%
% 定义用于标题空行的"小四号基线"
\newlength{\SmallFourSkip}
\setlength{\SmallFourSkip}{\baselineskip} % 临时保存当前 baselineskip
{\normalfont\zihao{-4} % 小四号环境
\setlength{\SmallFourSkip}{\baselineskip} % 计算小四号单倍行距高度
}

\CTEXsetup[nameformat={\normalfont\heiti\zihao{3}},titleformat={\normalfont\heiti\zihao{3}\raggedright},%
number={\arabic{chapter}},name={,},afterskip={\SmallFourSkip},beforeskip={-1em}, aftername={~~}]{chapter}
\CTEXsetup[format+={\normalfont\heiti\zihao{4}\raggedright},afterskip={0pt},beforeskip={0.1\baselineskip},aftername={\quad}]{section}
\CTEXsetup[format+={\normalfont\heiti\zihao{-4}\raggedright},afterskip={0pt},beforeskip={0.2\baselineskip},aftername={\quad}]{subsection}

\CTEXoptions[bibname={\zihao{-2} 参考文献}]

%%% ---- 图表设置 ----- %%%%
\usepackage{tabularx}
\usepackage{tabulary}
\usepackage{booktabs}
\AtBeginEnvironment{tabularx}{\small} % 设置tabular环境
\AtBeginEnvironment{tabulary}{\small} % 设置tabularx环境
\setlength{\heavyrulewidth}{2.25pt}
\setlength{\lightrulewidth}{1pt}

\usepackage{subcaption}
\RequirePackage[labelsep=quad]{caption} %% 序号之后空一格写标题
% 设置图表编号格式为"图章号-图表号"
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% 自定义双语标题命令
\newcommand{\bilingualfigure}[2]{%
  \centering
  \caption{#1\\[-1pt] % 中文标题
  \small{Fig.\thefigure} #2} % 英文标题
}

\newcommand{\bilingualtable}[2]{%
  \centering
  \caption{#1\\[-1pt] % 中文标题
  \small{Tab.\thetable} #2} % 英文标题
}

% 设置图表标题格式：5号字、居中
\captionsetup[figure]{
  font={small}, % 5号字对应small
  labelsep=space,
  justification=centering, % 标题居中
  singlelinecheck=false, % 确保多行也居中
  skip=0pt
}

% 设置子图标题格式：5号字、居中
\captionsetup[subfigure]{
  font={small}, % 子图也使用5号字
  justification=centering,
  skip=0pt
}

\captionsetup[table]{
  font={small}, % 5号字对应small
  labelsep=space,
  justification=centering, % 标题居中
  singlelinecheck=false, % 确保多行也居中
  skip=0pt
}

%%%=== 图片路径=== %%%
\graphicspath{{figures/}}        % 图片放在 figures 文件夹.

%%%定义公式编号
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\usepackage{float}

%算法设置
\usepackage[linesnumbered,boxed,ruled,commentsnumbered,vlined]{algorithm2e}%%算法包，注意设置所需可选项
\renewcommand{\algorithmcfname}{算法} 
\SetAlgoSkip{0em}
% 增大标题上下与表框线的间距
\setlength{\interspacetitleruled}{0.5em}   % 顶线和标题之间
\setlength{\interspacealgoruled}{0.5em}    % 标题和下线之间

%设置附录
\usepackage{titlesec}
\RequirePackage[title,titletoc]{appendix}

\setlength{\parskip}{0pt}

\allowdisplaybreaks
\endlinechar `\^^M
\endinput
