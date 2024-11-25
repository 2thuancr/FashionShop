package com.fashionshop.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fashionshop.dao.AdminDao;
import com.fashionshop.entities.Admin;
import com.fashionshop.entities.Message;
import com.fashionshop.helper.ConnectionProvider;

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập mã hóa UTF-8 cho request và response
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String operation = request.getParameter("operation");
		AdminDao adminDao = new AdminDao(ConnectionProvider.getConnection());
		HttpSession session = request.getSession();
		Message message = null;

		if (operation.trim().equals("save")) {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");

			Admin admin = new Admin(name, email, phone, password);
			boolean flag = adminDao.saveAdmin(admin);

			if (flag) {
				message = new Message("Thêm tài khoản Quản lý mới thành công!", "success", "alert-success");
			} else {
				message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
			}

		} else if (operation.trim().equals("delete")) {

			int id = Integer.parseInt(request.getParameter("id"));
			boolean flag = adminDao.deleteAdmin(id);
			if (flag) {
				message = new Message("Đã xóa tài khoản Quản lý thành công!", "success", "alert-success");
			} else {
				message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
			}
		}
		session.setAttribute("message", message);
		response.sendRedirect("display_admin.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập mã hóa UTF-8 cho request và response
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		doGet(request, response);
	}

}
