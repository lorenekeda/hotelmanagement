package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomService {

    /**
     * Method to get all com.Room from the database
     *
     * @return List of com.Room from database
     * @throws Exception when trying to connect to database
     */
    public List<Room> getRoom() throws Exception {

        String sql = "SELECT * FROM relational_schema.room";

        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();


            while (rs.next()) {
                // create com.Room object from result
                Room room = new Room(
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getInt("room_num"),
                        rs.getString("view"),
                        rs.getBoolean("extendable"),
                        rs.getInt("price"),
                        rs.getString("capacity")
                );

                rooms.add(room);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return rooms;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to get all com.Room from the database
     *
     * @return List of com.Room from database
     * @throws Exception when trying to connect to database
     */
    public static List<Room> getFilteredRooms(String chainName, String address, int rating, int price, String capacity) throws Exception {

        String sql = "SELECT relational_schema.room.* FROM relational_schema.room NATURAL JOIN relational_schema.hotel NATURAL JOIN relational_schema.hotel_chain WHERE name = ? AND address = ? AND rating = ? AND price < ? AND capacity = ?";

        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, chainName);
            stmt.setString(2, address);
            stmt.setInt(3, rating);
            stmt.setInt(4, price);
            stmt.setString(5, capacity);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // create com.Room object from result
                Room room = new Room(
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getInt("room_num"),
                        rs.getString("view"),
                        rs.getBoolean("extendable"),
                        rs.getInt("price"),
                        rs.getString("capacity")
                );

                rooms.add(room);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return rooms;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public static boolean updateRoom(Room room) throws Exception {
        return false; //placeholder
    }

}


