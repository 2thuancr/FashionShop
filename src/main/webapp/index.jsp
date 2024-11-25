<%@page import="com.fashionshop.dao.ProductDao"%>
<%@page import="com.fashionshop.entities.Product"%>
<%@page import="com.fashionshop.helper.ConnectionProvider"%>
<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
List<Product> productList = productDao.getAllLatestProducts();
List<Product> topDeals = productDao.getDiscountedProducts();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fashion Shop</title>
<%@include file="Components/common_css_js.jsp"%>
<style type="text/css">
.cus-card {
	border-radius: 50%;
	border-color: transparent;
	max-height: 200px;
	max-width: 200px;
	max-height: 200px;
}


</style>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- Category list -->
	<div class="container-fluid px-3 py-3"
		style="background-color: #fff;">
		<div class="row">
			<div class="card-group">
				<%
				for (Category c : categoryList) {
				%>
				<div class="col text-center">
					<a href="products.jsp?category=<%=c.getCategoryId()%>"
						style="text-decoration: none;">
						<div class="card cus-card h-100">
							<div class="container text-center">
								<img src="Product_imgs\<%=c.getCategoryImage()%>" class="mt-3 "
									style="max-width: 100%; max-height: 100px; width: auto; height: auto;">
							</div>
							<h6><%=c.getCategoryName()%></h6>
						</div>
					</a>
				</div>

				<%
				}
				%>
			</div>
		</div>
	</div>
	<!-- end of list -->

	<!-- Carousel -->
	<div id="carouselAutoplaying"
		class="carousel slide carousel-dark mt-3 mb-3" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="Images/scroll_img2.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="Images/scroll_img1.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="Images/scroll_img3.png" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselAutoplaying" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"
				style="color: black;"></span> <span class="visually-hidden">Trước</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselAutoplaying" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span
				class="visually-hidden">Tiếp</span>
		</button>
	</div>
	<!-- end of carousel -->

	<!-- latest product listed -->
	<div class="container-fluid py-3 px-3" style="background: #f2f2f2;">
		<div class="row row-cols-1 row-cols-md-5 g-3">
			<div class="col">
				<div class="container text-center px-5 py-5">
					<h3>Sản phẩm đã xem</h3>
					<img src="Images\wishlist.png" class="card-img-top"
						style="max-width: 100%; max-height: 200px; width: auto;">
				</div>
			</div>
			<%
			for (int i = 0; i < Math.min(4, productList.size()); i++) {
			%>
			<div class="col">
				<a href="viewProduct.jsp?pid=<%=productList.get(i).getProductId()%>"
					style="text-decoration: none;">
					<div class="card h-100">
						<div class="container text-center">
							<img
								src="Product_imgs\<%=productList.get(i).getProductImages()%>"
								class="card-img-top m-2"
								style="max-width: 100%; max-height: 200px; width: auto;">
						</div>
						<div class="card-body">
							<h6 class="card-title text-center"><%=productList.get(i).getProductName()%></h6>

							<div class="container text-center">
								<span class="real-price"><%=productList.get(i).getProductPriceAfterDiscount()%> VNĐ</span>&ensp;
								<span class="product-price text-danger"><%=productList.get(i).getProductPrice()%> VNĐ</span>&ensp;
								<span class="product-discount">-<%=productList.get(i).getProductDiscount()%>%</span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<%
			}
			%>
		</div>
	</div>
	<!-- end of list -->

	<!-- product with heavy deals -->
	<div class="container-fluid py-3 px-3" style="background: #ff9a9a61;">
		<h3>Hot Deals</h3>
		<div class="row row-cols-1 row-cols-md-5 g-3">
			<%
			for (int i = 0; i < Math.min(5, topDeals.size()); i++) {
			%>
			<div class="col">
				<a href="viewProduct.jsp?pid=<%=topDeals.get(i).getProductId()%>"
					style="text-decoration: none;">
					<div class="card h-100">
						<div class="container text-center">
							<img src="Product_imgs\<%=topDeals.get(i).getProductImages()%>"
								class="card-img-top m-2"
								style="max-width: 100%; max-height: 200px; width: auto;">
						</div>
						<div class="card-body">
							<h6 class="card-title text-center"><%=topDeals.get(i).getProductName()%></h6>

							<div class="container text-center">
								<span class="real-price"><%=topDeals.get(i).getProductPriceAfterDiscount()%> VNĐ</span>&ensp;
								<span class="product-price text-danger"><%=topDeals.get(i).getProductPrice()%> VNĐ</span>&ensp;
								<span class="product-discount">-<%=topDeals.get(i).getProductDiscount()%>%</span>
							</div>
						</div>
					</div>
				</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<!-- end -->

	<!--footer -->
	<%@include file="Components/footer.jsp"%>

	<!-- confirmation message for successful order -->
	<%
	String order = (String) session.getAttribute("order");
	if (order != null) {
	%>
	<script type="text/javascript">
		console.log("testing..4...");
		Swal.fire({
		  icon : 'success',
		  title: 'Đã đặt đơn hàng, cảm ơn bạn!',
		  text: 'Xác nhận này sẽ được gửi đến <%=user.getUserEmail()%>',
		  width: 600,
		  padding: '3em',
		  showConfirmButton : false,
		  timer : 3500,
		  backdrop: `
		    rgba(0,0,123,0.4)
		  `
		});
	</script>
	<%
	}
	session.removeAttribute("order");
	%>
	<!-- end of message -->
	
</body>
</html>