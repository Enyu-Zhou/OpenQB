# 开源题库

OpenQB（Open Question Bank）是一个面向中国教育与学习场景的开源题库项目，致力于收集和整理高质量题目、答案与解析，为自主学习和教学提供可复用的资源。欢迎共同贡献题目、完善解析与纠正错误。

贡献前请阅读[贡献指南](CONTRIBUTING.md)。

## 项目优势

- 矢量插图，放大与打印依然清晰。
- 精美排版，统一呈现题目、公式与图形。
- 配套答案与解析，提供试题版和解析版 PDF。
- 提供 Typst 源码，便于修改、组卷与二次加工。
- 永久免费开源。

## 下载 PDF

在 [PDF 分支](https://github.com/Enyu-Zhou/OpenQB/tree/pdf) 按学科、考试类型和年份浏览，可预览并单独下载每份试卷及解析版，无需安装编译工具。

默认分支通过格式检查和编译后自动更新 `pdf` 分支，保留原目录结构，仅保留最新快照。

## 快速开始

安装 [Homebrew](https://brew.sh/) 后执行：

```sh
# 安装工具
brew install typst typstyle tinymist git-lfs
git lfs install

# 克隆仓库，自动下载字体
git clone https://github.com/Enyu-Zhou/OpenQB.git
cd OpenQB

# 生成试卷
./scripts/build.sh
```

将 `questions/` 下的试卷按原目录结构输出到 `output/pdf/`，生成 `原文件名.pdf` 和 `原文件名-解析版.pdf`。

## 致谢

感谢 [deekur/gaokaomath](https://github.com/deekur/gaokaomath) 整理和分享历年高考数学真题，为本项目的试题录入与核验提供参考。本项目对相关试题重新排版、绘图，并整理与完善答案和解析；具体来源见各试卷源码中的 `source` 字段。

## 许可协议

本项目有权授权的内容采用 [CC BY 4.0](LICENSE) 许可；第三方内容遵循各自的许可声明。

- 可以免费复制、分享、修改和二次创作，也允许商业使用。
- 对外分享时，须保留已有的作者署名、版权及免责声明，提供来源和许可链接；修改后须说明改动，并保留已有的修改说明。
- 不得暗示原作者为你的使用背书，也不得通过额外条款或技术措施限制他人依许可享有的权利。
- 内容按原样提供，不保证完全准确或适用于特定用途。

完整条款以 [LICENSE](LICENSE) 为准，也可阅读 [CC 官方中文说明](https://creativecommons.org/licenses/by/4.0/deed.zh-hans)。
