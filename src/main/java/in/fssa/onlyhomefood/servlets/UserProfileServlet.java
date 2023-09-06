package in.fssa.onlyhomefood.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.User;
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
			long phone_number = (Long) request.getSession().getAttribute("loggedNumber");
			UserService userService = new UserService();
			
			User user = userService.findUserByPhoneNumber(phone_number);
			
			request.setAttribute("user", user);
			
			RequestDispatcher req = request.getRequestDispatcher("/profile.jsp");
			req.forward(request, response);
		} catch (ValidationException | ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
