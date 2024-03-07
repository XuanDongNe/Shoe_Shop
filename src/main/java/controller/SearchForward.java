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

@WebServlet(urlPatterns = { "/search" })
public class SearchForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");

		int count = new ProductDao().getTotalProductBySearch(search);
		// Quantity Product
		int amountProduct = 9;
		// End of Page
		int endPage = count / amountProduct;
		if (count % amountProduct != 0) {
			endPage++;
		}
		String indexPageRaw = req.getParameter("indexPage");
		int currentPage;
		if (indexPageRaw == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(indexPageRaw);
		}

		List<Product> listP = new ProductDao().searchProduct(search, currentPage, amountProduct);
		List<Category> listC = new CategoryDao().getAllCategory();
		req.setAttribute("currentPage", currentPage); // Pass the value of the current page
		req.setAttribute("endPage", endPage);
		req.setAttribute("listP", listP);
		req.setAttribute("isSelect", "search?search="+search+"&");
		req.getRequestDispatcher("shop.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
