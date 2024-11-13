package com.DigiShop.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.DigiShop.dao.AdminDao;
import com.DigiShop.dao.UserDao;
import com.DigiShop.entities.Admin;
import com.DigiShop.entities.Message;
import com.DigiShop.entities.User;
import com.DigiShop.helper.ConnectionProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
                                        request.setCharacterEncoding("UTF-8");
		String login = request.getParameter("login");
		if (login.trim().equals("user")) {
			try {
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");

				// getting user through entered email and passsword
				UserDao userDao = new UserDao(ConnectionProvider.getConnection());
				User user = userDao.getUserByEmailPassword(userEmail, userPassword);

				// storing current user in session
				HttpSession session = request.getSession();
				if (user != null) {
					session.setAttribute("activeUser", user);
					response.sendRedirect("index.jsp");
				} else {
					Message message = new Message("UserName Or Password Not Correct Try again!!", "error", "alert-danger");
					session.setAttribute("message", message);
					response.sendRedirect("login.jsp");
					return;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (login.trim().equals("admin")) {
			try {
				String userName = request.getParameter("email");
				String password = request.getParameter("password");

				AdminDao adminDao = new AdminDao(ConnectionProvider.getConnection());
				Admin admin = adminDao.getAdminByEmailPassword(userName, password);
				
				HttpSession session = request.getSession();
				if (admin != null) {
					session.setAttribute("activeAdmin", admin);
					response.sendRedirect("admin.jsp");
				} else {
					Message message = new Message("UserName Or Password Not Correct  Try again!!", "error", "alert-danger");
					session.setAttribute("message", message);
					response.sendRedirect("adminlogin.jsp");
					return;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
