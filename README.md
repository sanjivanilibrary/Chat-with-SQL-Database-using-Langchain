# 🐦 Chat with SQL Database using LangChain & Groq

This project is a **Streamlit application** that allows you to interact with a SQL database (SQLite or MySQL) using **LangChain** and **Groq LLMs**.  
You can ask natural language questions, and the app will generate and execute SQL queries to fetch answers from your database.

---

## 🚀 Features
- Connect to either:
  - Local **SQLite** database (`Student.db`)
  - Remote **MySQL** database
- Query databases using **natural language** powered by Groq LLMs
- Interactive **chat interface** with conversation history
- SQL injection warning and safe query handling
- Clear conversation option to reset chat
- Customizable database connection via sidebar

---

## 🛠️ Requirements
- Python 3.9+
- Streamlit
- LangChain
- Groq SDK
- SQLAlchemy
- MySQL driver (`mysql-connector-python`)

---

## 📦 Installation

Clone the repository and install dependencies:

```bash
git clone https://github.com/yourusername/sql-chat-app.git
cd sql-chat-app
pip install -r requirements.txt
