<%@page import="com.DigiShop.entities.Category"%>
<%@page import="com.DigiShop.entities.Admin"%>
<%@page import="com.DigiShop.entities.Message"%>
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
<title>مشاهده دسته بندی کالا ها</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>
	
		<!--navbar -->
	<%@include file="Components/navbar.jsp"%>

	<!-- Category -->
	<div class="container mt-3">
	<%@include file="Components/alert_message.jsp"%>
		<table class="table table-hover">
			<tr class="table-primary text-center" style="font-size: 20px;">
				<th>عکس</th>
				<th>نام دسته بندی</th>
				<th>عملیات</th>
			</tr>
			<%
			for (Category c : categoryList) {
			%>
			<tr class="text-center">
				<td><img src="Product_imgs\<%=c.getCategoryImage()%>"
					style="width: 60px; height: 60px; width: auto;"></td>
				<td><%=c.getCategoryName()%></td>
				<td><a href="update_category.jsp?cid=<%=c.getCategoryId()%>" role="button" class="btn btn-secondary">آپدیت</a>&emsp;<a
					href="AddOperationServlet?cid=<%=c.getCategoryId()%>&operation=deleteCategory"
					class="btn btn-danger" role="button">حذف</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

</body>
</html>
