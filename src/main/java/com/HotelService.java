package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HotelService {

    /**
     * Method to get all com.Hotel from the database
     *
     * @return List of com.Hotel from database
     * @throws Exception when trying to connect to database
     */
    public List<Hotel> getHotel() throws Exception {

        String sql = "SELECT * FROM relational_schema.hotel";

        ConnectionDB db = new ConnectionDB();

        List<Hotel> hotels = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();




            while (rs.next()) {
                // create com.Hotel object from result
                Hotel hotel = new Hotel(
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getInt("rating"),
                        rs.getInt("num_of_room")
                );

                hotels.add(hotel);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return hotels;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }


    /**
     * Method to get all locations that have a Hotel from the database
     *
     * @return List of locations
     * @throws Exception when trying to connect to database
     */
    public List<String> getLocations() throws Exception {

        String sql = "SELECT DISTINCT address FROM relational_schema.hotel ORDER BY address";

        ConnectionDB db = new ConnectionDB();

        List<String> locations = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                locations.add(rs.getString("address"));
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return locations;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
    public static boolean updateHotel(int hotelId, int chainId, String address, String name, int rating, int numOfRoom) throws Exception {
        String sql = "UPDATE relational_schema.hotel SET   address = ?, name = ?, rating = ?, num_of_room = ? WHERE hotel_id = ? AND chain_id = ?;";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, address);
            stmt.setString(2, name);
            stmt.setInt(3, rating);
            stmt.setInt(4, numOfRoom);
            stmt.setInt(5, hotelId);
            stmt.setInt(6, chainId);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Returns true if update was successful

        } catch (SQLException e) {
            throw new SQLException("Error updating hotel info: " + e.getMessage(), e);
        }

    }
    public static boolean deleteHotel(int hotelId, int chainId) throws SQLException {
        String sql = "DELETE FROM relational_schema.hotel " +
                "WHERE hotel_id = ? AND chain_id = ? ";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error deleting hotel: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static boolean createHotel(int hotelId, int chainId, String address, String name, int rating, int numOfRoom) throws SQLException {
        String sql = "INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (?, ?, ?, ?, ?, ?);";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);
            stmt.setString(3, address);
            stmt.setString(4, name);
            stmt.setInt(5, rating);
            stmt.setInt(6, numOfRoom);


            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error adding hotel info: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

}


