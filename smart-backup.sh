#!/bin/bash
# 阿段智能备份脚本

set -e

cd /Users/juexing/.openclaw/workspace

# 检查是否有变更
if git diff --quiet && git diff --cached --quiet; then
    echo "📝 没有变更需要备份"
    exit 0
fi

# 执行备份
./backup-agents.sh "$1"

# 显示备份统计
echo "📈 备份统计:"
echo "   文件数: $(git diff --name-only HEAD~1 HEAD | wc -l)"
echo "   提交大小: $(git show HEAD --stat | tail -1)"
