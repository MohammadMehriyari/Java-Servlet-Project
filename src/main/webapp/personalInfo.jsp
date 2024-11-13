<%@page import="com.DigiShop.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DigiShop.entities.User"%>
<%
User user1 = (User) session.getAttribute("activeUser");
if (user1 == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
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
	<h3>اطلاعات شخصی</h3>
	<form id="update-user" action="UpdateUserServlet" method="post">
		<input type="hidden" name="operation" value="updateUser">
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">نام </label> <input type="text"
					name="name" class="form-control" placeholder="First and last name"
					value="<%=user1.getUserName()%>">
			</div>
			<div class="col-md-6 mt-2">
				<label class="form-label">ایمیل</label> <input type="email"
					name="email" placeholder="Email address" class="form-control"
					value="<%=user1.getUserEmail()%>">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">تلفن همراه</label> <input type="number"
					name="mobile_no" placeholder="Mobile number" class="form-control"
					value="<%=user1.getUserPhone()%>">
			</div>
			<div class="col-md-6 mt-5">
				<label class="form-label pe-3">جنسیت</label>
				<%
				String gender = user1.getUserGender();
				if (gender.trim().equals("Male")) {
				%>
				<input class="form-check-input" type="radio" name="gender"
					value="Male" checked> <span
					class="form-check-label pe-3 ps-1"> مرد </span> <input
					class="form-check-input" type="radio" name="gender" value="Female">
				<span class="form-check-label ps-1"> زن </span>

				<%
				} else {
				%>
				<input class="form-check-input" type="radio" name="gender"
					value="Male"> <span class="form-check-label pe-3 ps-1">
					مرد </span> <input class="form-check-input" type="radio" name="gender"
					value="Female" checked> <span class="form-check-label ps-1">
					زن </span>
				<%
				}
				%>

			</div>
		</div>
		<div class="mt-2">
			<label class="form-label">آدرس</label> <input type="text"
				name="address" placeholder="Enter Address(Area and Street))"
				class="form-control" value="<%=user1.getUserAddress()%>">
		</div>
		<div class="row">
			<div class="col-md-6 mt-2">
				<label class="form-label">شهر</label> <input class="form-control"
					type="text" name="city" placeholder="City/District/Town"
					value="<%=user1.getUserCity()%>">
			</div>
			<div class="col-md-6 mt-2">
				<label class="form-label">کد پستی</label> <input
					class="form-control" type="number" name="pincode"
					placeholder="Pincode" maxlength="6"
					value="<%=user1.getUserPincode()%>">
			</div>
		</div>
		<div class="row mt-2">
			<label class="form-label">استان</label>
			<div class="input-group mb-3">
				<input class="form-control" type="text"
					value="<%=user1.getUserState()%>">
					 <select name="state"
					id="state-list" class="form-select">
					<option selected>--Select State--</option>
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
		</div>
		<div id="submit-btn" class="container text-center mt-3">
			<button type="submit" class="btn btn-outline-primary me-3">آپدیت</button>
			<button type="reset" class="btn btn-outline-primary">ریست</button>
		</div>
	</form>
</div>

















