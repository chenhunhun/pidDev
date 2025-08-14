#!/bin/bash

# MongoDB MCP 服务器自动安装脚本
# MongoDB MCP Server Auto Installation Script

echo "🚀 开始安装 MongoDB MCP 服务器..."
echo "🚀 Starting MongoDB MCP Server installation..."

# 检查 Node.js 是否已安装
echo "📋 检查系统要求..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装。请先安装 Node.js v18 或更高版本。"
    echo "❌ Node.js is not installed. Please install Node.js v18 or higher first."
    exit 1
fi

# 检查 npm 是否已安装
if ! command -v npm &> /dev/null; then
    echo "❌ npm 未安装。请先安装 npm。"
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

# 显示当前版本
echo "✅ Node.js 版本: $(node --version)"
echo "✅ npm 版本: $(npm --version)"

# 安装 MongoDB MCP 服务器
echo "📦 正在安装 MongoDB MCP 服务器..."
echo "📦 Installing MongoDB MCP Server..."

if npm install -g mongodb-mcp-server; then
    echo "✅ MongoDB MCP 服务器安装成功！"
    echo "✅ MongoDB MCP Server installed successfully!"
else
    echo "❌ 安装失败。请检查网络连接和权限。"
    echo "❌ Installation failed. Please check network connection and permissions."
    exit 1
fi

# 检查安装
echo "🔍 验证安装..."
if command -v mongodb-mcp-server &> /dev/null; then
    echo "✅ 安装验证成功！"
    echo "✅ Installation verified successfully!"
else
    echo "⚠️  命令未找到，但包可能已安装。您可以使用 npx mongodb-mcp-server"
    echo "⚠️  Command not found, but package may be installed. You can use npx mongodb-mcp-server"
fi

echo ""
echo "📖 下一步："
echo "📖 Next steps:"
echo "1. 配置您的 MongoDB 连接字符串"
echo "1. Configure your MongoDB connection string"
echo "2. 编辑 Claude Desktop 配置文件"
echo "2. Edit Claude Desktop configuration file"
echo "3. 重启 Claude Desktop"
echo "3. Restart Claude Desktop"
echo ""
echo "📄 详细配置说明请查看: MongoDB-MCP-安装指南.md"
echo "📄 For detailed configuration instructions, see: MongoDB-MCP-安装指南.md"