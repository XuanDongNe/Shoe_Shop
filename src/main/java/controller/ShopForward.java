package controller;

import java.io.IOException;
import java.util.List;

import bean.Category;
import bean.Product;
import bean.ShoppingCart;
import dao.CartDao;
import dao.CategoryDao;
import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/shop" })
public class ShopForward extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// get category list
		List<Category> listC = new CategoryDao().getAllCategory();
		req.setAttribute("listC", listC);

		// lấy sản phẩm trong khoảng giá tiền
		String priceFrom_raw = req.getParameter("priceFrom");
		String priceTo_raw = req.getParameter("priceTo");

		String isShop = req.getParameter("isShop");

		// Pagination for Products
		int count = new ProductDao().getTotalProduct(priceFrom_raw, priceTo_raw);
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

		List<Product> listP = new ProductDao().pagingProduct(currentPage, amountProduct, priceFrom_raw, priceTo_raw);
		req.setAttribute("currentPage", currentPage); // Pass the value of the current page
		req.setAttribute("endPage", endPage);
		req.setAttribute("listP", listP);
		// truyền lại đường dẫn trên shop
		if (priceFrom_raw != null && priceTo_raw != null) {
			req.setAttribute("isSelect", "shop?priceFrom=" + priceFrom_raw + "&priceTo=" + priceTo_raw+"&");
		} else {
			req.setAttribute("isSelect", "shop?");
		}

		HttpSession session = req.getSession();
		ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

		if (cart == null && isShop != null) {
			resp.sendRedirect("login.jsp");
		} else {
			if (cart != null) {
				int totalQuantity = new CartDao().totalQuantityInCart(cart.getId());
				session.setAttribute("quantity", totalQuantity);
			}
			req.getRequestDispatcher("shop.jsp").forward(req, resp);
		}
	}

}
