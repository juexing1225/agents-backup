# 阿段Git备份系统使用说明

## 🚀 快速开始

### 手动备份
```bash
./backup-agents.sh "自定义提交信息"
```

### 智能备份（检查变更）
```bash
./smart-backup.sh "自定义提交信息"
```

### 检查状态
```bash
./check-status.sh
```

### 恢复配置
```bash
./restore-agents.sh <commit-hash|tag>
```

### 自动备份
```bash
./auto-backup.sh
```

## 📋 常用命令

### Git基础操作
```bash
# 查看提交历史
git log --oneline

# 查看文件变更
git diff HEAD~1 HEAD

# 查看当前状态
git status

# 创建标签
git tag v1.0.0
```

## ⚠️ 注意事项

1. **定期检查**：使用 `./check-status.sh` 检查备份状态
2. **重要操作前备份**：修改重要配置前先提交当前版本
3. **远程仓库**：需要手动创建GitHub仓库并添加远程地址

## 🆘 远程仓库设置

由于没有GitHub CLI，需要手动设置：

1. 创建GitHub仓库：https://github.com/new
2. 仓库名称：agents-backup
3. 设置为Public或Private
4. 添加远程地址：
```bash
git remote add origin https://github.com/你的用户名/agents-backup.git
git push -u origin main
```
