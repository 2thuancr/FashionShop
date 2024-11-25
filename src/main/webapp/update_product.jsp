<%@page import="com.fashionshop.entities.Message"%>
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật sản phẩm</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- update product -->
	<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
	Product product = productDao.getProductsByProductId(pid);
	%>
	<div class="container my-3">
		<%@include file="Components/alert_message.jsp"%>

		<div class="row ">
			<div class="col">
				<div class="card">
					<div class="card-header text-center">
						<h3>Chỉnh sửa sản phẩm</h3>
					</div>
					<form action="AddOperationServlet?pid=<%=pid%>" method="post"
						name="updateProductForm" enctype="multipart/form-data">
						<div class="card-body">
							<input type="hidden" name="operation" value="updateProduct">
							<div class="row">
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Tên sản phẩm</b></label> 
									<input required
										type="text" name="name" value="<%=product.getProductName()%>"
										class="form-control">
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Giá</b></label> 
									<input min="0"
										class="form-control" type="number" name="price"
										value="<%=product.getProductPrice()%>" required>
								</div>
							</div>
							<div class="mb-2">
								<label class="form-label"><b>Mô tả</b></label>
								<textarea class="form-control" name="description" rows="3">
									<%=product.getProductDescription()%>
								</textarea>
							</div>
							<div class="row">
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Số lượng</b></label> 
									<input required min="0"
										type="number" name="quantity"
										value="<%=product.getProductQunatity()%>" class="form-control">
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Phần trăm giảm giá</b></label> 
									<input min="0"
										type="number" name="discount" onblur="validate()"
										value="<%=product.getProductDiscount()%>" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Hình ảnh</b></label>
									<input
										class="form-control" type="file" name="product_img">
								</div>
								<div class="col-md-6 mb-2">
									<label class="form-label"><b>Chọn danh mục</b></label> 
									<select
										name="categoryType" class="form-control">
										<option value="0"></option>
										<%
										for (Category c : categoryList) {
										%>
										<option value="<%=c.getCategoryId()%>">
											<%=c.getCategoryName()%>
										</option>
										<%
										}
										%>
									</select> 
									<input type="hidden" name="category" value="<%=product.getCategoryId()%>">
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label"><b>Tải ảnh lên:&nbsp;</b></label>
								<%=product.getProductImages()%>
								&emsp;
								<img src="Product_imgs\<%=product.getProductImages()%>"
									style="width: 80px; height: 80px; width: auto;"> 
								<input
									type="hidden" name="image"
									value="<%=product.getProductImages()%>">
							</div>
						</div>
						<div class="card-footer text-center">
							<button type="submit" class="btn btn-lg btn-primary me-3">Cập nhật</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- end -->

	<!--footer -->
	<%@include file="Components/footer.jsp"%>
	
	<script type="text/javascript">
		function validate() {
			var dis = document.updateProductForm.discount.value;
			if (dis > 100 || dis < 0) {
				alert("Phần trăm giảm giá phải trong khoảng 0-100 !");
				return false;
			}
		}
	</script>
</body>
</html>