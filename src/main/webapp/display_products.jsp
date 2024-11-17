<%@page import="com.fashionshop.entities.Message"%>
<%@page import="com.fashionshop.dao.UserDao"%>
<%@page import="com.fashionshop.entities.Product"%>
<%@page import="com.fashionshop.dao.ProductDao"%>
<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}
UserDao userDao = new UserDao(ConnectionProvider.getConnection());
ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem sản phẩm</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- update product -->
	<div class="container mt-3">
		<%@include file="Components/alert_message.jsp"%>

		<div class="py-3">
			<button type="button"
				class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#add-product">
				<i class="fa-solid fa-plus fa-xs"></i>Thêm sản phẩm
			</button>
		</div>

		<table class="table table-hover">
			<tr class="table-primary text-center" style="font-size: 20px;">
				<th>Hình ảnh</th>
				<th>Tên</th>
				<th class="text-start">Danh mục</th>
				<th>Giá</th>
				<th class="text-start">Số lượng</th>
				<th class="text-start">Giảm giá</th>
				<th>Hành động</th>
			</tr>
			<%
			List<Product> productList = productDao.getAllProducts();
			for (Product prod : productList) {
				String category = catDao.getCategoryName(prod.getCategoryId());
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=prod.getProductImages()%>"
					style="width: 60px; height: 60px; width: auto;"></td>
				<td class="text-start"><%=prod.getProductName()%></td>
				<td><%=category%></td>
				<td><%=prod.getProductPriceAfterDiscount()%> VNĐ</td>
				<td><%=prod.getProductQunatity()%></td>
				<td><%=prod.getProductDiscount()%>%</td>
				<td>
					<a href="update_product.jsp?pid=<%=prod.getProductId()%>" role="button" class="btn btn-secondary">Cập nhật</a>&emsp;
					<a
					href="AddOperationServlet?pid=<%=prod.getProductId()%>&operation=deleteProduct"
					class="btn btn-danger" role="button">Xóa</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

	<!-- add product modal-->
	<div class="modal fade" id="add-product" tabindex="-1"
		aria-labelledby="addProductModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="addProductModalLabel">Thêm sản phẩm</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="AddOperationServlet" method="post"
					name="addProductForm" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" name="operation" value="addProduct">
						<div>
							<label class="form-label"><b>Tên sản phẩm</b></label> 
							<input
								type="text" name="name" placeholder="Tên sản phẩm"
								class="form-control" required>
						</div>
						<div class="mb-2">
							<label class="form-label"><b>Mô tả sản phẩm</b></label>
							<textarea class="form-control" name="description" rows="4"
								placeholder="Mô tả sản phẩm"></textarea>
						</div>
						<div class="row">
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>Giá sản phẩm</b></label> 
								<input
									type="number" name="price" placeholder="Nhập giá"
									class="form-control" required>
							</div>
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>Phần trăm khuyến mãi</b></label> 
								<input
									type="number" name="discount" onblur="validate()"
									placeholder="Nhập nếu có khuyến mãi!" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>Số lượng sản phẩm</b></label> 
								<input
									type="number" name="quantity"
									placeholder="Nhập số lượng sản phẩm" class="form-control">
							</div>
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>Chọn loại danh mục</b></label> 
								<select
									name="categoryType" class="form-control">
									<option value="0"></option>
									<%
									for (Category c : categoryList) {
									%>
									<option value="<%=c.getCategoryId()%>">
										<%=c.getCategoryName()%></option>
									<%
									}
									%>
								</select>
							</div>
						</div>
						<div class="mb-2">
							<label class="form-label"><b>Hình ảnh sản phẩm</b></label> 
							<input
								type="file" name="photo" class="form-control" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary me-3">Thêm sản phẩm</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end of modal -->

	<!--footer -->
	<%@include file="Components/footer.jsp"%>
</body>
</html>

