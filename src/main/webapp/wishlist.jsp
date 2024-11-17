<%@page import="com.fashionshop.entities.Message"%>
<%@page import="com.fashionshop.entities.Product"%>
<%@page import="com.fashionshop.dao.ProductDao"%>
<%@page import="com.fashionshop.entities.Wishlist"%>
<%@page import="java.util.List"%>
<%@page import="com.fashionshop.entities.User"%>
<%@page import="com.fashionshop.helper.ConnectionProvider"%>
<%@page import="com.fashionshop.dao.WishlistDao"%>
<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
User u1 = (User) session.getAttribute("activeUser");
if (u1 == null) {
	Message message = new Message("Bạn chưa đăng nhập, vui lòng đăng nhập!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
WishlistDao wishListDao = new WishlistDao(ConnectionProvider.getConnection());
List<Wishlist> wlist = wishListDao.getListByUserId(u1.getUserId());
ProductDao pDao = new ProductDao(ConnectionProvider.getConnection());
%>
<div class="container px-3 py-3">
	<%
	if (wlist == null || wlist.size() == 0) {
	%>
	<div class="container mt-5 mb-5 text-center">
		<img src="Images/wishlist.png" style="max-width: 200px;"
			class="img-fluid">
		<h4 class="mt-3">Danh sách đang trống</h4>
		Thêm vào danh sách!
	</div>
	<%
	} else {
	%>
	<h4>
		Danh sách của tôi (<%=wlist.size()%>)
	</h4>
	<hr>
	<div class="container">
		<table class="table table-hover">
			<%
			for (Wishlist w : wlist) {
				Product p = pDao.getProductsByProductId(w.getProductId());
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=p.getProductImages()%>"
					style="width: 50px; height: 50px; width: auto;"></td>
				<td class="text-start"><%=p.getProductName()%></td>
				<td><%=p.getProductPriceAfterDiscount()%> VNĐ</td>
				<td><a
					href="WishlistServlet?uid=<%=u1.getUserId()%>&pid=<%=p.getProductId()%>&op=delete"
					class="btn btn-secondary" role="button">Xóa</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%
	}
	%>
</div>
