# 开源题库

OpenQB（Open Question Bank）是一个面向中国教育与学习场景的开源题库项目，致力于收集和整理高质量题目、答案与解析，为自主学习和教学提供可复用的资源。欢迎共同贡献题目、完善解析与纠正错误。

贡献前请阅读[贡献指南](CONTRIBUTING.md)。

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

## 许可协议

本项目有权授权的内容采用 [CC BY 4.0](LICENSE) 许可；第三方内容遵循各自的许可声明。
