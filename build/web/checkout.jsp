<%@page import="com.DigiShop.helper.ConnectionProvider"%>
<%@page import="com.DigiShop.entities.User"%>
<%@page import="com.DigiShop.entities.Message"%>
<%@page import="com.DigiShop.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DigiShop.dao.CartDao"%>
<%@page errorPage="error_exception.jsp"%>
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
<title>بررسی</title>
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
								<h4>آدرس تحویل</h4>
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
							str.append(user.getUserPincode());
							out.println(str);
							%>
							<br>
							<div class="text-end">
								<button type="button" class="btn btn-outline-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									تغییر آدرس</button>
							</div>
						</div>
						<hr>
						<div class="card">
							<div class="container-fluid text-white"
								style="background-color: #389aeb;">
								<h4>نوع پرداخت</h4>
							</div>
						</div>
						<form action="OrderOperationServlet" method="post">
							<div class="form-check mt-2">
								<input class="form-check-input" type="radio" name="payementMode"
									value="Card Payment" required><label class="form-check-label">آنلاین</label><br>
								<div class="mb-3">

									<input class="form-control mt-3" type="number"
										placeholder="شماره کارت" name="cardno">
									<div class="row gx-5">
										<div class="col mt-3">
											<input class="form-control" type="number"
												placeholder="CVV2" name="cvv">
										</div>
										<div class="col mt-3">
											<input class="form-control" type="text"
												placeholder="تاریخ انقضا'">
										</div>
									</div>
									<input class="form-control mt-3" type="text"
										placeholder="نام مالک حساب" name="name">
								</div>
								<input class="form-check-input" type="radio" name="payementMode"
									value="Cash on Delivery"><label
									class="form-check-label">نقدی</label>
							</div>
							<div class="text-end">
								<button type="submit"
									class="btn btn-lg btn-outline-primary mt-3">تایید سفارش</button>
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
						<h4>اطلاعات قیمت</h4>
						<hr>
						<%
						if (from.trim().equals("cart")) {
							CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
							int totalProduct = cartDao.getCartCountByUserId(user.getUserId());
							float totalPrice = (float) session.getAttribute("totalPrice");
						%>
						<table class="table table-borderless">
							<tr>
								<td>تعداد کالا</td>
								<td><%=totalProduct%></td>
							</tr>
							<tr>
								<td>مجموع قیمت کالا ها</td>
								<td> <%=totalPrice%></td>
							</tr>
							<tr>
								<td>هزینه ارسال کالا</td>
								<td> 40</td>
							</tr>
							<tr>
								<td>هزینه بسته بندی کالا</td>
								<td> 29</td>
							</tr>
							<tr>
								<td><h5>هزینه قابل پرداخت :</h5></td>
								<td><h5>
										
										<%=totalPrice + 69%></h5></td>
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
								<td>تعداد کالا ها</td>
								<td>1</td>
							</tr>
							<tr>
								<td>مجموع قیمت کالا ها</td>
								<td> <%=price%></td>
							</tr>
							<tr>
								<td>هزینه ارسال کالا</td>
								<td> 40</td>
							</tr>
							<tr>
								<td>هزینه بسته بندی کالا</td>
								<td> 29</td>
							</tr>
							<tr>
								<td><h5>هزینه قابل پرداخت :</h5></td>
								<td><h5>
										
										<%=price + 69%></h5></td>
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
					<h1 class="modal-title fs-5" id="exampleModalLabel">تغییر آدرس</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="UpdateUserServlet" method="post">
					<input type="hidden" name="operation" value="changeAddress">
					<div class="modal-body mx-3">
						<div class="mt-2">
							<label class="form-label fw-bold">آدرس</label>
							<textarea name="user_address" rows="3"
								placeholder="Enter Address(Area and Street))"
								class="form-control" required></textarea>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">شهر</label> <input
								class="form-control" type="text" name="city"
								placeholder="City/District/Town" required>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">کد پستی</label> <input
								class="form-control" type="number" name="pincode"
								placeholder="Pincode" maxlength="6" required>
						</div>
						<div class="mt-2">
							<label class="form-label fw-bold">استان</label> <select
								name="state" class="form-select">
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
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">بستن</button>
						<button type="submit" class="btn btn-primary">ذخیره</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end modal -->

</body>
</html>