# 西安理工大学硕士学位论文 LaTeX 模板

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![XeLaTeX](https://img.shields.io/badge/Compiler-XeLaTeX-blue.svg)]()

本项目是**西安理工大学学术型硕士学位论文** LaTeX 模板，格式遵循《西安理工大学研究生学位论文撰写规范》。

> **本模板改编自** [@imustwangxin/XAUT_Doctoral_Dissertation_Template](https://github.com/imustwangxin/XAUT_Doctoral_Dissertation_Template)（西安理工大学博士学位论文模板）。  
> 感谢原作者的贡献，本项目在其基础上调整为硕士学位论文格式。

---

## 目录结构

```
西安理工大学硕士学位论文模板/
├── XAUTMaster.tex          # 主文档入口（从这里编译）
├── XAUTMaster.cls          # 文档类定义
├── XAUTMaster.bib          # 参考文献数据库
├── gb7714-2015.bbx         # 国标参考文献样式（biblatex）
├── gb7714-2015.cbx
├── fonts/
│   ├── simsun.ttc          # 宋体（本地嵌入）
│   └── simhei.ttf          # 黑体（本地嵌入）
├── figures/
│   └── xaut01.png          # 学校徽标
├── parts/
│   ├── coverpage.tex       # 封面
│   ├── abstract.tex        # 中英文摘要
│   ├── originalitystate.tex # 独创性声明
│   ├── acknowledgment.tex  # 致谢
│   ├── achievement.tex     # 攻读硕士期间研究成果
│   ├── appendix.tex        # 附录
│   └── tocconfig.sty       # 目录格式配置
└── chapters/
    ├── cha.1_绪论.tex
    ├── cha.2_主体内容.tex   # 图/表/公式/算法/代码示例章
    └── cha.last_总结与展望.tex
```

## 使用方法

### 编译环境

- **编译器**：XeLaTeX（推荐 TeX Live 2022+）
- **参考文献**：biber

### 编译步骤

在 `西安理工大学硕士学位论文模板/` 目录下依次执行：

```bash
xelatex XAUTMaster.tex
biber XAUTMaster
xelatex XAUTMaster.tex
xelatex XAUTMaster.tex
```

### 填写论文信息

打开 `XAUTMaster.tex`，在元数据区修改以下字段：

| 命令 | 说明 |
|------|------|
| `\CTitleFirstLine` / `\CTitleSecondLine` | 封面论文题目（拆行） |
| `\CTitle` | 论文题目（完整） |
| `\StudentAuthor` | 研究生姓名 |
| `\StudentNumber` | 学号 |
| `\Csupervisor` / `\CsupervisorTitle` | 指导教师姓名和职称 |
| `\Cmajor` | 学科名称 |
| `\CSchool` | 所在学院 |
| `\DegreeCategory` | 学位类别（如：工学） |
| `\ClassficationNumber` | 图书分类号 |

### 添加章节

在 `XAUTMaster.tex` 中用 `\include{}` 添加章节文件，例如：

```latex
\include{chapters/cha.3_我的新章节}
```

### 参考文献

在 `XAUTMaster.bib` 中按 BibTeX 格式添加文献条目，正文中用 `\cite{key}` 引用。

## 主要格式规范

- **纸张**：A4，双面印刷（`forprint` 选项隐藏彩色超链接）
- **页边距**：上 2.5 cm，下 2.1 cm，左/右 2.1 cm，装订线 0.5 cm
- **正文字体**：小四号宋体，行距 20 磅
- **标题字体**：黑体加粗，三号（一级章）
- **页眉**：奇数页章标题，偶数页"西安理工大学硕士学位论文"
- **参考文献格式**：GB/T 7714-2015（使用 biblatex + biber）

## 致谢

- 本模板基于 [XAUT_Doctoral_Dissertation_Template](https://github.com/imustwangxin/XAUT_Doctoral_Dissertation_Template) 改编，原作者 [@imustwangxin](https://github.com/imustwangxin)
- 参考文献样式 `gb7714-2015` 来自 [hushidong/biblatex-gb7714-2015](https://github.com/hushidong/biblatex-gb7714-2015)

## License

MIT License — 详见 [LICENSE](LICENSE) 文件。
