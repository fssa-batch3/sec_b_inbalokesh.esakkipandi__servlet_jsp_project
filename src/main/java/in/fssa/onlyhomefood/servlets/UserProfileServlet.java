package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.Address;
import in.fssa.onlyhomefood.model.Order;
import in.fssa.onlyhomefood.model.OrderedItems;
import in.fssa.onlyhomefood.model.Product;
import in.fssa.onlyhomefood.model.ProductPrice;
import in.fssa.onlyhomefood.model.User;
import in.fssa.onlyhomefood.service.AddressService;
import in.fssa.onlyhomefood.service.OrderItemService;
import in.fssa.onlyhomefood.service.OrderService;
import in.fssa.onlyhomefood.service.ProductPriceService;
import in.fssa.onlyhomefood.service.ProductService;
import in.fssa.onlyhomefood.service.UserService;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			HttpSession session = request.getSession();

			long phone_number = (Long) session.getAttribute("loggedNumber");
			UserService userService = new UserService();
			User user = userService.findUserByPhoneNumber(phone_number);

			request.setAttribute("user", user);

			OrderService orderService = new OrderService();
			List<Order> orders = orderService.getAllUserOrders(user.getId());

			Gson gson = new Gson();
			String ordersList = gson.toJson(orders);

			session.setAttribute("orders", ordersList);

			OrderItemService orderItemService = new OrderItemService();
			List<OrderedItems> orderItems = orderItemService.getAllUserOrders(user.getId());

			String orderItemsList = gson.toJson(orderItems);

			session.setAttribute("orderItems", orderItemsList);

			AddressService addressService = new AddressService();
			List<Address> address = addressService.getAllUserAddresses(user.getId());

			String addressList = gson.toJson(address);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			session.setAttribute("addressList", addressList);

			ProductService productService = new ProductService();
			Set<Product> products = productService.getAllProducts();

			String productList = gson.toJson(products);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");

			session.setAttribute("productList", productList);

			ProductPriceService priceService = new ProductPriceService();
			Set<ProductPrice> prices = priceService.getAllProductPrice();

			String priceList = gson.toJson(prices);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			session.setAttribute("priceList", priceList);

			RequestDispatcher req = request.getRequestDispatcher("/profile.jsp");
			req.forward(request, response);

		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}

}
