package controller;

import java.io.IOException;

import bean.Customer;
import bean.ShoppingCart;
import dao.AdminDao;
import dao.CartDao;
import dao.CustomerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/loginForward" })
public class LoginForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("user");
		String password = req.getParameter("password");
		Customer cus = new CustomerDao().login(userName, password);

		if (new CustomerDao().getRoles(userName) == 1 && cus != null) {
			req.getRequestDispatcher("dashboard").forward(req, resp);
		} else if (cus != null && new CustomerDao().getRoles(userName) == 2) {
			HttpSession session = req.getSession();
			session.setAttribute("user", cus);
			
			ShoppingCart cart = new CartDao().getCartById(cus.getcId());
			session.setAttribute("cart", cart);
			session.setMaxInactiveInterval(60*60*60);
			
			int totalQuantity = new CartDao().totalQuantityInCart(cart.getId());
			session.setAttribute("quantity", totalQuantity);
			req.getRequestDispatcher("home").forward(req, resp);
		} else {
			req.setAttribute("message", "Tài khoản không tồn tại");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}
