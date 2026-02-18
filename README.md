# Mailbox Manager

一个现代化的邮箱管理系统，支持多账户管理、邮件同步、垃圾箱过滤等功能。

## 功能特性

- ✅ 多邮箱账户管理（Microsoft、Gmail、通用IMAP）
- ✅ OAuth2 和密码认证支持
- ✅ 邮件同步（收件箱 + 垃圾箱）
- ✅ 代理支持（全局代理 + 账户级代理）
- ✅ 批量导入/导出账户
- ✅ 邮件搜索和过滤
- ✅ 响应式 Web 界面

## 技术栈

### 后端
- FastAPI (Python 3.12+)
- SQLAlchemy (异步 ORM)
- SQLite 数据库
- IMAP/SMTP 协议
- Microsoft Graph API

### 前端
- Vue 3 + TypeScript
- Element Plus UI
- Vite 构建工具
- Pinia 状态管理

## 快速开始

### 环境要求
- Python 3.12+
- Node.js 18+
- npm 或 yarn

### 安装依赖

**后端**:
```bash
cd backend
pip install -r requirements.txt
```

**前端**:
```bash
cd frontend
npm install
```

### 运行项目

**后端**:
```bash
cd backend
python -m uvicorn main:app --host 0.0.0.0 --port 8000
```

**前端**:
```bash
cd frontend
npm run dev
```

访问 `http://localhost:5173` 即可使用。

## 配置说明

### 后端配置
编辑 `backend/.env` 文件：
```env
SECRET_KEY=your-secret-key
DATABASE_URL=sqlite+aiosqlite:///./mailbox.db
```

### 代理配置
支持 HTTP、SOCKS4、SOCKS5 代理：
```
socks5://username:password@host:port
http://username:password@host:port
```

## 部署

### Systemd 服务（Linux）

**后端服务**:
```bash
systemctl --user enable mailbox-backend.service
systemctl --user start mailbox-backend.service
```

**前端服务**:
```bash
systemctl --user enable mailbox-frontend.service
systemctl --user start mailbox-frontend.service
```

## 项目结构

```
mailbox-manager/
├── backend/              # 后端代码
│   ├── app/
│   │   ├── api/         # API 路由
│   │   ├── core/        # 核心配置
│   │   ├── models/      # 数据模型
│   │   └── services/    # 业务逻辑
│   ├── main.py          # 入口文件
│   └── requirements.txt
├── frontend/            # 前端代码
│   ├── src/
│   │   ├── api/        # API 客户端
│   │   ├── components/ # 组件
│   │   ├── views/      # 页面
│   │   └── stores/     # 状态管理
│   └── package.json
└── README.md
```

## 安全说明

- 敏感数据（密码、Token）加密存储
- 支持代理隐藏真实 IP
- 导出功能包含安全警告
- 建议使用 HTTPS 部署生产环境

## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！

## 联系方式

如有问题，请提交 Issue。
