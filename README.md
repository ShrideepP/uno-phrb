# 🃏 Uno Multiplayer Game (PHRB Stack)

This is an online multiplayer Uno card game built using **PostgreSQL, Hono.js, React, and Bun**.

---

## 🚀 Tech Stack

- **Backend:** Hono.js (with Bun runtime)
- **Frontend:** React.js (Vite)
- **Database:** PostgreSQL
- **WebSockets:** Real-time game updates

---

## 🎯 Features

✅ User Authentication (JWT-based)  
✅ Lobby system for creating and joining games  
✅ Turn-based gameplay mechanics  
✅ Real-time game updates via WebSockets  
✅ Game rule enforcement  
✅ Leaderboard tracking

---

## 🛠 Setup Instructions

### **1️⃣ Clone the repository**

```sh
git clone https://github.com/yourusername/uno-phrb.git
cd uno-phrb
```

### **2️⃣ Setup Backend**

```sh
cd backend
bun install
bun run dev
```

- Create a `.env` file and configure the database connection.

### **3️⃣ Setup Frontend**

```sh
cd ../frontend
npm install
npm run dev
```

---

## 📌 **To-Do List (Feature Implementation Order)**

### **Phase 1: Backend Foundation**

- [ ] Set up Hono.js server with Bun
- [ ] Configure PostgreSQL database connection
- [ ] Implement authentication (register, login, logout)
- [ ] Create WebSocket server for real-time updates
- [ ] Define database models (User, Game, Player, Card)
- [ ] Implement core game logic (turns, card effects)

### **Phase 2: API Development**

- [ ] Implement `POST /games/create` (Create a game)
- [ ] Implement `POST /games/join/:gameId` (Join a game)
- [ ] Implement `POST /games/start/:gameId` (Start a game)
- [ ] Implement `POST /games/:gameId/play` (Play a card)
- [ ] Implement `POST /games/:gameId/draw` (Draw a card)
- [ ] Implement `POST /games/:gameId/call-uno` (Call UNO)
- [ ] Implement `POST /games/:gameId/pass` (Pass turn)
- [ ] Implement `GET /games/:gameId/state` (Fetch game state)

### **Phase 3: Frontend Development**

- [ ] Set up React project with Vite
- [ ] Implement authentication UI (login, register)
- [ ] Create game lobby UI (join/create games)
- [ ] Implement game board UI (players, cards, actions)
- [ ] Integrate WebSocket communication
- [ ] Show real-time game updates

### **Phase 4: Final Touches**

- [ ] Implement leaderboard tracking
- [ ] Add animations & sound effects
- [ ] Improve UI with Tailwind CSS
- [ ] Deploy backend and frontend

---

## 🤝 Contributing

Want to contribute? Feel free to submit a pull request!

---

## 📜 License

MIT License © 2025 Uno Game Team
