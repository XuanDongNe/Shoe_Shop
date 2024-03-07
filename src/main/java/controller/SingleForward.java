package controller;

import java.io.IOException;

import bean.Product;
import bean.ShoppingCart;
import dao.CartDao;
import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/singleProduct" })
public class SingleForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("pId");
		int pId = Integer.parseInt(id);
		Product product = new ProductDao().getProductByCid(pId);
		req.setAttribute("detail", product);

		HttpSession session = req.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		if(cart == null) {
			req.getRequestDispatcher("product-single.jsp").forward(req, resp);
		}else {
		int totalQuantity = new CartDao().totalQuantityInCart(cart.getId());
		session.setAttribute("quantity", totalQuantity);
		req.getRequestDispatcher("product-single.jsp").forward(req, resp);
	}
		}
}
