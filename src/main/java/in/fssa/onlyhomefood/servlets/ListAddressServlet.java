package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.Address;
import in.fssa.onlyhomefood.model.User;
import in.fssa.onlyhomefood.service.AddressService;
import in.fssa.onlyhomefood.service.UserService;

/**
 * Servlet implementation class ListAddressServlet
 */
@WebServlet("/address/book")
public class ListAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = null;
		try {
			long phone_number = (Long) request.getSession().getAttribute("loggedNumber");
			UserService userService = new UserService();
			user = userService.findUserByPhoneNumber(phone_number);
			request.setAttribute("user", user);
			
			AddressService addressService = new AddressService();
			List<Address> address = addressService.getAllUserAddress(user.getId());
			
			Gson gson = new Gson();
			String addressList = gson.toJson(address);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			request.setAttribute("addressList", addressList);
			
			RequestDispatcher req = request.getRequestDispatcher("/list_user_address.jsp");
			req.forward(request, response);
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
	
	}

}
