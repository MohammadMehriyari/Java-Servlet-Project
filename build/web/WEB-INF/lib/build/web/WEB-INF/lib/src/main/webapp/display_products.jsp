<%@page import="com.DigiShop.helper.ConnectionProvider"%>
<%@page import="com.DigiShop.entities.Admin"%>
<%@page import="com.DigiShop.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@page errorPage="error_exception.jsp"%>
<%@page import="com.DigiShop.dao.UserDao"%>
<%@page import="com.DigiShop.entities.Product"%>
<%@page import="com.DigiShop.dao.ProductDao"%>
<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}
UserDao userDao = new UserDao(ConnectionProvider.getConnection());
ProductDao productDao = new ProductDao(ConnectionProvider.getConnection());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>مشاهده کالا ها</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- update product -->
	<div class="container mt-3">
		<%@include file="Components/alert_message.jsp"%>
		<table class="table table-hover">
			<tr class="table-primary text-center" style="font-size: 20px;">
				<th>عکس</th>
				<th>نام</th>
				<th class="text-start">دسته بندی </th>
				<th>قیمت</th>
				<th class="text-start">تعداد</th>
				<th class="text-start">تخفیف</th>
				<th>عملیات</th>
			</tr>
			<%
			List<Product> productList = productDao.getAllProducts();
			for (Product prod : productList) {
				String category = catDao.getCategoryName(prod.getCategoryId());
			%>
			<tr class="text-center">
				<td><img src="Images\product.png>"
					style="width: 60px; height: 60px; width: auto;"></td>
				<td class="text-start"><%=prod.getProductName()%></td>
				<td><%=category%></td>
				<td><%=prod.getProductPriceAfterDiscount()%></td>
				<td><%=prod.getProductQunatity()%></td>
				<td><%=prod.getProductDiscount()%>%</td>
				<td><a href="update_product.jsp?pid=<%=prod.getProductId()%>" role="button" class="btn btn-secondary">آپدیت</a>&emsp;<a
					href="AddOperationServlet?pid=<%=prod.getProductId()%>&operation=deleteProduct"
					class="btn btn-danger" role="button">حذف</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>

