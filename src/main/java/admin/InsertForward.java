package admin;

import java.io.IOException;

import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/addProduct" })
public class InsertForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String image = req.getParameter("image");
		String category = req.getParameter("category");
		int categoryId = Integer.parseInt(category);
		String price_raw = req.getParameter("price");
		double price = Double.parseDouble(price_raw);
		String description = req.getParameter("description");

		new ProductDao().addProduct(name, categoryId, price, image, description);
		req.getRequestDispatcher("product").forward(req, resp);
	}
}
