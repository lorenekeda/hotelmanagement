package com;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RentingService {

    /**
     * Method to get all com.Renting from the database
     *
     * @return List of com.Renting from database
     * @throws Exception when trying to connect to database
     */
    public List<Renting> getRenting() throws Exception {

        String sql = "SELECT * FROM relational_schema.renting";

        ConnectionDB db = new ConnectionDB();

        List<Renting> rentings = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();


            while (rs.next()) {
                // create com.Booking object from result
                Renting renting = new Renting(
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getInt("room_num"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getString("customer_id"),
                        rs.getInt("employee_ssn")
                );

                rentings.add(renting);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return rentings;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public List<Renting> getRentingWithinRange(Date start, Date end) throws Exception {

        String sql = "SELECT * FROM relational_schema.renting WHERE NOT (end_date<? OR start_date>?);";

        ConnectionDB db = new ConnectionDB();

        List<Renting> rentings = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setDate(1, start);
            stmt.setDate(2, end);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // create com.Booking object from result
                Renting renting = new Renting(
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getInt("room_num"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getString("customer_id"),
                        rs.getInt("employee_ssn")
                );

                rentings.add(renting);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return rentings;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static void createRenting(Date start, Date end, Integer chainId, Integer hotelId, Integer roomNum, String customerId, Integer employeeSsn) throws Exception {
        String sql = "INSERT INTO relational_schema.renting (start_date, end_date, room_num, customer_id, employee_ssn, hotel_id, chain_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = new ConnectionDB().getConnection();

            PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setDate(1, start);
            stmt.setDate(2, end);
            stmt.setInt(3, roomNum);
            stmt.setString(4, customerId);
            stmt.setInt(5, employeeSsn);
            stmt.setInt(6, hotelId);
            stmt.setInt(7, chainId);

            stmt.executeUpdate();

        } catch (Exception e) {
            throw new Exception(e.getMessage(), e);
        }
    }

}


