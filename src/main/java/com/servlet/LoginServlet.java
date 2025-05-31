package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

        if (HibernateUtil.getSessionFactory() == null) {
            session.setAttribute("msg", "Server error. Please try again later.");
            resp.sendRedirect("login.jsp");
            return;
        }

        UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
        User u = dao.login(email, password);

        if (u == null) {
            session.setAttribute("msg", "Invalid Email or Password!");
            resp.sendRedirect("login.jsp");
        } else {
            session.setAttribute("loginUser", u);
            resp.sendRedirect("user/home.jsp");
        }
    }
}
