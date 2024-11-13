<%@page import="com.DigiShop.entities.Admin"%>
<%@page import="com.DigiShop.entities.Cart"%>
<%@page import="com.DigiShop.dao.CartDao"%>
<%@page import="com.DigiShop.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DigiShop.entities.Category"%>
<%@page import="com.DigiShop.helper.ConnectionProvider"%>
<%@page import="com.DigiShop.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
User user = (User) session.getAttribute("activeUser");
Admin admin = (Admin) session.getAttribute("activeAdmin");

CategoryDao catDao = new CategoryDao(ConnectionProvider.getConnection());
List<Category> categoryList = catDao.getAllCategories();
%>
<style>
.navbar {
	font-weight: 500;
}

.nav-link {
	color: rgb(255 255 255/ 100%) !important;
}

.dropdown-menu {
	background-color: #ffffff !important;
	border-color: #949494;
}

.dropdown-menu li a:hover {
	background-color: #808080 !important;
	color: white;
}
</style>
<nav class="navbar navbar-expand-lg custom-color" data-bs-theme="dark">

	<!-- admin nav bar -->
	<%
	if (admin != null) {
	%>
	<div class="container">
		<a class="navbar-brand" href="admin.jsp"><i
			class="fa-sharp fa-solid fa-house" style="color: #ffffff;"></i>&ensp;DigiShop</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<div class="container text-end">
				<ul class="navbar-nav justify-content-end">
					<li class="nav-item"><button type="button"
							class="btn nav-link" data-bs-toggle="modal"
							data-bs-target="#add-category"><i class="fa-solid fa-plus fa-xs"></i>اضافه کردن دسته بندی</button></li>
					<li class="nav-item"><button type="button"
							class="btn nav-link" data-bs-toggle="modal"
							data-bs-target="#add-product"><i class="fa-solid fa-plus fa-xs"></i>اضافه کردن کالا</button></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="admin.jsp"><%=admin.getName()%></a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="LogoutServlet?user=admin"><i
							class="fa-solid fa-user-slash fa-sm" style="color: #fafafa;"></i>&nbsp;خروج </a></li>
				</ul>
			</div>
		</div>
	</div>
	<%
	} else if (user == null) {
	%>

	<!-- end -->

	<!-- for all -->
	<div class="container">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-sharp fa-solid fa-house" style="color: #ffffff;"></i>&ensp;DigiShop</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="products.jsp"
					role="button" aria-expanded="false"> کالا ها </a>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false">دسته بندی ها </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="products.jsp?category=0">همه کالا ها</a></li>
						<%
						for (Category c : categoryList) {
						%>
						<li><a class="dropdown-item"
							href="products.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a></li>
						<%
						}
						%>
					</ul></li>
			</ul>
                                        			<ul class="navbar-nav ml-auto">
				<li class="nav-item active pe-2"><a class="nav-link"
					aria-current="page" href="register.jsp"> <i
						class="fa-solid fa-user-plus" style="color: #ffffff;"></i>&nbsp;ثبت نام
				</a></li>
				<li class="nav-item pe-2"><a class="nav-link"
					aria-current="page" href="login.jsp"><i
						class="fa-solid fa-user-lock" style="color: #fafafa;"></i>&nbsp;ورود</a></li>
				<li class="nav-item pe-2"><a class="nav-link"
					aria-current="page" href="adminlogin.jsp">&nbsp;ورود ادمین</a></li>
			</ul>
                </div>
        </div>
                                        
          	<%
	} else if (user != null) {
				CartDao cartDao = new CartDao(ConnectionProvider.getConnection());
				int cartCount = cartDao.getCartCountByUserId(user.getUserId());
	%>                              
			<!-- when user is logged in -->
                        	<div class="container">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-sharp fa-solid fa-house" style="color: #ffffff;"></i>&ensp;DigiShop</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="products.jsp"
					role="button" aria-expanded="false"> کالا ها </a>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> دسته بندی ها </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="products.jsp?category=0">همه کالا ها</a></li>
						<%
						for (Category c : categoryList) {
						%>
						<li><a class="dropdown-item"
							href="products.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a></li>
						<%
						}
						%>
					</ul></li>
			</ul>
                                        			<ul class="navbar-nav ml-auto">
	<li class="nav-item active pe-3"><a class="nav-link"
					aria-current="page" href="profile.jsp"><%=user.getUserName()%></a></li>
				<li class="nav-item pe-3"><a class="nav-link"
					aria-current="page" href="LogoutServlet?user=user"><i
						class="fa-solid fa-user-slash" style="color: #fafafa;"></i>&nbsp;خروج</a></li>
				<li class="nav-item pe-2"><a class="nav-link"
					aria-current="page" href="adminlogin.jsp">&nbsp;ورود ادمین</a></li>
			</ul>
                </div>
        </div>

	<%
	}
	
	%>
	<!-- end  -->
</nav>

