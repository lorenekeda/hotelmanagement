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
            stmt.setDate(1, end);
            stmt.setDate(2, start);
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

}


