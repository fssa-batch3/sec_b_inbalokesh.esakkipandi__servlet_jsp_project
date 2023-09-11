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
import in.fssa.onlyhomefood.model.User;
import in.fssa.onlyhomefood.service.UserService;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/user/update")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		UserService userService = new UserService();
		User user = new User();
		PrintWriter out = response.getWriter();
		
		user.setName(request.getParameter("user_name"));
		user.setMobNumber(Long.parseLong(request.getParameter("phone_number")));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		
		try {
			userService.updateUser(id, user);
			out.print("User has been updated sucessfully");
			
			response.sendRedirect(request.getContextPath()+"/profile");
			
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
		
	}

}
