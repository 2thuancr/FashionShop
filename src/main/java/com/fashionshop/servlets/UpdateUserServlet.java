package com.fashionshop.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.fashionshop.dao.UserDao;
import com.fashionshop.entities.Message;
import com.fashionshop.entities.User;
import com.fashionshop.helper.ConnectionProvider;

// @MultipartConfig
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập mã hóa UTF-8 cho request và response
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String op = request.getParameter("operation");
		HttpSession session = request.getSession();
		User oldUser = (User) session.getAttribute("activeUser");
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());

		if (op.trim().equals("changeAddress")) {
			try {
				String userAddress = request.getParameter("user_address");
				String userCity = request.getParameter("city");
				String userPincode = request.getParameter("pincode");
				String userState = request.getParameter("state");

				User user = new User();
				user.setUserId(oldUser.getUserId());
				user.setUserName(oldUser.getUserName());
				user.setUserEmail(oldUser.getUserEmail());
				user.setUserPassword(oldUser.getUserPassword());
				user.setUserPhone(oldUser.getUserPhone());
				user.setUserGender(oldUser.getUserGender());
				user.setDateTime(oldUser.getDateTime());
				user.setUserAddress(userAddress);
				user.setUserCity(userCity);
				user.setUserPincode(userPincode);
				user.setUserState(userState);

				userDao.updateUserAddresss(user);
				session.setAttribute("activeUser", user);
				response.sendRedirect("checkout.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (op.trim().equals("updateUser")) {

			// // Kiểm tra xem yêu cầu có phải là multipart không
			// if (request.getContentType() != null && request.getContentType().toLowerCase().startsWith("multipart/")) {
			// 	try {
			// 		// Lấy các phần của yêu cầu
			// 		for (Part part : request.getParts()) {
			// 			String name = part.getName();
			// 			if ("operation".equals(name)) {
			// 				String op1 = request.getParameter(name);
			// 				if (op1 != null) {
			// 					op1 = op1.trim();
			// 					// Tiếp tục xử lý với op
			// 					System.out.println("Operation: " + op1);
			// 				} else {
			// 					System.out.println("Operation parameter is missing or null");
			// 				}
			// 			}
			// 		}
			// 	} catch (Exception e) {
			// 		e.printStackTrace();
			// 	}
			// }

			try {
				// Lấy thông tin input từ form
				String userName = request.getParameter("name");
				String userEmail = request.getParameter("email");
				String userPhone = request.getParameter("mobile_no");
				String userGender = request.getParameter("gender");
				String userAddress = request.getParameter("address");
				String userCity = request.getParameter("city");
				String userPincode = request.getParameter("pincode");
				String userState = request.getParameter("state");

				String profileImage = "profile.png";
				
				// Part part = request.getPart("profile_img");
				// String profileImage = part.getSubmittedFileName();
			
				// String path = request.getServletContext().getRealPath("/") 
				// 		+ "Profile_imgs" + File.separator + profileImage;

				// // upload profile image to server
				// try {
				// 	FileOutputStream fos = new FileOutputStream(path);
				// 	InputStream is = part.getInputStream();
				// 	byte[] data = new byte[is.available()];
				// 	is.read(data);
				// 	fos.write(data);
				// 	fos.flush();
				// 	fos.close();

				// } catch (Exception e) {
				// 	e.printStackTrace();
				// }

				User user = new User(userName, userEmail, userPhone, 
									userGender, userAddress, userCity, userPincode,
									userState, profileImage);
				user.setUserId(oldUser.getUserId());
				user.setUserPassword(oldUser.getUserPassword());
				user.setDateTime(oldUser.getDateTime());

				userDao.updateUser(user);
				session.setAttribute("activeUser", user);
				Message message = new Message("Thông tin khách hàng cập nhật thành công!!", "success", "alert-success");
				session.setAttribute("message", message);
				response.sendRedirect("profile.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (op.trim().equals("deleteUser")) {
			int uid = Integer.parseInt(request.getParameter("uid"));
			userDao.deleteUser(uid);
			response.sendRedirect("display_users.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập mã hóa UTF-8 cho request và response
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		doPost(request, response);
	}

}
