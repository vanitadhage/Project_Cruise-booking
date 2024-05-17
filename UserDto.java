package cruisebooking.dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import cruisebooking.dao.UserDao;

public class UserDto {
	
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cruisebooking", "root", "root");
		return connection;
	}
	
	public int userRegister(UserDao dao) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO userregistration(fullName, date, email, phone, gender, occupation, idType,"
				+ "idNumber, issuedState, address, nationality, state, district, houseNumber, laneNumber, password, confirmPassword) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		preparedStatement.setString(1, dao.getFullName());
		preparedStatement.setString(2, dao.getDate());
		preparedStatement.setString(3, dao.getEmail());
		preparedStatement.setLong(4, dao.getPhone());
		preparedStatement.setString(5, dao.getGender());
		preparedStatement.setString(6, dao.getOccupation());
		preparedStatement.setString(7, dao.getIdType());
		preparedStatement.setString(8, dao.getIdNumber());
		preparedStatement.setString(9, dao.getIssuedState());
		preparedStatement.setString(10, dao.getAddress());
		preparedStatement.setString(11, dao.getNationality());
		preparedStatement.setString(12, dao.getState());
		preparedStatement.setString(13, dao.getDistrict());
		preparedStatement.setInt(14, dao.getHouseNumber());
		preparedStatement.setString(15, dao.getLaneNumber());
		preparedStatement.setString(16, dao.getPassword());
		preparedStatement.setString(17, dao.getConfirmPassword());
		
		int count = preparedStatement.executeUpdate();
		connection.close();
		return count;
	}
	
	public UserDao userLogin(String email) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM userregistration WHERE email = ?");
		preparedStatement.setString(1, email);
		
		ResultSet resultset = preparedStatement.executeQuery();
		UserDao dao = new UserDao();
		while(resultset.next()) {
			dao.setPassword(resultset.getString("password"));
			dao.setEmail(resultset.getString("email"));
		}
		connection.close();
		return dao;	
	}

	public UserDao userPresent(String idNumber) throws Exception {
		Connection connection = getConnection();
		PreparedStatement preparedStatement= connection.prepareStatement("SELECT * FROM userregistration WHERE idNumber = ?");
		preparedStatement.setString(1, idNumber);
		ResultSet resultSet = preparedStatement.executeQuery();
		UserDao userpresent = new UserDao();
		if(resultSet.next()) {
			userpresent.setIdNumber(idNumber);
		}
		preparedStatement.close();
		return userpresent;	
	}
	

}
