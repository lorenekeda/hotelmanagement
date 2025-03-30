package com;

import java.sql.*;
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
     * Method to get amenities for given Room from the database
     *
     * @return String listing the amenities a Room
     * @throws Exception when trying to connect to database
     */
    public String getRoomAmenities(Integer roomNum, Integer hotelId, Integer chainId) throws Exception {

        String sql = "SELECT * FROM relational_schema.room_amenity WHERE room_num=? AND hotel_id=? AND chain_id=?";

        ConnectionDB db = new ConnectionDB();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, roomNum);
            stmt.setInt(2, hotelId);
            stmt.setInt(3, chainId);

            ResultSet rs = stmt.executeQuery();

            String amenities = "";

            while (rs.next()) {
                amenities += rs.getString("amenity") + ", ";
            }

            if (amenities.isEmpty()){
                amenities = "none";
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return amenities;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to get damages for given Room from the database
     *
     * @return String listing the damages a Room
     * @throws Exception when trying to connect to database
     */
    public String getRoomDamages(Integer roomNum, Integer hotelId, Integer chainId) throws Exception {

        String sql = "SELECT * FROM relational_schema.room_damage WHERE room_num=? AND hotel_id=? AND chain_id=?";

        ConnectionDB db = new ConnectionDB();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, roomNum);
            stmt.setInt(2, hotelId);
            stmt.setInt(3, chainId);

            ResultSet rs = stmt.executeQuery();

            String damages = "";

            while (rs.next()) {
                damages += rs.getString("damage") + ", ";
            }

            if (damages.isEmpty()){
                damages = "none";
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return damages;

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
    public static List<Room> getFilteredRooms(String chainName, String address, String ratingDetail, int rating, int price, String capacity, Date start, Date end, int minHotelSize) throws Exception {

        String sql = "SELECT relational_schema.room.* " +
                        "FROM relational_schema.room NATURAL JOIN relational_schema.hotel NATURAL JOIN relational_schema.hotel_chain " +
                        "WHERE rating "+ratingDetail+" ? AND price < ? AND capacity = ? AND num_of_room >= ? ";

        if (!(address.equals("All"))){
            sql += " AND address = ? ";
        }
        if (!(chainName.equals("All"))){
            sql += " AND chain_name = ? ";
        }

         sql += " EXCEPT " +
                        "((SELECT relational_schema.room.* FROM relational_schema.booking NATURAL JOIN relational_schema.room WHERE NOT (booking_end_date<? OR booking_start_date>?)) " +
                        "UNION " +
                        "(SELECT relational_schema.room.* FROM relational_schema.renting NATURAL JOIN relational_schema.room WHERE NOT (end_date<? OR start_date>?)))";


        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);

            int index = 1;
            stmt.setInt(index++, rating);
            stmt.setInt(index++, price);
            stmt.setString(index++, capacity);
            stmt.setInt(index++, minHotelSize);

            if (!(address.equals("All"))){
                stmt.setString(index++, address);
            }

            if (!(chainName.equals("All"))) {
                stmt.setString(index++, chainName);
            }

            stmt.setDate(index++, start);
            stmt.setDate(index++, end);
            stmt.setDate(index++, start);
            stmt.setDate(index++, end);

            System.out.println(stmt);

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
        String sql = "UPDATE relational_schema.room SET   extendable = ?, view = ?, price = ? WHERE hotel_id = ? AND chain_id = ? AND room_num = ?;";

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


