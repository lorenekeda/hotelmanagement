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
                        rs.getString("position"),
                        rs.getString("password")
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

    /**
     * Check if an employee exists in the databse using their SSN and password and return the employee.
     * @param empSSN
     * @param password
     * @return
     * @throws Exception
     */
    public static Employee checkSpecificEmployeeWithPassword(int empSSN, String password) throws Exception {
        String sql = "SELECT * FROM relational_schema.employee WHERE employee_ssn = ? AND password = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, empSSN);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            // if there is no next that means it does not exist
            if (!rs.next()) {
                return null;
            }
            else {
                Employee emp = new Employee(
                        rs.getInt("employee_ssn"),
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("address"),
                        rs.getString("position"),
                        rs.getString("password")
                );
                return emp;
            }

        } catch (Exception e) {

            throw new Exception(e.getMessage());
        }

    }

    public static boolean deleteEmployee(int hotelId, int chainId, int employeeSsn) throws SQLException {
        String sql = "DELETE FROM relational_schema.employee " +
                "WHERE hotel_id = ? AND chain_id = ? AND employee_ssn = ?";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);
            stmt.setInt(3, employeeSsn);

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error deleting employee: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean createEmployee(String address, String firstName, String lastName, String position, int hotelId, int chainId, int employeeSsn, String password) throws SQLException {
        String sql = "INSERT INTO relational_schema.employee (address, first_name, last_name, position, hotel_id, chain_id, employee_ssn, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, address);
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            stmt.setString(4, position);
            stmt.setInt(5, hotelId);
            stmt.setInt(6, chainId);
            stmt.setInt(7, employeeSsn);
            stmt.setString(8, password);

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error adding employee info: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

}
