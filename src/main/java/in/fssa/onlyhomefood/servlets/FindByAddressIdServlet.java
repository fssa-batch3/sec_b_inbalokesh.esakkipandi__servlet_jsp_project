package in.fssa.onlyhomefood.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.onlyhomefood.exception.ServiceException;
import in.fssa.onlyhomefood.exception.ValidationException;
import in.fssa.onlyhomefood.model.Address;
import in.fssa.onlyhomefood.model.ResponseEntity;
import in.fssa.onlyhomefood.service.AddressService;

/**
 * Servlet implementation class FindByAddressIdServlet
 */
@WebServlet("/address/get")
public class FindByAddressIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AddressService addressService = new AddressService();
		int addressId = Integer.parseInt(request.getParameter("addressId"));
		
		try {
			Address address = addressService.findAddressById(addressId);
			
			ResponseEntity res = new ResponseEntity();
			res.setStatus(200);
			res.setData(address);
			res.setMessage("data fetched succesfully");
			
			Gson gson = new Gson();
			String resObject = gson.toJson(res);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(resObject);
			
			
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			String error = e.getMessage();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(error);
			
		}
	}


}
