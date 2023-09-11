package in.fssa.onlyhomefood.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.Product;
import in.fssa.onlyhomefood.model.User;
import in.fssa.onlyhomefood.service.ProductService;
import in.fssa.onlyhomefood.service.UserService;

/**
 * Servlet implementation class NewOrderServlet
 */
@WebServlet("/order")
public class NewOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Product product = new ProductService().findProductById(Integer.parseInt(request.getParameter("id")));

			request.setAttribute("product", product);

			long phone_number = (Long) request.getSession().getAttribute("loggedNumber");
			UserService userService = new UserService();

			User user = userService.findUserByPhoneNumber(phone_number);

			request.setAttribute("user", user);

			RequestDispatcher req = request.getRequestDispatcher("/order.jsp");
			req.forward(request, response);
		} catch (NumberFormatException | ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}

}