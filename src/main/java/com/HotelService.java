package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

}


