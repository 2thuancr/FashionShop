package com.fashionshop.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fashionshop.dao.UserDao;
import com.fashionshop.entities.Message;
import com.fashionshop.entities.User;
import com.fashionshop.helper.ConnectionProvider;
import com.fashionshop.helper.MailMessenger;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập mã hóa UTF-8 cho request và response
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		Message message;

		try {
			String userName = request.getParameter("user_name");
			if (userName.isEmpty()) {
				System.out.println("[Register] Tên không được để trống!!");
				message = new Message("Tên không được để trống!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("register.jsp");
				return;
			}
			String userEmail = request.getParameter("user_email");
			if (userEmail.isEmpty()) {
				System.out.println("[Register] Email không được để trống!!");
				message = new Message("Email không được để trống!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("register.jsp");
				return;
			}

			String userPassword = request.getParameter("user_password");
			if (userPassword.isEmpty()) {
				System.out.println("[Register] Mật khẩu không được để trống!!");
				message = new Message("Mật khẩu không được để trống!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("register.jsp");
				return;
			}

			String userPhone = request.getParameter("user_mobile_no");
			if (userPhone.isEmpty()) {
				System.out.println("[Register] Số điện thoại không được để trống!!");
				message = new Message("Số điện thoại không được để trống!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("register.jsp");
				return;
			}

			String userGender = request.getParameter("gender");
			String userAddress = request.getParameter("user_address");
			String userCity = request.getParameter("city");
			String userPincode = request.getParameter("pincode");
			String userState = request.getParameter("state");

			String userAvatarUrl = "profile.png";
			User user = new User(userName, userEmail, userPassword, userPhone, userGender, userAddress, userCity, userPincode, userState, userAvatarUrl);
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			String errorMessage = userDao.saveUser(user);
			if (errorMessage != null) {
				if (errorMessage.contains("users_email_key")) {
					System.out.println("[Register] Email đã tồn tại!!");
					message = new Message("Email đã tồn tại!!", "error", "alert-danger");
					session.setAttribute("message", message);
					response.sendRedirect("register.jsp");
					return;
				}
				else if (errorMessage.contains("users_phone_key")) {
					System.out.println("[Register] Số điện thoại đã tồn tại!!");
					message = new Message("Số điện thoại đã tồn tại!!", "error", "alert-danger");
					session.setAttribute("message", message);
					response.sendRedirect("register.jsp");
					return;
				}
				else {
					System.out.println("[Register] Có lỗi phát sinh! Vui lòng thử lại!!");
					message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
					session.setAttribute("message", message);
					response.sendRedirect("register.jsp");
					return;
				}
			}
			else {
				System.out.println("[Register] Đăng ký thành công !!");
				message = new Message("Đăng ký thành công !!", "success", "alert-success");
				MailMessenger.successfullyRegister(userName, userEmail);
				session.setAttribute("message", message);
				response.sendRedirect("login.jsp");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
