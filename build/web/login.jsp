<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ورود</title>
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
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body px-5">

						<div class="container text-center">
							<img src="Images/login.png" style="max-width: 100px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">وارد شوید</h3>
						<%@include file="Components/alert_message.jsp" %>
						
						<!--login-form-->
						<form id="login-form" action="LoginServlet" method="post">
							<input type="hidden" name="login" value="user"> 
							<div class="mb-3">
								<label class="form-label">ایمیل</label> <input
									type="email" name="user_email" placeholder="Email address"
									class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">رمز عبور</label>
								<input type="password" name="user_password"
									placeholder="Enter your password" class="form-control" required>
							</div>
							<div id="login-btn" class="container text-center">
								<button type="submit" class="btn btn-outline-primary me-3">ورود</button>
							</div>
						</form>
						<div class="mt-3 text-center">
							
							<h6>
								حساب کاربری ندارید؟<a href="register.jsp"
									style="text-decoration: none"> ثبت نام</a>
							</h6>
						</div>
					</div>  

				</div>
			</div>
		</div>
	</div>
</body>
</html>