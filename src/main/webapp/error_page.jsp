<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang không tìm thấy</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>
	
	<div class="container p-5 text-center">
		<img src="Images\no-results.png" class="img-fluid" style="max-width: 400px;">
		<h1>Xin lỗi! Không tìm thấy trang này</h1>
		<a href="index.jsp" class="btn btn-outline-primary btn-lg mt-3">Trang chủ</a>
	</div>
	<!--footer -->
	<%@include file="Components/footer.jsp"%>
</body>
</html>