<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>مشکلی پیش آمده است!</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body>

	<div class="container p-5 text-center">
		<img src="Images\no-results.png" class="img-fluid" style="max-width: 400px;">
		<h1>متاسفم مشکلی پیش آمده است....</h1>
		<p><%=exception%></p>
		<a href="index.jsp" class="btn btn-outline-primary btn-lg mt-3">خانه</a>
	</div>
</body>
</html>