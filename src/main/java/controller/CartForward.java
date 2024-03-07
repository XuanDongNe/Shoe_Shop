package controller;

import java.io.IOException;
import java.util.List;

import bean.CartLine;
import bean.OrderDetailDto;
import bean.ShoppingCart;
import dao.CartDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/cartForward" })
public class CartForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
		
		if (cart == null) {
			resp.sendRedirect("login.jsp");
		} else {
			// cập nhật lại giỏ hàng
			
			List<CartLine> list = new CartDao().getAllProductInCart(cart.getId());
			req.setAttribute("listPInCart", list);

			int totalQuantity = new CartDao().totalQuantityInCart(cart.getId());
			session.setAttribute("quantity", totalQuantity);
			req.getRequestDispatcher("cart.jsp").forward(req, resp);
		}
	}

}
