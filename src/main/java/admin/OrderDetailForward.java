package admin;

import java.io.IOException;
import java.util.List;

import bean.OrderDetailDto;
import dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/orderDetail" })
public class OrderDetailForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("orderId");
		int orderId = Integer.parseInt(id);
		List<OrderDetailDto> list = new OrderDao().getListOrderDetailById(orderId);
		req.setAttribute("listDetail", list);
		req.getRequestDispatcher("admin/orderdetail.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
