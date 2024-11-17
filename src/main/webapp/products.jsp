<%@page import="com.fashionshop.dao.WishlistDao"%>
<%@page import="com.fashionshop.entities.User"%>
<%@page import="com.fashionshop.dao.CategoryDao"%>
<%@page import="com.fashionshop.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.fashionshop.helper.ConnectionProvider"%>
<%@page import="com.fashionshop.dao.ProductDao"%>
<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
User u = (User) session.getAttribute("activeUser");
WishlistDao wishlistDao = new WishlistDao(ConnectionProvider.getConnection());

String searchKey = request.getParameter("search");
String catId = request.getParameter("category");
CategoryDao categoryDao = new CategoryDao(ConnectionProvider.getConnection());
String message = "";

ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
List<Product> prodList = null;
if (searchKey != null) {
	if (!searchKey.isEmpty()) {
		message = "Hiển thị kết quả cho \"" + searchKey + "\"";
	}else{
		message = "Không tìm thấy sản phẩm!";
	}
	prodList = productDao.getAllProductsBySearchKey(searchKey);

} else if (catId != null && !(catId.trim().equals("0"))) {
	prodList = productDao.getAllProductsByCategoryId(Integer.parseInt(catId.trim()));
	message = "Hiển thị kết quả cho \"" + categoryDao.getCategoryName(Integer.parseInt(catId.trim())) + "\"";
} else {
	prodList = productDao.getAllProducts();
	message = "Tất cả sản phẩm";
}

if (prodList != null && prodList.size() == 0) {

	message = "Không tìm thấy kết quả cho \""
	+ (searchKey != null ? searchKey : categoryDao.getCategoryName(Integer.parseInt(catId.trim()))) + "\"";

	prodList = productDao.getAllProducts();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<%@include file="Components/common_css_js.jsp"%>
<style>
.discount-badge {
	cursor: pointer;
	position: absolute;
	left: 10px;
	top: 10px;
	width: 50px;
	height: 24px;
	border: 1px solid #f0f0f0;
	box-shadow: 0 1px 4px 0 rgba(255, 0, 0, 0.1);
	background: #ff00004f;
}

.wishlist-icon {
	cursor: pointer;
	position: absolute;
	right: 10px;
	top: 10px;
	width: 36px;
	height: 36px;
	border-radius: 50%;
	border: 1px solid #f0f0f0;
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, .1);
	padding-right: 40px;
	background: #fff;
}
</style>
</head>
<body style="background-color: #f0f0f0;">
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!--show products-->
	<h4 class="text-center mt-2"><%=message%></h4>
	<div class="container-fluid my-3 px-5">

		<div class="row row-cols-1 row-cols-md-5 g-3">
			<%
			for (Product p : prodList) {
			%>
			<div class="col">
				<div class="card h-100 justify-content-between px-2 py-2">
					<div class="container text-center">
						<img src="Product_imgs\<%=p.getProductImages()%>"
							class="card-img-top m-2"
							style="max-width: 100%; max-height: 200px; width: auto;">
						
						<div class="discount-badge">
							<span class="product-discount">-<%=p.getProductDiscount()%>&#37;</span>
						</div>

						<div class="wishlist-icon">
							<%
							if (u != null) {
								if (wishlistDao.getWishlist(u.getUserId(), p.getProductId())) {
							%>
							<button
								onclick="window.open('WishlistServlet?uid=<%=u.getUserId()%>&pid=<%=p.getProductId()%>&op=remove', '_self')"
								class="btn btn-link" type="submit">
								<i class="fa-sharp fa-solid fa-heart" style="color: #ff0303;"></i>
							</button>
							<%
							} else {
							%>
							<button type="submit"
								onclick="window.open('WishlistServlet?uid=<%=u.getUserId()%>&pid=<%=p.getProductId()%>&op=add', '_self')"
								class="btn btn-link">
								<i class="fa-sharp fa-solid fa-heart" style="color: #909191;"></i>
							</button>
							<%
							}
							} else {
							%>
							<button onclick="window.open('login.jsp', '_self')"
								class="btn btn-link" type="submit">
								<i class="fa-sharp fa-solid fa-heart" style="color: #909191;"></i>
							</button>
							<%
							}
							%>

						</div>
						<h6 class="card-title text-center"><%=p.getProductName()%></h6>

						<div class="container text-center">
							<span class="real-price"><%=p.getProductPriceAfterDiscount()%> VNĐ</span>&ensp;
							<span class="product-price text-danger"><%=p.getProductPrice()%> VNĐ</span>&ensp;
						</div>
						
					</div>

					<div class="container text-center mb-2 mt-2">
						<button type="button"
							onclick="window.open('viewProduct.jsp?pid=<%=p.getProductId()%>', '_self')"
							class="btn btn-primary text-white">Xem chi tiết</button>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<!--footer -->
	<%@include file="Components/footer.jsp"%>
</body>
</html>

