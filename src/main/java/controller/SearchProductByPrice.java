package controller;

import java.io.IOException;
import java.util.List;

import bean.Category;
import bean.Product;
import dao.CategoryDao;
import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/searchByPrice")
public class SearchProductByPrice extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String priceFrom_raw = req.getParameter("priceFrom");
		double priceFrom = Double.parseDouble(priceFrom_raw);
		String priceTo_raw = req.getParameter("priceTo");
		double priceTo = Double.parseDouble(priceTo_raw);
		List<Product> list = new ProductDao().searchProductByPrice(priceFrom, priceTo);
		List<Category> listC = new CategoryDao().getAllCategory();
		req.setAttribute("listP", list);
		req.setAttribute("listC", listC);
		req.getRequestDispatcher("shop.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
