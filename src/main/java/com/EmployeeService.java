package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {

    /**
     * Method to get all com.Employee from the database
     *
     * @return List of com.Employee from database
     * @throws Exception when trying to connect to database
     */
    public List<Employee> getEmployee() throws Exception {

        String sql = "SELECT * FROM relational_schema.employee";

        ConnectionDB db = new ConnectionDB();

        List<Employee> employees = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();


            while (rs.next()) {
                // create com.Employee object from result
                Employee employee = new Employee(
                        rs.getInt("employee_ssn"),
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("address"),
                        rs.getString("position")
                );

                employees.add(employee);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return employees;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
    public static boolean updateEmployee(String address, String firstName, String lastName, String position, int hotelId, int chainId, int employeeSsn) throws Exception {
        String sql = "UPDATE relational_schema.employee SET   address = ?, first_name = ?, last_name = ?, position = ? WHERE hotel_id = ? AND chain_id = ? AND employee_ssn = ?;";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, address);
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            stmt.setString(4, position);
            stmt.setInt(5, hotelId);
            stmt.setInt(6, chainId);
            stmt.setInt(7, employeeSsn);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Returns true if update was successful

        } catch (SQLException e) {
            throw new SQLException("Error updating employee info: " + e.getMessage(), e);
        }
    }

}
