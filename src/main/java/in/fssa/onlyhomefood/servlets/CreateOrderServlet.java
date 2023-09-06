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
import in.fssa.onlyhomefood.model.Order;
import in.fssa.onlyhomefood.model.OrderEntity.DeliveryTime;
import in.fssa.onlyhomefood.model.OrderEntity.OrderStatus;
import in.fssa.onlyhomefood.service.OrderService;

/**
 * Servlet implementation class CreateOrderServlet
 */
@WebServlet("/order/create")
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		OrderService orderService = new OrderService();
		
		Order order = new Order();
		
		String data = request.getParameter("data");
		System.out.println(data);
		
		order.setAddress(request.getParameter("address"));
		order.setDelivery_time(DeliveryTime.valueOf(request.getParameter("delivery_time")));
		order.setOrder_status(OrderStatus.valueOf(request.getParameter("status")));
		order.setCreated_by(Integer.parseInt(request.getParameter("created_by")));
		order.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		order.setQuantity(Integer.parseInt(request.getParameter("order_quantity")));
		order.setTotal_price(Integer.parseInt(request.getParameter("total_price")));
		
		try {
			orderService.createNewOrder(order);
			out.print("Order created Sucessfully");
			
		} catch (ValidationException | ServiceException e) {
			
			e.printStackTrace();
		}
	}

}
