# 贡献指南

## Commit message

提交遵循 [Conventional Commits](https://docs.cocogitto.io/guide/commit.html)，每次只包含一个明确目的的改动。

| `type` | 用途 | 示例 |
| --- | --- | --- |
| `chore` | 初始化、许可和一般维护 | `chore: 初始化题库项目` |
| `ci` | CI 配置 | `ci: 添加提交检查` |

- `type` 使用小写，`description` 使用非空中文，冒号后留一个空格。
- 暂不允许 `scope`；调整类型或范围时，同步更新 [配置](.github/cog.toml) 和本指南。

## CI

Cocogitto 检查本次 push 或整个 PR 的提交，仅豁免 merge 提交。不符合格式、类型或 scope 规则时检查失败；小写和中文要求由人工评审。
