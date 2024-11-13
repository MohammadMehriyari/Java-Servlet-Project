<%@page import="com.DigiShop.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DigiShop.entities.OrderedProduct"%>
<%@page import="com.DigiShop.entities.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DigiShop.dao.OrderedProductDao"%>
<%@page import="com.DigiShop.dao.OrderDao"%>
<%@page import="com.DigiShop.helper.ConnectionProvider"%>
<%@page import="com.DigiShop.entities.User"%>
<%@page errorPage="error_exception.jsp"%>

<%
User u2 = (User) session.getAttribute("activeUser");
if (u2 == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("login.jsp");
	return;  
}
OrderDao orderDao = new OrderDao(ConnectionProvider.getConnection());
OrderedProductDao ordProdDao = new OrderedProductDao(ConnectionProvider.getConnection());

List<Order> orderList = orderDao.getAllOrderByUserId(u2.getUserId());
%>
<div class="container-fluid px-3 py-3">
	<%
	if (orderList == null || orderList.size() == 0) {
	%>
	<div class="container mt-5 mb-5 text-center">
		<img src="Images/empty-cart.png" style="max-width: 200px;"
			class="img-fluid">
		<h4 class="mt-3">هیچ سفارشی پیدا نشد!
	</div>
	<%
	} else {
	%>
	<h4>سفارشات من</h4>
	<hr>
	<div class="container">
		<table class="table table-hover">
			<tr class="text-center table-secondary">
			  <th>کالا</th>
			  <th>کد سفارش</th>
			  <th>نام</th>
			  <th>تعداد</th>
			  <th>قیمت </th>
			  <th>تاریخ</th>
			  <th>نوع پرداخت</th>
			  <th>وضعیت</th>
			</tr>
			<%
			for (Order order : orderList) {
				List<OrderedProduct> ordProdList = ordProdDao.getAllOrderedProduct(order.getId());
				for (OrderedProduct orderProduct : ordProdList) {
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=orderProduct.getImage()%>"
					style="width: 40px; height: 40px; width: auto;"></td>
				<td class="text-start"><%=order.getOrderId()%></td>
				<td class="text-start"><%=orderProduct.getName()%></td>
				<td><%=orderProduct.getQuantity()%></td>
				<td><%=orderProduct.getPrice() * orderProduct.getQuantity()%></td>
				<td><%=order.getDate()%></td>
				<td><%=order.getPayementType()%></td>
				<td class="fw-semibold" style="color: green;"><%=order.getStatus()%></td>
			</tr>
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
