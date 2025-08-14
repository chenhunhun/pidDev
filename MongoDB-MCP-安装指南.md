# MongoDB MCP 服务器安装指南

## 概述
MongoDB MCP (Model Context Protocol) 服务器允许您通过自然语言与 MongoDB 数据库进行交互，特别适用于 Claude Desktop 等 AI 助手。

## 前置要求
- Node.js v18 或更高版本（已安装 v22.16.0 ✅）
- npm 包管理器（已安装 v10.9.2 ✅）
- MongoDB 数据库实例（本地或远程）

## 安装步骤

### 1. 验证环境
```bash
# 检查 Node.js 版本
node --version

# 检查 npm 版本
npm --version
```

### 2. 安装 MongoDB MCP 服务器
```bash
# 全局安装官方 MongoDB MCP 服务器
npm install -g mongodb-mcp-server
```

### 3. 验证安装
```bash
# 检查安装是否成功
mongodb-mcp-server --help
```

## 配置方法

### 方法1：Claude Desktop 配置

1. **找到 Claude Desktop 配置文件：**
   - **Linux:** `~/.config/Claude/claude_desktop_config.json`
   - **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
   - **Windows:** `%APPDATA%/Claude/claude_desktop_config.json`

2. **编辑配置文件，添加以下内容：**
```json
{
  "mcpServers": {
    "mongodb": {
      "command": "mongodb-mcp-server",
      "args": [
        "mongodb://用户名:密码@主机:端口/数据库名?authSource=admin"
      ]
    }
  }
}
```

### 方法2：npx 方式配置
```json
{
  "mcpServers": {
    "mongodb": {
      "command": "npx",
      "args": [
        "-y",
        "mongodb-mcp-server",
        "mongodb://用户名:密码@主机:端口/数据库名?authSource=admin"
      ]
    }
  }
}
```

## 连接字符串示例

### 本地 MongoDB
```
mongodb://localhost:27017/mydatabase
```

### 带认证的本地 MongoDB
```
mongodb://username:password@localhost:27017/mydatabase?authSource=admin
```

### MongoDB Atlas (云服务)
```
mongodb+srv://username:password@cluster.mongodb.net/mydatabase?retryWrites=true&w=majority
```

### 本地 MongoDB 副本集
```
mongodb://username:password@host1:27017,host2:27017,host3:27017/mydatabase?replicaSet=myReplicaSet&authSource=admin
```

## 安全注意事项

1. **不要在配置文件中硬编码密码**
2. **使用环境变量存储敏感信息**
3. **确保 MongoDB 用户具有适当的权限**
4. **考虑使用 MongoDB 连接字符串的 SSL/TLS 选项**

## 环境变量配置示例

创建 `.env` 文件：
```bash
MONGODB_URI=mongodb://username:password@localhost:27017/mydatabase?authSource=admin
```

然后在配置中使用：
```json
{
  "mcpServers": {
    "mongodb": {
      "command": "mongodb-mcp-server",
      "args": ["${MONGODB_URI}"],
      "env": {
        "MONGODB_URI": "mongodb://username:password@localhost:27017/mydatabase?authSource=admin"
      }
    }
  }
}
```

## 使用示例

配置完成后，您可以在 Claude Desktop 中使用自然语言与 MongoDB 交互：

- "显示所有集合"
- "查找用户集合中的所有文档"
- "创建一个名为 'products' 的新集合"
- "向 users 集合插入一个新用户"
- "更新用户 ID 为 123 的邮箱地址"

## 故障排除

### 常见问题

1. **连接失败**
   - 检查 MongoDB 服务是否运行
   - 验证连接字符串是否正确
   - 确认网络连接和防火墙设置

2. **认证失败**
   - 检查用户名和密码
   - 确认用户权限
   - 验证 `authSource` 参数

3. **MCP 服务器未响应**
   - 重启 Claude Desktop
   - 检查配置文件语法
   - 查看 Claude Desktop 日志

### 日志查看
在 Claude Desktop 中，您可以在设置中查看 MCP 服务器的状态和日志。

## 替代方案

如果官方包有问题，您也可以尝试其他 MongoDB MCP 实现：

```bash
# 其他可用的 MongoDB MCP 服务器
npm install -g @harryelv/mongodb-mcp-server
npm install -g @pash1986/mcp-server-mongodb
npm install -g mongo-mongoose-mcp
```

## 更新和维护

定期更新 MCP 服务器：
```bash
npm update -g mongodb-mcp-server
```

检查新版本：
```bash
npm outdated -g mongodb-mcp-server
```

---

**注意**: 请根据您的具体 MongoDB 配置调整连接字符串和认证参数。确保在生产环境中遵循安全最佳实践。