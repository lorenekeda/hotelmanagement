package com;

import java.sql.*;
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

    /**
     * Method to get all Booking that overlap or fall into a date range from the database
     *
     * @return List of com.Booking from database
     * @throws Exception when trying to connect to database
     */
    public List<Booking> getBookingWithinRange(Date start, Date end) throws Exception {

        String sql = "SELECT * FROM relational_schema.booking WHERE NOT (booking_end_date<? OR booking_start_date>?);";

        ConnectionDB db = new ConnectionDB();

        List<Booking> bookings = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setDate(1, start);
            stmt.setDate(2, end);
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

    /**
     * Method to get all Booking that belong to a Customer
     *
     * @return List of com.Booking from database
     * @throws Exception when trying to connect to database
     */
    public List<Booking> getCustomerBooking(String customerId) throws Exception {

        String sql = "SELECT * FROM relational_schema.booking WHERE customer_id = ?";

        ConnectionDB db = new ConnectionDB();

        List<Booking> bookings = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, customerId);
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

    /**
     * Method to get all Booking with no matching Renting
     *
     * @return List of com.Booking from database
     * @throws Exception when trying to connect to database
     */
    public List<Booking> getBookingWithoutRenting() throws Exception {

        String sql = "SELECT * FROM relational_schema.booking " +
                        "EXCEPT (" +
                        "SELECT start_date as booking_start_date, end_date as booking_end_date, room_num, customer_id, hotel_id, chain_id " +
                        "FROM relational_schema.renting)";

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

    public static void createBooking(Date start, Date end, Integer chainId, Integer hotelId, Integer roomNum, String customerId) throws Exception {
        String sql = "INSERT INTO relational_schema.booking (booking_start_date, booking_end_date, room_num, customer_id, hotel_id, chain_id) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = new ConnectionDB().getConnection();

            PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setDate(1, start);
            stmt.setDate(2, end);
            stmt.setInt(3, roomNum);
            stmt.setString(4, customerId);
            stmt.setInt(5, hotelId);
            stmt.setInt(6, chainId);

            stmt.executeUpdate();

        } catch (Exception e) {
            throw new Exception(e.getMessage(), e);
        }
    }

}


