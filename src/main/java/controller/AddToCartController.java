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

@WebServlet(urlPatterns = { "/addToCart" })
public class AddToCartController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("pId");
		String quantity_raw = req.getParameter("quantity");
		int quantity = Integer.parseInt(quantity_raw);
		int pId = Integer.parseInt(id);
		String price_raw = req.getParameter("price");
		int price = Integer.parseInt(price_raw);
		String isShop = req.getParameter("isShop");
		HttpSession session = req.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		
		if (cart == null) {
			resp.sendRedirect("login.jsp");
		} else if (!isShop.equals("true")) {
			new CartDao().addItemToCart(cart.getId(), pId, quantity,price);
			req.getRequestDispatcher("singleProduct").forward(req, resp);
		} else  {
			new CartDao().addItemToCart(cart.getId(), pId, quantity,price);
			req.getRequestDispatcher("shop").forward(req, resp);
		}

	}
	
	public static void main(String[] args) {
		System.out.println(new CartDao().totalQuantityInCart(1));
	}

}
