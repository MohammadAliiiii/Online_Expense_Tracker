# 💸 Online Expense Tracker

A lightweight full-stack web application built using Java EE technologies to **track, manage, and visualize personal expenses**.  
The project emphasizes modular architecture and practical functionality using DAO, JSP, Servlets, and JDBC.

---

## 📌 Key Features (80/20 Optimized)

- 🧾 **Add, View, Delete Transactions** — core actions that deliver 80% of value
- 📊 **Real-Time Balance Updates**
- 👤 **User Authentication (Login & Signup)**
- 📄 **Transaction History Table**
- 📐 **Simple UI with JSP**

---

## 🧱 Tech Stack

| Layer            | Technology Used       |
|------------------|------------------------|
| Frontend (View)  | JSP + HTML + CSS       |
| Controller       | Java Servlets          |
| Business Logic   | DAO Pattern (Java)     |
| Data Layer       | JDBC + MySQL           |
| Entity Classes   | POJOs (Plain Old Java Objects) |

---

## 📂 Project Structure

Online_Expense_Tracker/ ├── src/ │   ├── dao/           # Database logic │   ├── db/            # Connection factory │   ├── entity/        # User and Transaction models │   ├── servlet/       # Controllers (Add, Delete, Login, etc.) ├── WebContent/ │   ├── pages/         # JSP views │   ├── css/           # Stylesheets │   └── WEB-INF/       # web.xml configuration

---

## ⚙️ How to Run

### Prerequisites
- JDK 8+
- Apache Tomcat (or any Java EE servlet container)
- MySQL Server
- MySQL Connector/J (JDBC Driver)

### Steps

1. **Clone the Repo**
   ```bash
   git clone https://github.com/MohammadAliiiii/Online_Expense_Tracker.git

2. Import in IDE

Open in Eclipse / IntelliJ as a Dynamic Web Project



3. Configure Database

Create MySQL DB (e.g., expense_tracker)

Import the SQL schema if present

Edit DB credentials in /db/DBConnect.java



4. Deploy

Run on Apache Tomcat

Access via http://localhost:8080/Online_Expense_Tracker
