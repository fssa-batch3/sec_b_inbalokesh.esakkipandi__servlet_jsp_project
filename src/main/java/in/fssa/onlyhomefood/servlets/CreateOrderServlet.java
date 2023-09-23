package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.Order;
import in.fssa.onlyhomefood.model.OrderedItems;
import in.fssa.onlyhomefood.model.ResponseEntity;
import in.fssa.onlyhomefood.model.OrderedItems.DeliveryTime;
import in.fssa.onlyhomefood.model.OrderedItems.OrderStatus;
import in.fssa.onlyhomefood.service.OrderService;

/**
 * Servlet implementation class CreateOrderServlet
 */
@WebServlet("/order/create")
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String jsonInput = request.getReader().lines().collect(Collectors.joining());

		JSONObject jsonObject = new JSONObject(jsonInput);

		JSONArray orderedItems = jsonObject.getJSONArray("orderedItems");

		int totalPrice = jsonObject.getInt("totalPrice");
		int createdBy = jsonObject.getInt("createdBy");
		int addressId = jsonObject.getInt("addressId");

		Order order = new Order();

		order.setTotalPrice(totalPrice);
		order.setCreatedBy(createdBy);
		order.setDeliveryAddressId(addressId);

		List<OrderedItems> items = new ArrayList<>();

		for (int i = 0; i < orderedItems.length(); i++) {

			OrderedItems orderItems = new OrderedItems();

			JSONObject itemObject = orderedItems.getJSONObject(i);

			orderItems.setQuantityOrdered(itemObject.getInt("quantity_ordered"));
			orderItems.setProductId(itemObject.getInt("product_id"));
			orderItems.setDeliveryTime(DeliveryTime.valueOf(itemObject.getString("delivery_time")));
			orderItems.setOrderStatus(OrderStatus.valueOf("Not_delivered"));
			orderItems.setUserId(createdBy);

			items.add(orderItems);
		}

		for (OrderedItems i : items) {
			System.out.println(i);
		}

		OrderService orderService = new OrderService();

		try {
			orderService.createNewOrder(order, items);

			ResponseEntity res = new ResponseEntity();
			res.setStatus(200);
			res.setMessage("success");

			Gson gson = new Gson();
			String resObject = gson.toJson(res);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(resObject);

		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}

	}

}
