package controller;

import java.io.IOException;

import dao.CustomerDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/resgisterForward" })
public class ResgisterForward extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("user");
		String password = req.getParameter("password");
		String rptPassword = req.getParameter("rptPassword");
		String email = req.getParameter("email");
		if(password.equals(rptPassword)) {
			if(new CustomerDao().getCustomerByName(userName) != null) {
				req.setAttribute("errorName", "Tên người dùng đã tồn tại");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}else {
				new CustomerDao().resgister(userName, password, email);
				resp.sendRedirect("login.jsp");
			}
		}else {
			req.setAttribute("errorPassword", "Mật khẩu không trùng nhau");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}
