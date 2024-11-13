<%@page import="com.DigiShop.entities.Admin"%>
<%@page import="com.DigiShop.entities.Message"%>
<%@page import="com.DigiShop.dao.UserDao"%>
<%@page errorPage="error_exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DigiShop.entities.OrderedProduct"%>
<%@page import="com.DigiShop.entities.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DigiShop.dao.OrderedProductDao"%>
<%@page import="com.DigiShop.dao.OrderDao"%>
<%@page import="com.DigiShop.helper.ConnectionProvider"%>

<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}
OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
OrderedProductDao ordProdDao = new OrderedProductDao(ConnectionProvider.getConnection());
List<Order> orderList = orderDao.getAllOrder();
UserDao userDao = new UserDao(ConnectionProvider.getConnection());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>مشاهده سفارشات</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- order details -->

	<div class="container-fluid px-3 py-3">
		<%
		if (orderList == null || orderList.size() == 0) {
		%>
		<div class="container mt-5 mb-5 text-center">
			<img src="Images/empty-cart.png" style="max-width: 200px;"
				class="img-fluid">
			<h4 class="mt-3">هیچ سفارشی پیدا نشد</h4>
		</div>
		<%
		} else {
		%>
		<div class="container-fluid">
			<table class="table table-hover">
				<tr class="table-primary" style="font-size: 18px;">
					<th class="text-center">کالا</th>
					<th>کد سفارش</th>
					<th>اطلاعات سفارش</th>
					<th>آدرس تحویل</th>
					<th>تاریخ و زمان</th>
					<th>روش پرداخت</th>
					<th>وضعیت</th>
					<th colspan="2" class="text-center">Action</th>
				</tr>
				<%
				for (Order order : orderList) {
					List<OrderedProduct> ordProdList = ordProdDao.getAllOrderedProduct(order.getId());
					for (OrderedProduct orderProduct : ordProdList) {
				%>
				<form action="UpdateOrderServlet?oid=<%=order.getId()%>"
					method="post">
				<tr>
					<td class="text-center"><img
						src="Product_imgs\<%=orderProduct.getImage()%>"
						style="width: 50px; height: 50px; width: auto;"></td>
					<td><%=order.getOrderId()%></td>
					<td><%=orderProduct.getName()%><br>Quantity: <%=orderProduct.getQuantity()%><br>هزینه کلی: <%=orderProduct.getPrice() * orderProduct.getQuantity()%></td>
					<td><%=userDao.getUserName(order.getUserId())%><br>تلفن همراه. <%=userDao.getUserPhone(order.getUserId())%><br><%=userDao.getUserAddress(order.getUserId())%></td>
					<td><%=order.getDate()%></td>
					<td><%=order.getPayementType()%></td>
					<td><%=order.getStatus()%></td>
					<td><select id="operation" name="status" class="form-select">
							<option>--انتخاب کنید--</option>
							<option value="سفارش تایید شد">سفارش تایید شد</option>
							<option value="سفارش ارسال شد">سفارش ارسال شد</option>
							<option value="در حال آماده سازی">سفارش در حال آماده سازی برای ارسال</option>
							<option value=" تحویل داده شد">سفارش تحویل داده شد</option>
					</select></td>
					<td>
						<%
						if (order.getStatus().equals("Delivered")) {
						%>
						<button type="submit" class="btn btn-success disabled">آپدیت</button>
						<%
						} else {
						%>
						<button type="submit" class="btn btn-secondary">آپدیت</button> 
						<%
						 }
						 %>
					</td>
				</tr>
				</form>
				<%
				}
				}
				%>
			</table>

		</div>
		<%
		}
		%>
	</div>
</body>
</html>