<%@page import="com.fashionshop.entities.Message"%>
<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("Bạn chưa đăng nhập, vui lòng đăng nhập!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem danh mục</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- Category -->
	<div class="container mt-3">
	<%@include file="Components/alert_message.jsp"%>
		<div class="text-right py-3">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-category">
				<i class="fa-solid fa-plus fa-xs"></i>Thêm danh mục
			</button>
		</div>
		<table class="table table-hover">
			<tr class="table-primary text-center" style="font-size: 20px;">
				<th>Hình ảnh</th>
				<th>Tên danh mục</th>
				<th>Hành động</th>
			</tr>
			<%
			for (Category c : categoryList) {
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=c.getCategoryImage()%>"
					style="width: 60px; height: 60px; width: auto;"></td>
				<td><%=c.getCategoryName()%></td>
				<td>
					<a href="update_category.jsp?cid=<%=c.getCategoryId()%>" role="button" class="btn btn-secondary">Cập nhật</a>&emsp;
					<a
					href="AddOperationServlet?cid=<%=c.getCategoryId()%>&operation=deleteCategory"
					class="btn btn-danger" role="button">Xóa</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

	<!-- add category modal-->
	<div class="modal fade" id="add-category" tabindex="-1"
		aria-labelledby="addCategoryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="addCategoryModalLabel">Thêm danh mục</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="AddOperationServlet" method="post"
					enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" name="operation" value="addCategory">

						<div class="mb-3">
							<label class="form-label"><b>Tên danh mục</b></label> 
							<input
								type="text" name="category_name"
								placeholder="Tên danh mục" class="form-control" required>
						</div>
						<div class="mb-3">
							<label for="formFile" class="form-label"><b>Hinh ảnh</b></label> 
							<input class="form-control" type="file"
								name="category_img" id="formFile">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary me-3">Thêm danh mục</button>
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
