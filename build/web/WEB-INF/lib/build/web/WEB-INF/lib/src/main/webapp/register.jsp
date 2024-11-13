<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ثبت نام</title>
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

	<div class="container-fluid mt-4">
		<div class="row g-0">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body px-5">

						<div class="container text-center">
							<img src="Images/signUp.png" style="max-width: 80px;"
								class="img-fluid">
						</div>
						<h3 class="text-center">ایجاد حساب</h3>
						<%@include file="Components/alert_message.jsp"%>

						<!--registration-form-->
						<form id="register-form" action="RegisterServlet" method="post">
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">نام</label> <input type="text"
										name="user_name" class="form-control"
										placeholder="First and last name" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">ایمیل</label> <input type="email"
										name="user_email" placeholder="Email address"
										class="form-control" required>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">شماره تلفن</label> <input
										type="number" name="user_mobile_no"
										placeholder="Mobile number" class="form-control">
								</div>
								<div class="col-md-6 mt-5">
									<label class="form-label pe-3">جنسیت</label> <input
										class="form-check-input" type="radio" name="gender"
										value="Male"> <span class="form-check-label pe-3 ps-1">
										مرد </span> <input class="form-check-input" type="radio"
										name="gender" value="Female"> <span
										class="form-check-label ps-1"> زن </span>
								</div>
							</div>
							<div class="mt-2">
								<label class="form-label">آدرس</label> <input type="text"
									name="user_address"
									placeholder="Enter Address(Area and Street))"
									class="form-control" required>
							</div>  
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">شهر</label> <input
										class="form-control" type="text" name="city"
										placeholder="City/District/Town" required>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">کد پستی</label> <input
										class="form-control" type="number" name="pincode"
										placeholder="Pincode" maxlength="6" required>
								</div>  
							</div>
							<div class="row">
								<div class="col-md-6 mt-2">
									<label class="form-label">استان</label> <select name="state"
										class="form-select">
										<option selected>--انتخاب کنید--</option>
										<option value="Azar Sharg">آذربایجان شرقی</option>
                                                                                                                                                                                                <option value="Azar Gharb">آذربایجان غربی </option>
                                                                                                                                                                                                <option value="Ardabil">اردبیل</option>
                                                                                                                                                                                                <option value="Isfahan">اصفهان</option>
                                                                                                                                                                                                <option value="Alborz">البرز</option>
                                                                                                                                                                                                <option value="Ilam">ایلام</option>
                                                                                                                                                                                                <option value="Boushehr">بوشهر</option>
                                                                                                                                                                                                <option value="Tehran">تهران</option>
                                                                                                                                                                                                <option value="Bakhtiar">بختیاری</option>
                                                                                                                                                                                                <option value="Khorasan Jonobi">خراسان جنوبی</option>
                                                                                                                                                                                                <option value="Khorasan Razavi">خراسان رضوی</option>
                                                                                                                                                                                                <option value="Khorasan Shomali">خراسان شمالی</option>
                                                                                                                                                                                                <option value="Khozestan">خوزستان</option>
                                                                                                                                                                                                <option value="Zanjan">زنجان</option>
                                                                                                                                                                                                <option value="Semnan">سمنان</option>
                                                                                                                                                                                                <option value="Balochestan">بلوچستان</option>
                                                                                                                                                                                                <option value="Fars">فارس</option>
                                                                                                                                                                                                <option value="Gazvin">قزوین</option>
                                                                                                                                                                                                <option value="Gom">قم</option>
                                                                                                                                                                                                <option value="Kordestan">کردستان</option>
                                                                                                                                                                                                <option value="Kerman">کرمان</option>
                                                                                                                                                                                                <option value="Kermanshah">کرمانشاه</option>
                                                                                                                                                                                                <option value="Golestan">گلستان</option>
                                                                                                                                                                                                <option value="Gilan">گیلان</option>
                                                                                                                                                                                                <option value="Lorestan">لرستان</option>
                                                                                                                                                                                                <option value="Mazandaran">مازندران</option>
                                                                                                                                                                                                <option value="Markazi">مرکزی</option>
                                                                                                                                                                                                <option value="Hormozgan">هرمزگان</option>
                                                                                                                                                                                                <option value="Hamedan">همدان</option>
                                                                                                                                                                                                <option value="Yazd">یزد</option>

									</select>
								</div>
								<div class="col-md-6 mt-2">
									<label class="form-label">رمز عبور</label> <input
										type="password" name="user_password"
										placeholder="Enter Password" class="form-control" required>
								</div>
							</div>

							<div id="submit-btn" class="container text-center mt-4">
								<button type="submit" class="btn btn-outline-primary me-3">تایید</button>
								<button type="reset" class="btn btn-outline-primary">بازنشانی</button>
							</div>
							<div class="mt-3 text-center">
								<h6>
									از قبل حساب کاربری دارید؟<a href="login.jsp"
										style="text-decoration: none"> ورود</a>
								</h6>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>