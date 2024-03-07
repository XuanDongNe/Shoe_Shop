package admin;

import java.io.IOException;

import bean.Product;
import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/editProduct" })
public class EditProduct extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id_raw = req.getParameter("id");
		int idProduct = Integer.parseInt(id_raw);
		String nameProduct = req.getParameter("name");
		String nameCategory = req.getParameter("category");
		int idCategory = Integer.parseInt(nameCategory);
		String image = req.getParameter("image");
		String price_raw = req.getParameter("price");
		double price = Double.parseDouble(price_raw);
		String description = req.getParameter("description");
		new ProductDao().editProduct(nameCategory, idCategory, price, image, description, idProduct);
		req.getRequestDispatcher("product").forward(req, resp);

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
