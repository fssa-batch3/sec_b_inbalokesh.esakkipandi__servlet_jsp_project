package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.Address;
import in.fssa.onlyhomefood.model.User;
import in.fssa.onlyhomefood.service.AddressService;
import in.fssa.onlyhomefood.service.UserService;

/**
 * Servlet implementation class CreateAddressServlet
 */
@WebServlet("/address/create")
public class CreateAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AddressService addressService = new AddressService();

		UserService userService = new UserService();

		Address address = new Address();

		address.setName(request.getParameter("name"));
		address.setPhoneNumber(Long.parseLong(request.getParameter("mobile_number")));
		address.setLocation(request.getParameter("addressSearch"));
		address.setStreetName(request.getParameter("house_number"));
		address.setTownName(request.getParameter("town_name"));
		address.setCity(request.getParameter("city"));
		address.setState(request.getParameter("state"));
		address.setPinCode(Integer.parseInt(request.getParameter("pincode")));
		address.setDefaultStatus(Boolean.parseBoolean(request.getParameter("default_status")));
		System.out.println(address.getDefaultStatus());
		try {
			long phone_number = (Long) request.getSession().getAttribute("loggedNumber");

			User user = userService.findUserByPhoneNumber(phone_number);
			address.setUserId(user.getId());
			addressService.createNewAddress(address);
			
			response.sendRedirect(request.getContextPath() + "/address/book");

		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}

	}

}
