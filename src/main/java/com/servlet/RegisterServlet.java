package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.entity.User;

@SuppressWarnings("serial")
@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fullname = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User u = new User(fullname, email, password);
		
//		System.out.println(u);
		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f = dao.saveuser(u);
		HttpSession session = req.getSession();
		
		if (f) {
//			System.out.println("Register Successful");
			session.setAttribute("msg", "Registered Successfully");
			resp.sendRedirect("register_successful.jsp");
		} else {
			session.setAttribute("msg", "Something wrong on server");
//			System.out.println("Something wrong on server");
			resp.sendRedirect("");
		}
	}

}
