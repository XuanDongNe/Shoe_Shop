package controller;

import java.io.IOException;

import bean.Customer;
import bean.ShoppingCart;
import dao.CartDao;
import dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/orderForward" })
public class OrderForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String buyNow = req.getParameter("buyNow");
		boolean isBuyNow = Boolean.parseBoolean(buyNow);

		HttpSession session = req.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		Customer user = (Customer) session.getAttribute("user");

		if (isBuyNow) {
			String pId_raw = req.getParameter("pId");
			int pId = Integer.parseInt(pId_raw);
			String quantity_raw = req.getParameter("quantity");
			int quantity = Integer.parseInt(quantity_raw);
			String price_raw = req.getParameter("price");
			double price = Double.parseDouble(price_raw);

			new OrderDao().addOrderNow(user.getcId() , pId, quantity, price);
			req.getRequestDispatcher("shop").forward(req, resp);
		} else {

			new OrderDao().createOrder(user.getcId(), cart.getId());
			new CartDao().removeAll(cart.getId());

			req.getRequestDispatcher("shop").forward(req, resp);

		}
	}
}
