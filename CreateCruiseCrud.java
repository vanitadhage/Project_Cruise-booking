package cruisebooking.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cruisebooking.dao.CreateCruise;

public class CreateCruiseCrud {
	
	UserDto dto = new UserDto();
	public int createCruise(CreateCruise createCruise) throws Exception {
		Connection connection = dto.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO createcruise(cruiseId, poiletId,"
				+ "fromLocation, toLocation, date, time, price) VALUES(?,?,?,?,?,?,?)");
		
		preparedStatement.setString(1, createCruise.getCruiseId());
		preparedStatement.setString(2, createCruise.getPoiletId());
		preparedStatement.setString(3, createCruise.getFromLocation());
		preparedStatement.setString(4, createCruise.getToLocation());
		preparedStatement.setString(5, createCruise.getDate());
		preparedStatement.setString(6, createCruise.getTime());
		preparedStatement.setDouble(7, createCruise.getPrice());
		
		int count = preparedStatement.executeUpdate();
		connection.close();
		return count;		
	}
	
	public List<CreateCruise> getAllCruiseInfo() throws Exception {
		Connection connection = dto.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM createcruise");
		List<CreateCruise> list = new ArrayList<CreateCruise>();
		ResultSet resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()) {
			CreateCruise createCruise = new CreateCruise();
			createCruise.setCruiseId(resultSet.getString("cruiseId"));
			createCruise.setPoiletId(resultSet.getString("poiletId"));
			createCruise.setFromLocation(resultSet.getString("fromLocation"));
			createCruise.setToLocation(resultSet.getString("toLocation"));
			createCruise.setDate(resultSet.getString("date"));
			createCruise.setTime(resultSet.getString("time"));
			createCruise.setPrice(resultSet.getDouble("price"));
			list.add(createCruise);
		}
		preparedStatement.close();
		connection.close();
		return list;
	}

}
