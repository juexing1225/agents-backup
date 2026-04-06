#!/bin/bash
# 阿段配置备份脚本

set -e

cd /Users/juexing/.openclaw/workspace

echo "🔄 开始备份阿段配置..."

# 检查是否有变更
if git diff --quiet && git diff --cached --quiet; then
    echo "📝 没有变更需要备份"
    exit 0
fi

# 添加所有文件
git add .

# 创建提交信息
COMMIT_MSG="阿段配置更新: $(date '+%Y-%m-%d %H:%M:%S')"
if [ $# -gt 0 ]; then
    COMMIT_MSG="$1"
fi

# 提交变更
git commit -m "$COMMIT_MSG"

echo "✅ 阿段配置已备份: $(git log -1 --format='%h %s')"
echo "📊 总提交数: $(git rev-list --count HEAD)"
echo "📁 当前分支: $(git branch --show-current)"
