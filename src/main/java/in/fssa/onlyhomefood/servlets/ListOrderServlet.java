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
import in.fssa.onlyhomefood.model.Order;
import in.fssa.onlyhomefood.service.OrderService;

/**
 * Servlet implementation class ListOrderServlet
 */
@WebServlet("/ListOrderServlet")
public class ListOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		OrderService orderService = new OrderService();
		try {
			Set<Order> listoforders = orderService.getAllOrders();
			
			request.setAttribute("orders", listoforders);
			
			RequestDispatcher rd = request.getRequestDispatcher("/list_all_orders.jsp");
			rd.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}


}
