package admin;

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

@WebServlet(urlPatterns = "/product")
public class ProductForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> listC = new CategoryDao().getAllCategory();
		req.setAttribute("listC", listC);

		String isShop = req.getParameter("isShop");

		// Pagination for Products
		int count = new ProductDao().getTotalProduct(null, null);
		// Quantity Product
		int amountProduct = 6;
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

		List<Product> listP = new ProductDao().pagingProduct(currentPage, amountProduct,null ,null);
		req.setAttribute("currentPage", currentPage); // Pass the value of the current page
		req.setAttribute("endPage", endPage);
		req.setAttribute("listProduct", listP);

		req.getRequestDispatcher("admin/product.jsp").forward(req, resp);
	}
}
