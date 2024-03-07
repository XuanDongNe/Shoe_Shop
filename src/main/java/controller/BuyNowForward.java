package controller;

import java.io.IOException;

import bean.ShoppingCart;
import dao.CartDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/buyForward" })
public class BuyNowForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pId = req.getParameter("pId");
		String quantity = req.getParameter("quantity");
		String price = req.getParameter("price");
		String buyNow = req.getParameter("buyNow");

		HttpSession session = req.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

		if (cart == null) {
			resp.sendRedirect("login.jsp");
		} else {
			req.setAttribute("pId", pId);
			req.setAttribute("quantity", quantity);
			req.setAttribute("price", price);
			req.setAttribute("isBuyNow", buyNow);
			req.getRequestDispatcher("checkout.jsp").forward(req, resp);
		}
	}
}
