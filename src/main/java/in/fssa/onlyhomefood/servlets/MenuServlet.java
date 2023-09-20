package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.model.Product;
import in.fssa.onlyhomefood.service.ProductService;

/**
 * Servlet implementation class MenuServlet
 */
@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
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
			
			request.setAttribute("allProducts", listofproducts);
			
			RequestDispatcher rd = request.getRequestDispatcher("/menu.jsp");
			rd.forward(request, response);

		} catch (ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}

	}
}
