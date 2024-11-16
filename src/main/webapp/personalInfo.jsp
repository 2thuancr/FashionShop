<%@page import="com.fashionshop.entities.Message"%>
<%@page import="com.fashionshop.entities.User"%>
<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
User user1 = (User) session.getAttribute("activeUser");
if (user1 == null) {
	Message message = new Message("Bạn chưa đăng nhập, đăng nhập trước!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;
}
%>

<style>
label {
	font-weight: bold;
}
</style>
<div class="container px-3 py-3">
	<h3>Thông tin cá nhân</h3>
	<form id="update-user" action="UpdateUserServlet" method="post">
		<input type="hidden" name="operation" value="updateUser">
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">Tên</label> 
				<input type="text"
					name="name" class="form-control" placeholder="Họ và Tên"
					value="<%=user1.getUserName()%>">
			</div>
			<div class="col-md-6 mt-2">
				<label class="form-label">Email</label> 
				<input type="email"
					name="email" placeholder="Email" class="form-control"
					value="<%=user1.getUserEmail()%>">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">Số điện thoại</label> 
				<input type="number"
					name="mobile_no" placeholder="Số điện thoại" class="form-control"
					value="<%=user1.getUserPhone()%>">
			</div>
			<div class="col-md-6 mt-5">
				<label class="form-label pe-3">Giới tính</label>
				<%
				String gender = user1.getUserGender();
				if (gender.trim().equals("Male")) {
				%>
				<input class="form-check-input" type="radio" name="gender"
					value="Male" checked> 
				<span class="form-check-label pe-3 ps-1"> Nam </span> 
				<input class="form-check-input" type="radio" name="gender" value="Female">
				<span class="form-check-label ps-1"> Nữ </span>

				<%
				} else {
				%>
				<input class="form-check-input" type="radio" name="gender"
					value="Male"> 
				<span class="form-check-label pe-3 ps-1">Nam </span> 
				<input class="form-check-input" type="radio" name="gender" value="Female" checked> 
				<span class="form-check-label ps-1">Nữ </span>
				<%
				}
				%>

			</div>
		</div>
		<div class="mt-2">
			<label class="form-label">Địa chỉ</label> 
			<input type="text"
				name="address" placeholder="Địa chỉ"
				class="form-control" value="<%=user1.getUserAddress()%>">
		</div>
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">Quận/Huyện</label> <input class="form-control"
					type="text" name="city" placeholder="Quận/Huyện"
					value="<%=user1.getUserCity()%>">
			</div>
			<div class="col-md-6 mt-2">
				<label class="form-label">Mã pin</label> <input
					class="form-control" type="number" name="pincode"
					placeholder="Mã pin" maxlength="6"
					value="<%=user1.getUserPincode()%>">
			</div>
		</div>
		<div class="row mt-2">
			<label class="form-label">Tỉnh/Thành phố</label>
			<div class="input-group mb-3">
				<input class="form-control" type="text"
					value="<%=user1.getUserState()%>">
					 <select name="state"
					id="state-list" class="form-select">
						<option selected></option>
						<option value="Thành phố Hồ Chí Minh">Thành phố Hồ Chí Minh</option>
						<option value="Hà Nội">Hà Nội</option>
						<option value="Bình Phước">Bình Phước</option>
						<option value="An Giang">An Giang</option>
						<option value="Đồng Nai">Đồng Nai</option>
				</select>
			</div>
		</div>
		<div id="submit-btn" class="container text-center mt-3">
			<button type="submit" class="btn btn-outline-primary me-3">Cập nhật</button>
			<button type="reset" class="btn btn-outline-primary">Xóa</button>
		</div>
	</form>
</div>

















