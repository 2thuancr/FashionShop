<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<%@include file="Components/common_css_js.jsp"%>
<style>
label {
	font-weight: bold;
}
</style>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid my-4">
		<div class="row g-0">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-5">

						<div class="container text-center">
							<img src="Images/signUp.png" style="max-width: 80px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">Đăng ký tài khoản</h3>
						<%@include file="Components/alert_message.jsp"%>

						<!--registration-form-->
						<form id="register-form" action="RegisterServlet" method="post">
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Họ và Tên</label> 
									<input type="text"
										name="user_name" class="form-control"
										placeholder="Họ và Tên" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Email</label> 
									<input type="email"
										name="user_email" placeholder="Email"
										class="form-control" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Số điện thoại</label> 
									<input required
										type="number" name="user_mobile_no"
										placeholder="Số điện thoại" class="form-control">
								</div>
								<div class="col-md-6 mt-5">
									<label class="form-label pe-3">Giới tính</label> 
									<input checked
										class="form-check-input" type="radio" name="gender"
										value="Male"> 
									<span class="form-check-label pe-3 ps-1">
										Nam </span> 
									<input class="form-check-input" type="radio"
										name="gender" value="Female"> 
									<span
										class="form-check-label ps-1"> Nữ </span>
								</div>
							</div>
							<div class="mt-2">
								<label class="form-label">Địa chỉ</label> 
								<input type="text"
									name="user_address"
									placeholder="Địa chỉ"
									class="form-control" required>
							</div>  
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Quận/Huyện</label> 
									<input
										class="form-control" type="text" name="city"
										placeholder="Quận/Huyện" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Mã Pin</label> 
									<input
										class="form-control" type="number" name="pincode"
										placeholder="Mã Pin" maxlength="6">
								</div>  
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">Tỉnh/ Thành phố</label> <select name="state"
										class="form-select">
										<option selected></option>
										<option value="Thành phố Hồ Chí Minh">Thành phố Hồ Chí Minh</option>
										<option value="Hà Nội">Hà Nội</option>
										<option value="Bình Phước">Bình Phước</option>
										<option value="An Giang">An Giang</option>
										<option value="Đồng Nai">Đồng Nai</option>
									</select>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">Mật khẩu</label> 
									<input
										type="password" name="user_password"
										placeholder="Mật khẩu" class="form-control" required>
								</div>
							</div>

							<div id="submit-btn" class="container text-center mt-4">
								<button type="submit" class="btn btn-outline-primary me-3">Đăng ký</button>
								<button type="reset" class="btn btn-outline-primary">Xóa</button>
							</div>
							<div class="mt-3 text-center">
								<h6>
									Bạn đã có tài khoản?
									<a href="login.jsp" style="text-decoration: none"> Đăng nhập</a>
								</h6>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--footer -->
	<%@include file="Components/footer.jsp"%>

</body>
</html>