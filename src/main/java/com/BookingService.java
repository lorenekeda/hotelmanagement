package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingService {

    /**
     * Method to get all com.Booking from the database
     *
     * @return List of com.Booking from database
     * @throws Exception when trying to connect to database
     */
    public List<Booking> getBooking() throws Exception {

        String sql = "SELECT * FROM relational_schema.booking";

        ConnectionDB db = new ConnectionDB();

        List<Booking> bookings = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();


            while (rs.next()) {
                // create com.Booking object from result
                Booking booking = new Booking(
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getInt("room_num"),
                        rs.getString("booking_start_date"),
                        rs.getString("booking_end_date"),
                        rs.getString("customer_id")
                );

                bookings.add(booking);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return bookings;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

}


