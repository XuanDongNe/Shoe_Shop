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

@WebServlet(urlPatterns = { "/category" })
public class CategoryController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("cid");
		int cid = Integer.parseInt(id);

		// lấy sản phẩm trong khoảng giá tiền
		String priceFrom_raw = req.getParameter("priceFrom");
		String priceTo_raw = req.getParameter("priceTo");

		// Quantity Product
		int count = new ProductDao().getTotalProductByCategory(cid, priceFrom_raw, priceTo_raw);
		// Quantity Product display
		int amountProduct = 9;
		// End of Page
		int endPage = count / amountProduct;
		if (count % amountProduct != 0) {
			endPage++;
		}
		// lấy tham số trên đường dẫn
		String indexPageRaw = req.getParameter("indexPage");
		int currentPage;
		if (indexPageRaw == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(indexPageRaw);
		}

		List<Product> listPByCid = new ProductDao().getAllProductByCid(cid, currentPage, amountProduct, priceFrom_raw,
				priceTo_raw);
		req.setAttribute("currentPage", currentPage); // Pass the value of the current page
		req.setAttribute("endPage", endPage);
		req.setAttribute("listP", listPByCid);
		req.setAttribute("tag", cid);
		// truyền lại đường dẫn trên shop
		if (priceFrom_raw != null && priceTo_raw != null) {
			req.setAttribute("isSelect",
					"category?cid" + cid + "&priceFrom=" + priceFrom_raw + "&priceTo=" + priceTo_raw + "&");
		}
		{
			req.setAttribute("isSelect", "category?cid" + cid);
		}

		List<Category> listC = new CategoryDao().getAllCategory();
		req.setAttribute("listC", listC);

		req.getRequestDispatcher("shop.jsp").forward(req, resp);
	}
}
