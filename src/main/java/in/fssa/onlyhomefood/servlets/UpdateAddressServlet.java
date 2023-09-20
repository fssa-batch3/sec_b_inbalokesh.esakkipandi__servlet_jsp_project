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
 * Servlet implementation class UpdateAddressServlet
 */
@WebServlet("/address/update")
public class UpdateAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		AddressService addressService = new AddressService();

		UserService userService = new UserService();

		Address editAddress = new Address();

		editAddress.setName(request.getParameter("name"));
		editAddress.setPhoneNumber(Long.parseLong(request.getParameter("mobile_number")));
		editAddress.setLocation(request.getParameter("addressSearch"));
		editAddress.setStreetName(request.getParameter("house_number"));
		editAddress.setTownName(request.getParameter("town_name"));
		editAddress.setCity(request.getParameter("city"));
		editAddress.setState(request.getParameter("state"));
		editAddress.setPinCode(Integer.parseInt(request.getParameter("pincode")));

		try {

			long phone_number = (Long) request.getSession().getAttribute("loggedNumber");

			User user = userService.findUserByPhoneNumber(phone_number);

			editAddress.setUserId(user.getId());

			addressService.updadeAddress(id, editAddress);

			response.sendRedirect(request.getContextPath() + "/address/book");

		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}

	}

}
