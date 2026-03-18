# AI Chat Application - Complete Setup Guide

## 📋 Prerequisites

Before starting, ensure you have installed:
- **Node.js 18+** (https://nodejs.org)
- **Python 3.9+** (https://www.python.org)
- **PostgreSQL 12+** (https://www.postgresql.org)

## 🚀 Quick Start (Windows)

1. Run the setup script:
```bash
setup.bat
```

2. Configure environment variables (see configurations below)

3. Create PostgreSQL database:
```sql
CREATE DATABASE ai_chat_db;
```

4. Run database initialization:
```bash
psql -U postgres -d ai_chat_db -f backend/database.sql
```

5. Start backend:
```bash
cd backend
.\venv\Scripts\activate
python main.py
```

6. Start frontend (in new terminal):
```bash
cd frontend
npm run dev
```

7. Open browser and visit: http://localhost:3000

## 🐧 Quick Start (Linux/Mac)

1. Run the setup script:
```bash
chmod +x setup.sh
./setup.sh
```

2. Configure environment variables (see configurations below)

3. Create PostgreSQL database:
```sql
CREATE DATABASE ai_chat_db;
```

4. Run database initialization:
```bash
psql -U postgres -d ai_chat_db -f backend/database.sql
```

5. Start backend:
```bash
cd backend
source venv/bin/activate
python main.py
```

6. Start frontend (in new terminal):
```bash
cd frontend
npm run dev
```

7. Open browser and visit: http://localhost:3000

## 🐳 Docker Setup

1. Create `.env` file in root with:
```env
GOOGLE_GEMINI_API_KEY=your-api-key
NEXTAUTH_SECRET=your-secret
GOOGLE_CLIENT_ID=your-client-id
GOOGLE_CLIENT_SECRET=your-client-secret
```

2. Run:
```bash
docker-compose up
```

3. Visit: http://localhost:3000

## ⚙️ Environment Configuration

### Backend (.env)
```env
DATABASE_URL=postgresql://postgres:password@localhost:5432/ai_chat_db
GOOGLE_GEMINI_API_KEY=your-gemini-api-key
FASTAPI_ENV=development
```

### Frontend (.env.local)
```env
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=your-secret-key-here-min-32-chars
GOOGLE_CLIENT_ID=your-google-oauth-client-id
GOOGLE_CLIENT_SECRET=your-google-oauth-client-secret
NEXT_PUBLIC_API_URL=http://localhost:8000
```

## 🔑 Getting API Keys

### Google OAuth Setup
1. Go to [Google Cloud Console](https://console.cloud.google.com)
2. Create a new project
3. Enable Google+ API
4. Create OAuth 2.0 Credentials (Web Application)
5. Add authorized redirect URIs:
   - http://localhost:3000/api/auth/callback/google
   - http://localhost:3000

### Google Gemini API Key
1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create a new API key
3. Copy and paste in `.env`

## 📁 Project Structure

```
AI Chat App/
├── frontend/                 # Next.js frontend
│   ├── app/
│   │   ├── api/auth/        # NextAuth configuration
│   │   ├── components/      # React components
│   │   ├── styles/          # CSS modules
│   │   ├── layout.js
│   │   └── page.js
│   ├── package.json
│   └── .env.local
├── backend/                 # FastAPI backend
│   ├── app/
│   │   ├── models/          # SQLAlchemy models
│   │   ├── routes/          # API endpoints
│   │   ├── schemas/         # Pydantic schemas
│   │   ├── services/        # Business logic
│   │   ├── config.py
│   │   └── database.py
│   ├── main.py
│   ├── requirements.txt
│   └── .env
├── docker-compose.yml
└── README.md
```

## 🔧 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/chat` | Send message and get AI response |
| GET | `/api/chats` | Get all user chats |
| GET | `/api/chats/{chat_id}` | Get specific chat with messages |
| DELETE | `/api/chats/{chat_id}` | Delete a chat |
| GET | `/health` | Health check |

## 🎯 Features

- ✅ **Google OAuth Authentication** - Secure login with Google
- ✅ **Real-time Chat Interface** - Clean, responsive UI built with React
- ✅ **Chat History** - Persistent storage with PostgreSQL
- ✅ **AI Context Awareness** - Gemini API with conversation context
- ✅ **Chat Management** - Create, delete, and organize chats
- ✅ **User Profile** - View user information in modal
- ✅ **Responsive Design** - Works on desktop and mobile
- ✅ **Component Architecture** - Reusable React components

## 📱 Component Overview

### Frontend Components

1. **ChatContainer** - Main container managing chat state
2. **Sidebar** - Display chat list and navigation
3. **ChatWindow** - Display messages
4. **InputBox** - Message input with send button
5. **ProfileModal** - User profile information

### Backend Services

1. **GeminiService** - Integration with Google Gemini API
2. **Database Models** - User, Chat, Message models
3. **API Routes** - REST endpoints for chat operations

## 🐛 Troubleshooting

### Port Already in Use
- Backend: Change port in `main.py` (default: 8000)
- Frontend: `npm run dev -- -p 3001` (change to different port)

### Database Connection Error
- Ensure PostgreSQL is running
- Check DATABASE_URL in `.env`
- Verify database exists: `psql -l`

### Google OAuth Error
- Verify CLIENT_ID and CLIENT_SECRET
- Check authorized redirect URIs in Google Console
- Ensure `NEXTAUTH_SECRET` is set

### Gemini API Error
- Verify API key is correct
- Check API key is active in Google AI Studio
- Ensure API key has proper permissions

## 📞 Support

For issues or questions:
1. Check the README.md
2. Review error logs in terminal
3. Verify all environment variables are set


