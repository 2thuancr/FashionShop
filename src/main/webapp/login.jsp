<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="Components/common_css_js.jsp"%>
<style>
label{
	font-weight: bold;
}
</style>
</head>
<body >  

	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row my-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body px-5">

						<div class="container text-center">
							<img src="Images/login.png" style="max-width: 100px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">Đăng nhập</h3>
						<%@include file="Components/alert_message.jsp" %>
						
						<!--login-form-->
						<form id="login-form" action="LoginServlet" method="post">
							<input type="hidden" name="login" value="user"> 
							<div class="mb-3">
								<label class="form-label">Email</label> 
								<input
									type="email" name="user_email" placeholder="Email"
									class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mật khẩu</label>
								<input type="password" name="user_password"
									placeholder="Mật khẩu" class="form-control" required>
							</div>
							<div id="login-btn" class="container text-center">
								<button type="submit" class="btn btn-outline-primary me-3">Đăng nhập</button>
							</div>
						</form>
						<div class="mt-3 text-center">
							<h6><a href="forgot_password.jsp" style="text-decoration: none">Quên mật khẩu?</a></h6>
							<h6>
								Bạn chưa có tài khoản?
								<a href="register.jsp"
									style="text-decoration: none"> Đăng ký</a>
							</h6>
						</div>

						<hr/>
						<div class="mt-3 text-center">
							<div>
								Bạn là Quản lý? Đăng nhập <a href="adminlogin.jsp" style="text-decoration: none"> tại đây</a>.
							</div>
						</div>
					</div>  

				</div>
			</div>
		</div>
	</div>
	<!--footer -->
	<%@include file="Components/footer.jsp"%>
</body>
</html>