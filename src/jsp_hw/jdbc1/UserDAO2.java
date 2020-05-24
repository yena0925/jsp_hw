package jsp_hw.jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jsp_hw.DB;
public class UserDAO2 {
	public static List<User> findAll() throws Exception {
		String sql = "SELECT s.*, d.departmentName " +
				"FROM user s LEFT JOIN department d ON s.departmentId = d.id";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			ArrayList<User> list = new ArrayList<User>();
			while (resultSet.next()) {
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setUserid(resultSet.getString("userid"));
				user.setPassword(resultSet.getString("password"));
				user.setName(resultSet.getString("name"));
				user.setEmail(resultSet.getString("email"));
				user.setDepartmentId(resultSet.getInt("departmentId"));
				user.setDepartmentName(resultSet.getString("departmentName"));
				user.setEnabled(resultSet.getBoolean("enabled"));
				user.setUserType(resultSet.getString("UserType"));
				list.add(user);
			}
			return list;
		}
	}

	
	public static List<User> findByName(String name) throws Exception {
		String sql = "SELECT s.*, d.departmentName " +
				"FROM user s LEFT JOIN department d ON s.departmentId = d.id " +
				"WHERE s.name LIKE ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, name+"%");
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<User> list = new ArrayList<User>();
				while (resultSet.next()) {
					User user = new User();
					user.setId(resultSet.getInt("id"));
					user.setUserid(resultSet.getString("userid"));
					user.setPassword(resultSet.getString("password"));
					user.setName(resultSet.getString("name"));
					user.setEmail(resultSet.getString("email"));
					user.setDepartmentId(resultSet.getInt("departmentId"));
					user.setDepartmentName(resultSet.getString("departmentName"));
					user.setEnabled(resultSet.getBoolean("enabled"));
					user.setUserType(resultSet.getString("UserType"));
					list.add(user);
				}
				return list;
			}

		}




	}
}
