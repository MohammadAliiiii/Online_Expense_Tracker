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

Online_Expense_Tracker/
├── src/
│   ├── dao/                    # Data Access Objects (e.g., UserDao.java, ExpenseDao.java)
│   ├── db/                     # DB connection (e.g., DBConnect.java)
│   ├── entity/                 # POJOs (e.g., User.java, Expense.java)
│   ├── servlet/                # Java Servlets (e.g., LoginServlet.java, AddExpenseServlet.java)
├── WebContent/
│   ├── css/                    # Stylesheets
│   ├── js/                     # JavaScript files (if any)
│   ├── images/                 # Images and icons
│   ├── pages/                  # JSP files (e.g., login.jsp, dashboard.jsp)
│   └── WEB-INF/
│       └── web.xml             # Deployment descriptor
├── README.md
└── .classpath / .project       # Eclipse-specific files

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
