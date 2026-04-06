#!/bin/bash
# 阿段配置恢复脚本

set -e

cd /Users/juexing/.openclaw/workspace

if [ $# -eq 0 ]; then
    echo "用法: $0 <commit-hash|tag>"
    echo "示例: $0 abc1234 或 $0 v1.0.0"
    exit 1
fi

TARGET=$1

echo "🔄 恢复阿段配置到: $TARGET"

# 检查目标是否存在
if ! git show --quiet $TARGET &> /dev/null; then
    echo "❌ 找不到提交: $TARGET"
    echo "可用提交:"
    git log --oneline -10
    exit 1
fi

# 执行恢复
git checkout $TARGET

echo "✅ 阿段配置已恢复到: $TARGET"
echo "📝 恢复详情:"
git show --stat $TARGET
