package com.fashionshop.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fashionshop.dao.AdminDao;
import com.fashionshop.dao.UserDao;
import com.fashionshop.entities.Admin;
import com.fashionshop.entities.Message;
import com.fashionshop.entities.User;
import com.fashionshop.helper.ConnectionProvider;
import com.fashionshop.helper.LogData;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập mã hóa UTF-8 cho request và response
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(30 * 60); // 30 phút
		
		Cookie sessionCookie = new Cookie("JSESSIONID", session.getId());
		sessionCookie.setPath("/");  // Đảm bảo cookie có thể được truy cập toàn bộ ứng dụng
		if (request.isSecure()) {
		    sessionCookie.setSecure(true);  // Chỉ gửi cookie qua kết nối HTTPS
		}
		response.addCookie(sessionCookie);
		
		String login = request.getParameter("login");
		
		if (login.trim().equals("user")) {
			try {
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");

				// getting user through entered email and passsword
				UserDao userDao = new UserDao(ConnectionProvider.getConnection());
				User user = userDao.getUserByEmailPassword(userEmail, userPassword);

				// storing current user in session
				
				if (user != null) {
					LogData.saveLog("LoginServlet", request, "User logged in successfully", "");
					session.setAttribute("activeUser", user);
					response.sendRedirect("index.jsp");
				} else {
					LogData.saveLog("LoginServlet", request, "", "Invalid details");
					Message message = new Message("Invalid details! Try again!!", "error", "alert-danger");
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

				if (admin != null) {
					session.setAttribute("activeAdmin", admin);
					response.sendRedirect("admin.jsp");
				} else {
					Message message = new Message("Invalid details! Try again!!", "error", "alert-danger");
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
