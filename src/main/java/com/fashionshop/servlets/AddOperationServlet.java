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

import com.fashionshop.dao.CategoryDao;
import com.fashionshop.dao.ProductDao;
import com.fashionshop.entities.Category;
import com.fashionshop.entities.Message;
import com.fashionshop.entities.Product;
import com.fashionshop.helper.ConnectionProvider;

@MultipartConfig
public class AddOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Thiết lập mã hóa UTF-8 cho request và response
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String operation = request.getParameter("operation");
		CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
		ProductDao pdao = new ProductDao(ConnectionProvider.getConnection());
		HttpSession session = request.getSession();
		Message message = null;

		if (operation.trim().equals("addCategory")) {

			String categoryName = request.getParameter("category_name");
			Part part = request.getPart("category_img");
			Category category = new Category(categoryName, part.getSubmittedFileName());
			boolean flag = catDao.saveCategory(category);

			String path = request.getServletContext().getRealPath("/") 
				+ "Product_imgs" + File.separator + part.getSubmittedFileName();

			try {
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.flush();
				fos.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			if (flag) {
				message = new Message("Tạo danh mục thành công!!", "success", "alert-success");
			} else {
				message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
			}

			System.out.println("[AddOperationServlet][addCategory] message: " + message);
			session.setAttribute("message", message);
			response.sendRedirect("display_category.jsp");

		} else if (operation.trim().equals("addProduct")) {

			// add product to database
			String pName = request.getParameter("name");
			if (pName.isEmpty()) {
				System.out.println("[AddOperationServlet][addProduct] Tên sản phẩm không được để trống!!");
				message = new Message("Tên sản phẩm không được để trống!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("display_products.jsp");
				return;
			}

			String pDesc = request.getParameter("description");

			int pPrice = Integer.parseInt(request.getParameter("price"));
			if (pPrice < 0) {
				System.out.println("[AddOperationServlet][addProduct] Giá sản phẩm không hợp lệ!!");
				message = new Message("Giá sản phẩm không hợp lệ!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("display_products.jsp");
				return;
			}

			int pDiscount = Integer.parseInt(request.getParameter("discount"));
			if (pDiscount < 0 || pDiscount > 100) {
				System.out.println("[AddOperationServlet][addProduct] Giá trị giảm giá không hợp lệ!!");
				message = new Message("Giá trị giảm giá không hợp lệ!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("display_products.jsp");
				return;
			}

			int pQuantity = Integer.parseInt(request.getParameter("quantity"));
			if (pQuantity < 0) {
				System.out.println("[AddOperationServlet][addProduct] Số lượng sản phẩm không hợp lệ!!");
				message = new Message("Số lượng sản phẩm không hợp lệ!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("display_products.jsp");
				return;
			}

			Part part = request.getPart("photo");
			int categoryType = Integer.parseInt(request.getParameter("categoryType"));

			Product product = new Product(pName, pDesc, pPrice, pDiscount, pQuantity, part.getSubmittedFileName(), categoryType);
			boolean flag = pdao.saveProduct(product);

			String path = request.getServletContext().getRealPath("/") 
				+ "Product_imgs" + File.separator + part.getSubmittedFileName();

			try {
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.flush();
				fos.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			if (flag) {
				message = new Message("Thêm sản phẩm thành công!!", "success", "alert-success");
			} else {
				message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
			}
			System.out.println("[AddOperationServlet][addProduct] message: " + message);
			session.setAttribute("message", message);
			response.sendRedirect("display_products.jsp");

		} else if (operation.trim().equals("updateCategory")) {

			int cid = Integer.parseInt(request.getParameter("cid"));
			if (cid <= 0) {
				System.out.println("[AddOperationServlet][updateCategory] Có lỗi phát sinh! Vui lòng thử lại!!");
				message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("update_category.jsp");
				return;
			}

			String name = request.getParameter("category_name");
			if (name.isEmpty()) {
				System.out.println("[AddOperationServlet][updateCategory] Tên danh mục không được để trống!");
				message = new Message("Tên danh mục không được để trống!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("update_category.jsp");
				return;
			}

			Part part = request.getPart("category_img");
			if (part.getSubmittedFileName().isEmpty()) {
				String image = request.getParameter("image");
				Category category = new Category(cid, name, image);
				catDao.updateCategory(category);
			} else {
				Category category = new Category(cid, name, part.getSubmittedFileName());
				catDao.updateCategory(category);
				String path = request.getServletContext().getRealPath("/") 
					+ "Product_imgs" + File.separator + part.getSubmittedFileName();
				try {
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = part.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.flush();
					fos.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			System.out.println("[AddOperationServlet][updateCategory] Cập nhật danh mục thành công!!");
			message = new Message("Cập nhật danh mục thành công!!", "success", "alert-success");
			session.setAttribute("message", message);
			response.sendRedirect("display_category.jsp");

		} else if (operation.trim().equals("deleteCategory")) {

			int cid = Integer.parseInt(request.getParameter("cid"));
			if (cid <= 0) {
				System.out.println("[AddOperationServlet][deleteCategory] Có lỗi phát sinh! Vui lòng thử lại!!");
				message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("display_category.jsp");
				return;
			}
			catDao.deleteCategory(cid);
			response.sendRedirect("display_category.jsp");

		} else if (operation.trim().equals("updateProduct")) {

			int pid = Integer.parseInt(request.getParameter("pid"));
			if (pid <= 0) {
				System.out.println("[AddOperationServlet][updateProduct] Có lỗi phát sinh! Vui lòng thử lại!!");
				message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("update_product.jsp");
				return;
			}

			String name = request.getParameter("name");
			if (name.isEmpty()) {
				System.out.println("[AddOperationServlet][updateProduct] Tên sản phẩm không được để trống!!");
				message = new Message("Tên sản phẩm không được để trống!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("update_product.jsp");
				return;
			}

			float price = Float.parseFloat(request.getParameter("price"));
			if (price < 0) {
				System.out.println("[AddOperationServlet][updateProduct] Giá sản phẩm không hợp lệ!!");
				message = new Message("Giá sản phẩm không hợp lệ!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("update_product.jsp");
				return;
			}

			String description = request.getParameter("description");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			if (quantity < 0) {
				System.out.println("[AddOperationServlet][updateProduct] Số lượng sản phẩm không hợp lệ!!");
				message = new Message("Số lượng sản phẩm không hợp lệ!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("update_product.jsp");
				return;
			}

			int discount = Integer.parseInt(request.getParameter("discount"));
			if (discount < 0 || discount > 100) {
				System.out.println("[AddOperationServlet][updateProduct] Giá trị giảm giá không hợp lệ!!");
				message = new Message("Giá trị giảm giá không hợp lệ!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("update_product.jsp");
				return;
			}
			
			Part part = request.getPart("product_img");
			int cid = Integer.parseInt(request.getParameter("categoryType"));
			if (cid == 0) {
				cid = Integer.parseInt(request.getParameter("category"));
			}
			if (part.getSubmittedFileName().isEmpty()) {
				String image = request.getParameter("image");
				Product product = new Product(pid, name, description, price, discount, quantity, image, cid);
				pdao.updateProduct(product);
			} else {

				Product product = new Product(pid, name, description, price, discount, quantity, part.getSubmittedFileName(), cid);
				pdao.updateProduct(product);
				// product image upload
				String path = request.getServletContext().getRealPath("/") 
					+ "Product_imgs" + File.separator + part.getSubmittedFileName();
				try {
					FileOutputStream fos = new FileOutputStream(path);
					InputStream is = part.getInputStream();
					byte[] data = new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.flush();
					fos.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			System.out.println("[AddOperationServlet][updateProduct] Cập nhật sản phẩm thành công!!");
			message = new Message("Cập nhật sản phẩm thành công!!", "success", "alert-success");
			session.setAttribute("message", message);
			response.sendRedirect("display_products.jsp");

		} else if (operation.trim().equals("deleteProduct")) {

			int pid = Integer.parseInt(request.getParameter("pid"));
			if (pid <= 0) {
				System.out.println("[AddOperationServlet][deleteProduct] Có lỗi phát sinh! Vui lòng thử lại!!");
				message = new Message("Có lỗi phát sinh! Vui lòng thử lại!!", "error", "alert-danger");
				session.setAttribute("message", message);
				response.sendRedirect("display_products.jsp");
				return;
			}
			pdao.deleteProduct(pid);
			response.sendRedirect("display_products.jsp");

		}
		return;
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
