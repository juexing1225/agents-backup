#!/bin/bash
# 阿段Git状态检查脚本

cd /Users/juexing/.openclaw/workspace

echo "📊 阿段Git状态检查"
echo "=================="

# 仓库状态
echo "📁 仓库状态:"
if git status --porcelain | grep -q "."; then
    echo "   ⚠️ 有未提交的变更:"
    git status --short
else
    echo "   ✅ 工作区干净"
fi

# 历史统计
echo ""
echo "📈 历史统计:"
echo "   总提交数: $(git rev-list --count HEAD)"
echo "   最后提交: $(git log -1 --format='%h %s (%cd)' --date=short)"
echo "   文件总数: $(git ls-files | wc -l)"

# 分支状态
echo ""
echo "🌿 分支状态:"
git branch -a
