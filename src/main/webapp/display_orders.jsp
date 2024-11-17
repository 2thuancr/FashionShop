<%@page import="com.fashionshop.entities.Message"%>
<%@page import="com.fashionshop.dao.UserDao"%>
<%@page import="com.fashionshop.entities.OrderedProduct"%>
<%@page import="com.fashionshop.entities.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.fashionshop.dao.OrderedProductDao"%>
<%@page import="com.fashionshop.dao.OrderDao"%>
<%@page import="com.fashionshop.helper.ConnectionProvider"%>
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
OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
OrderedProductDao ordProdDao = new OrderedProductDao(ConnectionProvider.getConnection());
List<Order> orderList = orderDao.getAllOrder();
UserDao userDao = new UserDao(ConnectionProvider.getConnection());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem đơn hàng</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- order details -->

	<div class="container-fluid px-3 py-3">
		<%
		if (orderList == null || orderList.size() == 0) {
		%>
		<div class="container mt-5 mb-5 text-center">
			<img src="Images/empty-cart.png" style="max-width: 200px;"
				class="img-fluid">
			<h4 class="mt-3">Không tìm thấy đơn hàng</h4>
		</div>
		<%
		} else {
		%>
		<div class="container-fluid">
			<table class="table table-hover">
				<tr class="table-primary" style="font-size: 18px;">
					<th class="text-center">Sản phẩm</th>
					<th>Mã hóa đơn</th>
					<th>Chi tiết sản phẩm</th>
					<th>Địa chỉ giao hàng</th>
					<th>Ngày mua</th>
					<th>Phương thức thanh toán</th>
					<th>Trạng thái</th>
					<th colspan="2" class="text-center">Hành động</th>
				</tr>
				<%
				for (Order order : orderList) {
					List<OrderedProduct> ordProdList = ordProdDao.getAllOrderedProduct(order.getId());
					for (OrderedProduct orderProduct : ordProdList) {
				%>
				<form action="UpdateOrderServlet?oid=<%=order.getId()%>"
					method="post">
				<tr>
					<td class="text-center"><img
						src="Product_imgs\<%=orderProduct.getImage()%>"
						style="width: 50px; height: 50px; width: auto;"></td>
					<td><%=order.getOrderId()%></td>
					<td><%=orderProduct.getName()%>
						<br>Số lượng: <%=orderProduct.getQuantity()%>
						<br>Tổng tiền: <%=orderProduct.getPrice() * orderProduct.getQuantity()%> VNĐ
					</td>
					<td><%=userDao.getUserName(order.getUserId())%>
						<br>Số điện thoại <%=userDao.getUserPhone(order.getUserId())%>
						<br><%=userDao.getUserAddress(order.getUserId())%>
					</td>
					<td><%=order.getDate()%></td>
					<td><%=order.getPayementType()%></td>
					<td><%=order.getStatus()%></td>
					<td><select id="operation" name="status" class="form-select">
							<option></option>
							<option value="Order Confirmed">Đã xác nhận đơn hàng</option>
							<option value="Shipped">Đã giao hàng</option>
							<option value="Out For Delivery">Đang vận chuyển </option>
							<option value="Delivered">Vận chuyển thành công</option>
					</select></td>
					<td>
						<%
						if (order.getStatus().equals("Delivered")) {
						%>
						<button type="submit" class="btn btn-success disabled">Cập nhật</button>
						<%
						} else {
						%>
						<button type="submit" class="btn btn-secondary">Cập nhật</button> 
						<%
						 }
						 %>
					</td>
				</tr>
				</form>
				<%
				}
				}
				%>
			</table>

		</div>
		<%
		}
		%>
	</div>
	<!--footer -->
	<%@include file="Components/footer.jsp"%>
</body>
</html>