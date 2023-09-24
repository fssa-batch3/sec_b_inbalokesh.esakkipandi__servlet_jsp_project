package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class UserCreateServlet
 */
@WebServlet("/user/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserService userService = new UserService();
		User user = new User();
		PrintWriter out = response.getWriter();
		user.setName(request.getParameter("user_name"));
		user.setEmail(request.getParameter("email"));
		user.setMobNumber(Long.parseLong(request.getParameter("phone_number")));
		user.setPassword(request.getParameter("password"));
		
		try {
			userService.createNewUser(user);
			out.print("User has been created sucessfully");
			
			response.sendRedirect(request.getContextPath()+"/login");
			
		} catch (ValidationException | ServiceException e) {
			String error = e.getMessage();
			if(error.contains("Duplicate")) {
				error = "Try with different mobile number";
			}
			request.setAttribute("user", user);
			
			RequestDispatcher req = request.getRequestDispatcher("/register.jsp?errorMessage=" + error);
			req.forward(request, response);		
		}
	}

}
