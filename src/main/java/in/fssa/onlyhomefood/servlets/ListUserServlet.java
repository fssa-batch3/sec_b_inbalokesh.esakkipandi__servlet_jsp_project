package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.model.User;
import in.fssa.onlyhomefood.service.UserService;

/**
 * Servlet implementation class ListUserServlet
 */
@WebServlet("/users")
public class ListUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserService userService = new UserService();
		
		PrintWriter out = response.getWriter();
		try {
			Set<User> users = userService.getAllUsers();
			
			request.setAttribute("list_users", users);
			
			RequestDispatcher rd = request.getRequestDispatcher("/list_all_users.jsp");
			rd.forward(request, response);

		} catch (ServiceException e) {
			e.printStackTrace();
			out.print(e.getMessage());
		}
	}

}
