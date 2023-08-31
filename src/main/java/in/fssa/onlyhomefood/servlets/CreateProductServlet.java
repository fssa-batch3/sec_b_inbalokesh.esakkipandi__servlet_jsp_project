package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.Product;
import in.fssa.onlyhomefood.service.ProductService;

/**
 * Servlet implementation class CreateProductServlet
 */
@WebServlet("/product/create")
public class CreateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService productService = new ProductService();
		Product product = new Product();

		PrintWriter out = response.getWriter();

		product.setName(request.getParameter("name"));
		product.setType(request.getParameter("type"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		product.setQuantityType(request.getParameter("quantity_type"));

		try {
			productService.createNewProduct(product);
			out.print("Product has been created sucessfully");

			response.sendRedirect(request.getContextPath() + "/products");

		} catch (ValidationException | ServiceException e) {

			e.printStackTrace();
			out.print(e.getMessage());
		}

	}

}
