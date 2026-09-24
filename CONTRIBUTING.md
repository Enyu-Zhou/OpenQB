# 贡献指南

## 试卷内容编写

### 试卷

每卷一个 `.typ`，放在 `questions/学科/考试类型/年份/`；通过 `#show: exam.with(...)` 传入以下参数：

| 字段 | 含义 | 类型 | 默认值 |
| --- | --- | --- | --- |
| `subject` | 科目 | `str` | 必填 |
| `year` | 考试年份 | 正整数 `int` | 必填 |
| `type` | 考试类型的完整名称，用于试卷标题 | `str` | 必填 |
| `name` | 试卷名称 | `str` | 必填 |
| `source` | 原始试卷的来源链接 | `str` | 必填 |
| `regions` | 适用地区 | `array<str>` | 必填 |

### 大题

用 `#section[标题及说明]` 分节，大题编号自动生成，小题编号跨节连续。

### 题目

用 `question` 录题：

| 字段 | 含义 | 类型 | 默认值 |
| --- | --- | --- | --- |
| `type` | 题目类型，第一个位置参数 | `str`：<br>`"single-choice"`：单选题<br>`"multiple-choice"`：多选题<br>`"fill-in"`：填空题<br>`"solution"`：解答题 | 必填 |
| `stem` | 题干 | `content` | `[]` |
| `choices` | 选项 | `array<content>` | `()` |
| `parts` | 子问 | `array<dictionary>` | `()` |
| `answers` | 答案 | `array<content>` | `()` |
| `explanation` | 解析 | `content` | `[]` |

- 行内公式与文字间留一个半角空格，与标点、内容块边界间不加空格。
- 数学题目公式内使用英文标点，公式外使用中文标点，Typst 语法除外。

### 题干

- 单选、多选题：题干须有且仅有一个 `#choice-placeholder()`。
- 填空题：使用 `#fill-placeholder()`。

### 选项

选项编号自动生成。

### 子问

- 通过 `parts: (subquestion(...), ...)` 录入，每个子问有 `stem`、`answers`、`explanation`；最多支持题目、子问、子子问三级。
- 编号自动生成，依次使用 `(1)`、`(i)`；答案、解析按同一编号在整道题后展示。

### 答案

- 单选题：答案须为一个有效选项编号，如 `answers: ([B],)`。
- 多选题：一个或多个有效选项字母合写在一个答案项中，不可重复，如 `answers: ([AC],)`。
- 填空、解答题：按空或小问顺序填写，每项对应一个空或小问，等价写法放在同一项。

### 解析

- 每行一个推导环节，长公式单独列出。
- 长解析和逐项分析用 `#step[步骤说明][推导过程]`，选项步骤写“选项 A”等。
- 优先使用 `∵`、`∴`、`∈`、`∉`、`⊆` 表示对应关系。

### 插图

- 使用 `lib.typ` 导出的 `cetz` 绘制矢量图，`#cetz.canvas(...)` 可嵌入题干、选项、子问、答案或解析。
- 平面图使用二维坐标；空间图使用三维坐标和 `cetz.draw.ortho` 投影。按几何关系计算点位，遮挡线用虚线，标签避开图线。
- 绘图函数直接放在对应的试卷 `.typ` 文件中，按需在解析中加入辅助线和参考图。

## Commit

### 格式化与检查

在项目根目录依次执行以下脚本，确保全部通过：

```sh
# 格式化 Typst 文件
./scripts/format.sh
# 检查格式和试卷代码
./scripts/lint.sh
# 编译试卷 PDF
./scripts/build.sh
```

### Commit message

提交遵循 [Conventional Commits](https://docs.cocogitto.io/guide/commit.html)，每次只包含一个明确目的的改动。

| `type` | 用途 | 示例 |
| --- | --- | --- |
| `chore` | 初始化、许可和一般维护 | `chore: 初始化题库项目` |
| `ci` | CI 配置 | `ci: 添加提交检查` |
| `feat` | 新功能或题目 | `feat(questions): 录入试卷单选题` |
| `build` | 构建与工具脚本 | `build: 添加试卷构建脚本` |

- `type` 使用小写，`description` 使用非空中文，冒号后留一个空格。
- `scope` 可选，支持 `typst`（公共排版与校验）和 `questions`（试卷内容）。
- 调整类型或范围时，同步更新 [配置](.github/cog.toml) 和本指南。

### CI

源码分支的每次 push 和 PR 都会通过 Homebrew 安装其收录的最新稳定版工具，并运行 `./scripts/lint.sh` 和 `./scripts/build.sh`，两者均须通过。

默认分支 push 通过上述检查后，自动将试卷与解析版按原目录结构发布到 `pdf` 分支。该分支每次以单个根提交强制更新，仅保留最新快照，删除或改名的文件会同步移除；请勿手动修改，也不要对该分支禁止强制推送。PR 和其他分支不发布。

Cocogitto 检查本次 push 或整个 PR 的提交，仅豁免 merge 提交。不符合格式、类型或 scope 规则时检查失败；小写和中文要求由人工评审。
