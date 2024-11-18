<%@page errorPage="error_exception.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập trang Quản lý</title>
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

	<div class="container-fluid">
		<%@include file="Components/alert_message.jsp"%>

		<div class="row my-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header px-5">
						<div class="container text-center">
							<img src="Images/admin.png" style="max-width: 100px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">Đăng nhập Admin</h3>
					</div>
					<div class="card-body px-5">
						<!--login-form-->
						<form id="login-form" action="LoginServlet" method="post">
							<input type="hidden" name="login" value="admin"> 
							
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									name="email" placeholder="Email" class="form-control"
									required>
							</div>
							<div class="mb-2">
								<label class="form-label">Mật khẩu</label> <input
									type="password" name="password"
									placeholder="Mật khẩu" class="form-control" required>
							</div>

							<div id="login-btn" class="container text-center mt-5">
								<button type="submit" class="btn btn-outline-primary me-3">Đăng nhập</button>
							</div>

							<hr/>
							<div class="mt-3 text-center">
								<div>
									Đăng nhập với tư cách Khách hàng <a href="login.jsp" style="text-decoration: none"> tại đây</a>.
								</div>
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