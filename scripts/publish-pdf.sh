#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

# 旧工作流的重跑不应覆盖默认分支的新版本。
head_sha=$(gh api "repos/$GH_REPO/commits/$GITHUB_REF_NAME" --jq '.sha')
if [[ "$head_sha" != "$GITHUB_SHA" ]]; then
  printf 'Skipping publication for an outdated commit.\n'
  exit 0
fi

snapshot_dir=$(mktemp -d)
trap 'rm -rf "$snapshot_dir"' EXIT

# 只复制 PDF，并保留 questions 下的目录结构。
count=0
while IFS= read -r -d '' pdf; do
  relative="${pdf#output/pdf/}"
  mkdir -p "$snapshot_dir/$(dirname "$relative")"
  cp "$pdf" "$snapshot_dir/$relative"
  count=$((count + 1))
done < <(find output/pdf -type f -name '*.pdf' -print0)
if [[ "$count" -eq 0 ]]; then
  printf 'No PDF files found.\n' >&2
  exit 1
fi

cp LICENSE "$snapshot_dir/LICENSE"
cat > "$snapshot_dir/README.md" <<EOF
# 最新 PDF

按目录浏览试卷与解析版，打开 PDF 后可预览或下载。

本分支由 CI 自动更新，仅保留最新快照，请勿手动修改。

源码提交：[$GITHUB_SHA]($GITHUB_SERVER_URL/$GH_REPO/tree/$GITHUB_SHA)

构建时间：$(date -u '+%Y-%m-%d %H:%M:%S UTC')

本项目有权授权的内容采用 [CC BY 4.0](LICENSE) 许可；第三方内容遵循各自的许可声明。
EOF

# 每次从独立根提交发布，只替换 pdf 分支，不累积 PDF 提交历史。
git -C "$snapshot_dir" init --initial-branch=pdf
git -C "$snapshot_dir" add .
git -C "$snapshot_dir" -c user.name='github-actions[bot]' \
  -c user.email='41898282+github-actions[bot]@users.noreply.github.com' \
  commit -m "build: 更新 PDF（${GITHUB_SHA}）"
git -C "$snapshot_dir" -c credential.helper= \
  -c 'credential.helper=!gh auth git-credential' \
  push --force "$GITHUB_SERVER_URL/$GH_REPO.git" HEAD:refs/heads/pdf
