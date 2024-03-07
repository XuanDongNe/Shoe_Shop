package admin;
import java.io.IOException;
import java.util.List;

import bean.Order;
import bean.Product;
import dao.OrderDao;
import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/order" })
public class OrderForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int count = new OrderDao().getTotalOrder();
		// Quantity Product
		int amountOrder = 12;
		// End of Page
		int endPage = count / amountOrder;
		if (count % amountOrder != 0) {
			endPage++;
		}
		String indexPageRaw = req.getParameter("indexPage");
		int currentPage;
		if (indexPageRaw == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(indexPageRaw);
		}

		List<Order> listOrder = new OrderDao().pagingOrder(currentPage, amountOrder);
		req.setAttribute("currentPage", currentPage); // Pass the value of the current page
		req.setAttribute("endPage", endPage);
		req.setAttribute("listOrder", listOrder);
		req.getRequestDispatcher("admin/order.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
