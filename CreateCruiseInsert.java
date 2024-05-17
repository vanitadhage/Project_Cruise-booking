package cruisebooking.controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cruisebooking.dao.CreateCruise;
import cruisebooking.dto.CreateCruiseCrud;

@WebServlet("/createcruise")
public class CreateCruiseInsert extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cruiseId = req.getParameter("cruiseId");
		String poiletId = req.getParameter("poiletId");
		String fromLocation = req.getParameter("fromLocation");
		String toLocation = req.getParameter("toLocation");
		String date = req.getParameter("date");
		String time = req.getParameter("time");
		double price = Double.parseDouble(req.getParameter("price"));
		
		CreateCruise createCruise = new CreateCruise();
		
		createCruise.setCruiseId(cruiseId);
		createCruise.setPoiletId(poiletId);
		createCruise.setFromLocation(fromLocation);
		createCruise.setToLocation(toLocation);
		createCruise.setDate(date);
		createCruise.setTime(time);
		createCruise.setPrice(price);
		
		RequestDispatcher dispatcher;
		try {
			CreateCruiseCrud createCruiseCrud = new CreateCruiseCrud();
			int count = createCruiseCrud.createCruise(createCruise);
			if(count > 0) {
				dispatcher = req.getRequestDispatcher("createcruise.jsp");
				req.setAttribute("message", "Cruise Created");
			}else {
				dispatcher = req.getRequestDispatcher("createcruise.jsp");
				req.setAttribute("message", "Cruise not Created");
			}
			dispatcher.forward(req, resp);
		}catch(Exception exception) {
			exception.printStackTrace();
		}
	}
}
