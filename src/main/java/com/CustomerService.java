package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {

    /**
     * Method to get all com.Customer from the database
     *
     * @return List of com.Customer from database
     * @throws Exception when trying to connect to database
     */
    public static List<Customer> getCustomer() throws Exception {

        String sql = "SELECT * FROM relational_schema.customer";

        ConnectionDB db = new ConnectionDB();

        List<Customer> customers = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

           
            while (rs.next()) {
                // create com.Room object from result
                Customer customer = new Customer(
                        rs.getString("customer_id"),
                        rs.getString("registration_date"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("id_type"),
                        rs.getString("address"),
                        rs.getString("password")
                );

                customers.add(customer);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return customers;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Checks if a specific customer already exists using their customer id (their email) (for creating an account).
     * @param emailId
     * @return
     * @throws Exception
     */
    public static boolean checkSpecificCustomer(String emailId) throws Exception {
        String sql = "SELECT * FROM relational_schema.customer WHERE customer_id = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, emailId);
            ResultSet rs = stmt.executeQuery();

            // if there is no next that means it does not exist
            if (!rs.next()) {
                return false;
            }
            else {
                return true;
            }

        } catch (Exception e) {

            throw new Exception(e.getMessage());
        }
    }

    /**
     * Check if a customer exists in the database using their email and password (for logging in)
     * @param emailId
     * @param password
     * @return
     * @throws Exception
     */
    public static boolean checkSpecificCustomerWithPassword(String emailId, String password) throws Exception {
        String sql = "SELECT * FROM relational_schema.customer WHERE customer_id = ? AND password = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, emailId);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            // if there is no next that means it does not exist
            if (!rs.next()) {
                return false;
            }
            else {
                return true;
            }

        } catch (Exception e) {

            throw new Exception(e.getMessage());
        }
    }


    /**
     * Creates a new customer account and puts it in the database.
     * @param id
     * @param registrationDate
     * @param firstName
     * @param lastName
     * @param idType
     * @param address
     * @param password
     * @return
     * @throws Exception
     */
    public static boolean createCustomer(String id, String registrationDate, String firstName, String lastName, String idType, String address, String password) throws Exception {
      //  Customer newCustomer = new Customer(registrationDate, firstName, lastName, idType, address);
        String sql = "INSERT INTO relational_schema.customer (customer_id, registration_date, first_name, last_name, id_type, address, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, registrationDate);
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);
            stmt.setString(5, idType);
            stmt.setString(6, address);
            stmt.setString(7, password);
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            // If insertion is successful, return true
            return rowsAffected > 0;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

    }

    public static boolean updateCustomer(String customerId, String firstName, String lastName, String idType, String address) throws Exception {
        String sql = "UPDATE relational_schema.customer SET first_name = ?, last_name = ?, id_type = ?,  address = ? WHERE customer_id = ?";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, idType);

            stmt.setString(4, address);
            stmt.setString(5, customerId);


            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Returns true if update was successful

        } catch (SQLException e) {
            throw new SQLException("Error updating customer info: " + e.getMessage(), e);
        }
    }
    public static boolean deleteCustomer(String customerId) throws Exception {
        // Input validation
        if (customerId == null || customerId.trim().isEmpty()) {
            throw new IllegalArgumentException("Customer ID cannot be null or empty");
        }

        String sql = "DELETE FROM relational_schema.customer WHERE customer_id = ?";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, customerId);

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0; // Returns true if deletion was successful

        } catch (SQLException e) {
            throw new Exception("Error deleting customer with ID: " + customerId, e);
        }
    }
    }





