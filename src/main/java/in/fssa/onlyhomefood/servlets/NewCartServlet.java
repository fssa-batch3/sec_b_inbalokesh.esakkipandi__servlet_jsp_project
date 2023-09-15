package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.Product;
import in.fssa.onlyhomefood.model.User;
import in.fssa.onlyhomefood.service.ProductService;
import in.fssa.onlyhomefood.service.UserService;

/**
 * Servlet implementation class NewOrderServlet
 */
@WebServlet("/cart")
public class NewCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductService productService = new ProductService();

		try {

			Set<Product> listofproducts = productService.getAllProducts();
			
			List<Product> list = new ArrayList<>(listofproducts);

		    Collections.sort(list, Comparator.comparingInt(Product::getId));
			
		
			Gson gson = new Gson();
			String responseJson = gson.toJson(list);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			request.setAttribute("products", responseJson);
			
			long phone_number = (Long) request.getSession().getAttribute("loggedNumber");
			UserService userService = new UserService();
			
			User user = userService.findUserByPhoneNumber(phone_number);
			request.setAttribute("user", user);
			
			RequestDispatcher req = request.getRequestDispatcher("/cart.jsp");
			req.forward(request, response);
			
		} catch (NumberFormatException | ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}

	}

}
