<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
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
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header px-5">
						<div class="container text-center">
							<img src="Images/admin.png" style="max-width: 100px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">ورود</h3>
						<%@include file="Components/alert_message.jsp"%>
					</div>
					<div class="card-body px-5">
						<!--login-form-->
						<form id="login-form" action="LoginServlet" method="post">
							<input type="hidden" name="login" value="admin"> 
							
							<div class="mb-3">
								<label class="form-label">ایمیل</label> <input type="email"
									name="email" placeholder="Email address" class="form-control"
									required>
							</div>
							<div class="mb-2">
								<label class="form-label">رمز عبور</label> <input
									type="password" name="password"
									placeholder="Enter your password" class="form-control" required>
							</div>

							<div id="login-btn" class="container text-center mt-5">
								<button type="submit" class="btn btn-outline-primary me-3">ورود</button>
							</div>
						</form>
					</div>  
				</div>
			</div>
		</div>
	</div>

</body>
</html>