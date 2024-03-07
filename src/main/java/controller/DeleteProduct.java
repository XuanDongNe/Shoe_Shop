package controller;

import java.io.IOException;

import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/deleteForward" })
public class DeleteProduct extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id_raw = req.getParameter("id");
		int id = Integer.parseInt(id_raw);
		new ProductDao().deleteProductInCart(id);
		req.getRequestDispatcher("cartForward").forward(req, resp);
	}
}
