package com.fashionshop.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fashionshop.dao.UserDao;
import com.fashionshop.entities.Message;
import com.fashionshop.helper.ConnectionProvider;
import com.fashionshop.helper.MailMessenger;

public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập mã hóa UTF-8 cho request và response
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String referrer = request.getHeader("referer");
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		HttpSession session = request.getSession();

		if (referrer.contains("forgot_password")) {
			String email = request.getParameter("email").trim();
			List<String> list = userDao.getAllEmail();
			if (list.contains(email)) {
				Random rand = new Random();
				int max = 99999, min = 10000;
				int otp = rand.nextInt(max - min + 1) + min;
				// System.out.println(otp);
				session.setAttribute("otp", otp);
				session.setAttribute("email", email);
				MailMessenger.sendOtp(email, otp);

				Message message = new Message("Chúng tôi vừa gửi mã xác nhận thay đổi mật khẩu về " + email, "success",
						"alert-success");
				session.setAttribute("message", message);
				response.sendRedirect("otp_code.jsp");
			} else {
				Message message = new Message("Không tìm thấy Email! Hãy thử sử dụng Email khác!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("forgot_password.jsp");
				return;
			}
		} else if (referrer.contains("otp_code")) {
			int code = Integer.parseInt(request.getParameter("code"));
			int otp = (int) session.getAttribute("otp");
			if (code == otp) {
				session.removeAttribute("otp");
				response.sendRedirect("change_password.jsp");
			} else {
				Message message = new Message("Mã xác nhận không hợp lệ!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("otp_code.jsp");
				return;
			}
		} else if (referrer.contains("change_password")) {
			String password = request.getParameter("password");
			String email = (String) session.getAttribute("email");
			userDao.updateUserPasswordByEmail(password, email);
			session.removeAttribute("email");

			Message message = new Message("Thay đổi mật khẩu thành công!", "error", "alert-success");
			session.setAttribute("message", message);
			response.sendRedirect("login.jsp");
		}
	}

}
