<%@page import="com.DigiShop.entities.User"%>
<%@page import="com.DigiShop.helper.ConnectionProvider"%>
<%@page import="com.DigiShop.entities.Admin"%>
<%@page import="com.DigiShop.entities.Message"%>
<%@page import="com.DigiShop.dao.UserDao"%>
<%@page errorPage="error_exception.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Admin activeAdmin = (Admin) session.getAttribute("activeAdmin");
if (activeAdmin == null) {
	Message message = new Message("You are not logged in! Login first!!", "error", "alert-danger");
	session.setAttribute("message", message);
	response.sendRedirect("adminlogin.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>مشاهده کاربران</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid px-5 py-3">
		<table class="table table-hover">
			<tr class="text-center table-primary" style="font-size: 18px;">
				<th>نام </th>
				<th>ایمیل</th>
				<th>شماره تلفن</th>
				<th>جنسیت</th>
				<th>آدرس</th>
				<th>تاریخ ثبت نام</th>
				<th>عملیات</th>
			</tr>
			<%
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			List<User> userList = userDao.getAllUser();
			for (User u : userList) {
			%>
			<tr>
				<td><%=u.getUserName()%></td>
				<td><%=u.getUserEmail()%></td>
				<td><%=u.getUserPhone()%></td>
				<td><%=u.getUserGender()%></td>
				<td><%=userDao.getUserAddress(u.getUserId())%></td>
				<td><%=u.getDateTime()%></td>
				<td><a href="UpdateUserServlet?operation=deleteUser&uid=<%=u.getUserId()%>" role="button" class="btn btn-danger">حذف</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>