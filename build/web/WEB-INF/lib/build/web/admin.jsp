<%@page import="com.DigiShop.entities.Category"%>
<%@page import="com.DigiShop.entities.Admin"%>
<%@page import="com.DigiShop.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error_exception.jsp"%>
<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("ابتدا وارد شوید", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>صفحه ادمین</title>
<%@include file="Components/common_css_js.jsp"%>
<style type="text/css">
.cus-active {
	background-color: #e6eefa !important;
	width: 100%;
}

.list-btn {
	font-size: 18px !important;
}

.list-btn:hover {
	color: #2874f0 !important;
}

.no-border {
	border: 0;
	box-shadow: none;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!--admin dashboard -->
	<div class="container-fluid py-4 px-3">
		<%@include file="Components/alert_message.jsp"%>
		<div class="row">
			<div class="container text-center" id="details">
				<img src="Images/admin.png" style="max-width: 180px;"
					class="img-fluid">
				<h3>
					خوش آمدید   <%=activeAdmin.getName()%>
				</h3>
			</div>
		</div>
		<div class="container">
			<div class="row px-3 py-3">
				<div class="col-md-4">
					<a href="display_category.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/categories.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">دسته بندی  کالا ها</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_products.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/products.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">کالا ها</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_orders.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/order.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">سفارشات</h4>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row px-3">
				<div class="col-md-4 offset-md-2">
					<a href="display_users.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/users.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">کاربران</h4>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="display_admin.jsp">
						<div class="card text-bg-light mb-3 text-center">
							<div class="card-body">
								<img src="Images/add-admin.png" style="max-width: 80px;"
									class="img-fluid">
								<h4 class="card-title mt-3">ادمین</h4>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--end-->

	<!-- add category modal-->
	<div class="modal fade" id="add-category" tabindex="-1"
		aria-labelledby="addCategoryModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="addCategoryModalLabel">دسته بندی را از اینجا اضافه کنید</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="AddOperationServlet" method="post"
					enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" name="operation" value="addCategory">

						<div class="mb-3">
							<label class="form-label"><b>نام دسته بندی</b></label> <input
								type="text" name="category_name"
								placeholder="Enter category here" class="form-control" required>
						</div>
						<div class="mb-3">
							<label for="formFile" class="form-label"><b>عکس دسته بندی</b></label> <input class="form-control" type="file"
								name="category_img" id="formFile">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">بستن</button>
						<button type="submit" class="btn btn-primary me-3">اضافه کردن</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end of modal -->

	<!-- add product modal-->
	<div class="modal fade" id="add-product" tabindex="-1"
		aria-labelledby="addProductModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="addProductModalLabel">کالا را از اینجا اضافه کنید</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="AddOperationServlet" method="post"
					name="addProductForm" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" name="operation" value="addProduct">
						<div>
							<label class="form-label"><b>نام کالا</b></label> <input
								type="text" name="name" placeholder="Enter product name"
								class="form-control" required>
						</div>
						<div class="mb-2">
							<label class="form-label"><b>توظیحات کالا</b></label>
							<textarea class="form-control" name="description" rows="4"
								placeholder="Enter product description"></textarea>
						</div>
						<div class="row">
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>قیمت کالا</b></label> <input
									type="number" name="price" placeholder="Enter price"
									class="form-control" required>
							</div>
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>درصد تخفیف</b></label> <input
									type="number" name="discount" onblur="validate()"
									placeholder="Enter discount if any!" class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>تعداد</b></label> <input
									type="number" name="quantity"
									placeholder="Enter product quantity" class="form-control">
							</div>
							<div class="col-md-6 mb-2">
								<label class="form-label"><b>نوع دسته بندی را انتخاب کنید</b></label> <select
									name="categoryType" class="form-control">
									<option value="0">--انتخاب کنید--</option>
									<%
									for (Category c : categoryList) {
									%>
									<option value="<%=c.getCategoryId()%>">
										<%=c.getCategoryName()%></option>
									<%
									}
									%>
								</select>
							</div>
						</div>
						<div class="mb-2">
							<label class="form-label"><b>عکس کالا</b></label> <input
								type="file" name="photo" class="form-control" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">بستن</button>
						<button type="submit" class="btn btn-primary me-3">اضافه کردن کالا</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end of modal -->

	<script type="text/javascript">
		function validate() {
			var dis = document.addProductForm.discount.value;
			if (dis > 100 || dis < 0) {
				alert("Discount need tobe between 0-100 !");
				//document.addProductForm.discount.focus();
				return false;
			}
		}
	</script>
</body>
</html>