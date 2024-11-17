<%@page import="com.fashionshop.entities.Message"%>
<%@page import="com.fashionshop.dao.ProductDao"%>
<%@page import="com.fashionshop.dao.CartDao"%>
<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
User activeUser = (User) session.getAttribute("activeUser");
if (activeUser == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
String from = (String)session.getAttribute("from");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh toán</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<div class="container mt-5" style="font-size: 17px;">
		<div class="row">

			<!-- left column -->
			<div class="col-md-8">
				<div class="card">
					<div class="container px-3 py-3">
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #389aeb;">
								<h4>Địa chỉ giao hàng</h4>
							</div>
						</div>
						<div class="mt-3 mb-3">
							<h5><%=user.getUserName()%>
								&nbsp;
								<%=user.getUserPhone()%></h5>
							<%
							StringBuilder str = new StringBuilder();
							str.append(user.getUserAddress() + ", ");
							str.append(user.getUserCity() + ", ");
							str.append(user.getUserCity() + ", ");
							str.append(user.getUserPincode());
							out.println(str);
							%>
							<br>
							<div class="text-end">
								<button type="button" class="btn btn-outline-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									Thay đổi địa chỉ</button>
							</div>
						</div>
						<hr>
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #389aeb;">
								<h4>Phương thức thanh toán</h4>
							</div>
						</div>
						<form action="OrderOperationServlet" method="post">
							<div class="form-check mt-2">
								<input class="form-check-input" type="radio" name="payementMode"
									value="Card" required><label class="form-check-label">Credit
									/Debit /ATM card</label><br>
								<div class="mb-3">

									<input class="form-control mt-3" type="number"
										placeholder="Nhập số thẻ" name="cardno">
									<div class="row gx-5">
										<div class="col mt-3">
											<input class="form-control" type="number"
												placeholder="Nhập số CVV" name="cvv">
										</div>
										<div class="col mt-3">
											<input class="form-control" type="text"
												placeholder="Giá trị đến, vd: '07/25'">
										</div>
									</div>
									<input class="form-control mt-3" type="text"
										placeholder="Nhập tên chủ thẻ" name="name">
								</div>
								<input class="form-check-input" type="radio" name="payementMode"
									value="COD"><label
									class="form-check-label">Thanh toán khi nhận hàng (COD)</label>
							</div>
							<div class="text-end">
								<button type="submit"
									class="btn btn-lg btn-outline-primary mt-3">Đặt hàng</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- end of column -->

			<!-- right column -->
			<div class="col-md-4">
				<div class="card">
					<div class="container px-3 py-3">
						<h4>Chi tiết</h4>
						<hr>
						<%
						if (from.trim().equals("cart")) {
							CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
							int totalProduct = cartDao.getCartCountByUserId(user.getUserId());
							float totalPrice = (float) session.getAttribute("totalPrice");
						%>
						<table class="table table-borderless">
							<tr>
								<td>Tổng sản phẩm</td>
								<td><%=totalProduct%></td>
							</tr>
							<tr>
								<td>Tổng tiền</td>
								<td><%=totalPrice%> VNĐ</td>
							</tr>
							<tr>
								<td>Phí vận chuyển</td>
								<td>40 VNĐ</td>
							</tr>
							<tr>
								<td>Phí đóng gói</td>
								<td>29 VNĐ</td>
							</tr>
							<tr>
								<td><h5>Thành tiền:</h5></td>
								<td><h5>
										
										<%=totalPrice + 69%> VNĐ</h5></td>
							</tr>
						</table>
						<%
						} else {
							ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
							int pid = (int) session.getAttribute("pid");
							float price = productDao.getProductPriceById(pid);
						%>
						<table class="table table-borderless">
							<tr>
								<td>Tổng sản phẩm</td>
								<td>1</td>
							</tr>
							<tr>
								<td>Tổng tiền</td>
								<td><%=price%> VNĐ</td>
							</tr>
							<tr>
								<td>Phí vận chuyển</td>
								<td>40 VNĐ</td>
							</tr>
							<tr>
								<td>Phí đóng gói</td>
								<td>29 VNĐ</td>
							</tr>
							<tr>
								<td><h5>Thành tiền:</h5></td>
								<td><h5>
										
										<%=price + 69%> VNĐ</h5></td>
							</tr>
						</table>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<!-- end of column -->
		</div>
	</div>


	<!--Change Address Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Thay đổi địa chỉ</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="UpdateUserServlet" method="post">
					<input type="hidden" name="operation" value="changeAddress">
					<div class="modal-body mx-3">
						<div class="mt-2">
							<label class="form-label fw-bold">Địa chỉ</label>
							<textarea name="user_address" rows="3"
								placeholder="Địa chỉ"
								class="form-control" required></textarea>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">Quận/Huyện</label> <input
								class="form-control" type="text" name="city"
								placeholder="Quận/Huyện" required>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">Mã pin</label> <input
								class="form-control" type="number" name="pincode"
								placeholder="Mã pin" maxlength="6" required>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">Tỉnh/Thành phố</label> <select
								name="state" class="form-select">
								<option selected></option>
								<option value="Thành phố Hồ Chí Minh">Thành phố Hồ Chí Minh</option>
								<option value="Hà Nội">Hà Nội</option>
								<option value="Bình Phước">Bình Phước</option>
								<option value="An Giang">An Giang</option>
								<option value="Đồng Nai">Đồng Nai</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary">Lưu</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end modal -->
	<!--footer -->
	<%@include file="Components/footer.jsp"%>
</body>
</html>