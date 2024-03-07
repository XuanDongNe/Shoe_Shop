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

@WebServlet(urlPatterns = { "/updateCart" })
public class UpdateCart extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pId_raw = req.getParameter("pId");
		int pId = Integer.parseInt(pId_raw);
		String quantity_raw = req.getParameter("quantity");
		int quantity = Integer.parseInt(quantity_raw);
		String price_raw = req.getParameter("price");
		int price = Integer.parseInt(price_raw);

		HttpSession session = req.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

		new CartDao().updateCart(quantity, pId, cart.getId());
		req.getRequestDispatcher("cartForward").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
