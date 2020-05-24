package lecture1.jdbc2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProfessorDAO {

    private static Professor getStudentFrom(ResultSet resultSet) throws SQLException {
        Professor professor = new Professor();
        professor.setId(resultSet.getInt("id"));
        professor.setProfessorName(resultSet.getString("professorName"));
        professor.setDepartmentName(resultSet.getString("departmentName"));
        return professor;
    }

    public static List<Professor> findAll() throws Exception {
        String sql = "SELECT p.*, d.departmentName" +
                     " FROM professor p LEFT JOIN department d ON p.departmentId = d.id";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            ArrayList<Professor> list = new ArrayList<Professor>();
            while (resultSet.next())
                list.add(getStudentFrom(resultSet)); 
            return list; 
        }
    }

    public static Professor findByProfessorName(String professorName) throws Exception {
        String sql = "SELECT p.*, d.departmentName" +
                     " FROM professor p LEFT JOIN department d ON p.departmentId = d.id" +
                     " WHERE p.professorName = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, professorName);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return getStudentFrom(resultSet);
                else
                    return null;
            }
        }
    }

    public static Professor findById(int id) throws Exception {
        String sql = "SELECT p.*, d.departmentName " +
                     " FROM professor s LEFT JOIN department d ON p.departmentId = d.id" +
                     " WHERE p.id = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return getStudentFrom(resultSet);
                else
                    return null;
            }
        }
    }

    public static void insert(Professor professor) throws Exception {
        String sql = "INSERT professor (id, professorName, departmentId)" +
                     " VALUES (?, ?, ?)";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
        	statement.setInt(1, professor.getId());
            statement.setString(2, professor.getProfessorName());
            statement.setInt(3, professor.getDepartmentId());
            statement.executeUpdate();
        }
    }

    public static void update(Professor professor) throws Exception {
        String sql = "UPDATE professor SET professorName=?, departmentId=? " +
                     " WHERE id = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, professor.getProfessorName());
            statement.setInt(2, professor.getDepartmentId());
            statement.setInt(3, professor.getId());
            statement.executeUpdate();
        }
    }
}