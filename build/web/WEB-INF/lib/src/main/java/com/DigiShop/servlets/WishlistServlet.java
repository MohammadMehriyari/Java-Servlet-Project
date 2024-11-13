package com.DigiShop.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DigiShop.dao.WishlistDao;
import com.DigiShop.entities.Wishlist;
import com.DigiShop.helper.ConnectionProvider;

public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		String op = request.getParameter("op");

		WishlistDao wishlistDao = new WishlistDao(ConnectionProvider.getConnection());
		if (op.trim().equals("add")) {
			Wishlist wishlist = new Wishlist(uid, pid);
			wishlistDao.addToWishlist(wishlist);
			response.sendRedirect("products.jsp");
		} else if (op.trim().equals("remove")) {
			wishlistDao.deleteWishlist(uid, pid);
			response.sendRedirect("products.jsp");
		}else if(op.trim().equals("delete")) {
			wishlistDao.deleteWishlist(uid, pid);
			response.sendRedirect("profile.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
