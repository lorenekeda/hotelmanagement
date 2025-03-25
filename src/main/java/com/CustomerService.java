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
    public List<Customer> getCustomer() throws Exception {

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
                        rs.getString("address")
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
    public static boolean updateCustomer(String customerId, String firstName, String lastName, String email, String phone, String address) throws Exception {
        String sql = "UPDATE relational_schema.customer SET first_name = ?, last_name = ?, email = ?, phone = ?, address = ? WHERE customer_id = ?";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, phone);
            stmt.setString(5, address);
            stmt.setString(6, customerId);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Returns true if update was successful

        } catch (SQLException e) {
            throw new SQLException("Error updating customer info: " + e.getMessage(), e);
        }
    }
    }





