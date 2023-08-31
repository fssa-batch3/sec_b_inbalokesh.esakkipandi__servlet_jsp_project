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
 * Servlet implementation class ViewUserServlet
 */
@WebServlet("/user/profile")
public class ViewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			User user = new UserService().findUserById(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("users", user);
			
			RequestDispatcher req = request.getRequestDispatcher("/view_user.jsp");
			req.forward(request, response);
			
		} catch (NumberFormatException | ValidationException | ServiceException e) {
			e.printStackTrace();
		}
	}

}
