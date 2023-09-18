package in.fssa.onlyhomefood.servlets;

import java.io.IOException;

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
import in.fssa.onlyhomefood.service.AddressService;

/**
 * Servlet implementation class EditAddressServlet
 */
@WebServlet("/address/edit")
public class EditAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		try {
			Address address = new AddressService().findAddressById(Integer.parseInt(request.getParameter("id")));
			
			Gson gson = new Gson();
			String addressJson = gson.toJson(address);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			request.setAttribute("address", addressJson);
			
			
			RequestDispatcher req = request.getRequestDispatcher("/address_form.jsp");
			req.forward(request, response);
		} catch (NumberFormatException | ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
	}

}
