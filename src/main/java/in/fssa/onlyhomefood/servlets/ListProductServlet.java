package in.fssa.onlyhomefood.servlets;


import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/products")
public class ListProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		ProductService productService = new ProductService();
		PrintWriter out = response.getWriter();
			try {
				Set<Product> listofproducts = productService.getAllProducts();
				
				request.setAttribute("products", listofproducts);
				
				RequestDispatcher rd = request.getRequestDispatcher("/list_all_products.jsp");
				rd.forward(request, response);
			
			} catch (ServiceException e) {
				e.printStackTrace();
				out.print(e.getMessage());
			}
					
		}

	}