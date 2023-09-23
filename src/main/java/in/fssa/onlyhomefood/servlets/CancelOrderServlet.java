package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.OrderedItems.OrderStatus;
import in.fssa.onlyhomefood.service.OrderItemService;

/**
 * Servlet implementation class CancelOrderServlet
 */
@WebServlet("/order/cancel")
public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Integer id = Integer.parseInt(request.getParameter("orderId"));
			OrderItemService orderItemsService = new OrderItemService();
			orderItemsService.updateStatus(id, OrderStatus.valueOf("Cancelled"));
			
			response.sendRedirect(request.getContextPath() + "/profile");
			
		} catch (NumberFormatException | ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());

		}

	}

}
