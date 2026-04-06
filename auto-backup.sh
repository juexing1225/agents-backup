#!/bin/bash
# 阿段自动备份脚本

set -e

cd /Users/juexing/.openclaw/workspace

# 检查是否需要备份
if git diff --quiet && git diff --cached --quiet; then
    echo "📝 $(date '+%Y-%m-%d %H:%M:%S') - 没有变更需要备份"
    exit 0
fi

# 执行备份
echo "🔄 $(date '+%Y-%m-%d %H:%M:%S') - 开始自动备份..."
./backup-agents.sh "自动备份: $(date '+%Y-%m-%d %H:%M:%S')"

echo "✅ $(date '+%Y-%m-%d %H:%M:%S') - 自动备份完成"
