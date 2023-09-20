package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.User;
import in.fssa.onlyhomefood.service.AddressService;
import in.fssa.onlyhomefood.service.UserService;

/**
 * Servlet implementation class UpdateDefaultStatusServlet
 */
@WebServlet("/address/status")
public class UpdateDefaultStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int addressId = Integer.parseInt(request.getParameter("address_id"));

		AddressService addressService = new AddressService();

		UserService userService = new UserService();

		try {
			long phone_number = (Long) request.getSession().getAttribute("loggedNumber");

			User user = userService.findUserByPhoneNumber(phone_number);

			addressService.setAsDefault(addressId, user.getId());

		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}

	}

}
