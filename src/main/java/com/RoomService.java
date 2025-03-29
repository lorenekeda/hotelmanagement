package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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


        String sql = "SELECT relational_schema.room.* FROM relational_schema.room NATURAL JOIN relational_schema.hotel NATURAL JOIN relational_schema.hotel_chain WHERE rating = ? AND price < ? AND capacity = ?";

        if (!(address.equals("All"))){
            sql += "AND address = "+address;
        }
        if (!(chainName.equals("All"))){
            sql += "AND chain_name = "+chainName;
        }

        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1, rating);
            stmt.setInt(2, price);
            stmt.setString(3, capacity);

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

    public static boolean updateRoom(int hotelId, int chainId, boolean extendable, String view, String price, String roomNum) throws Exception {
        String sql = "UPDATE relational_schema.hotel SET   extendable = ?, view = ?, price = ? WHERE hotel_id = ? AND chain_id = ? AND room_num = ?;";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, String.valueOf(extendable));
            stmt.setString(2, view);
            stmt.setString(3, price);
            stmt.setInt(4, hotelId);
            stmt.setInt(5, chainId);
            stmt.setInt(6, Integer.parseInt(roomNum));

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Returns true if update was successful

        } catch (SQLException e) {
            throw new SQLException("Error updating room info: " + e.getMessage(), e);
        }

    }




}


