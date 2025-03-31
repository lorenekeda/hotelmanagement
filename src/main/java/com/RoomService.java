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

        String sql = "SELECT * FROM relational_schema.room_damage " +
                "WHERE room_num=? AND hotel_id=? AND chain_id=?";


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

    public static List<Room> getRoomsForHotel(int chainID, int hotelID, String address, String ratingDetail, int rating, int price, String capacity, Date start, Date end, int minHotelSize) throws Exception {
        String sql = "SELECT relational_schema.room.* " +
                "FROM relational_schema.room NATURAL JOIN relational_schema.hotel " +
                "WHERE rating "+ratingDetail+" ? AND price < ? AND capacity = ? AND num_of_room >= ? AND hotel_id = ? AND chain_id = ?";
        if (!(address.equals("All"))){
            sql += " AND address = ? ";
        }


        sql += " EXCEPT " +
                "((SELECT relational_schema.room.* FROM relational_schema.booking NATURAL JOIN relational_schema.room WHERE NOT (booking_end_date<? OR booking_start_date>?)) " +
                "UNION " +
                "(SELECT relational_schema.room.* FROM relational_schema.renting NATURAL JOIN relational_schema.room WHERE NOT (end_date<? OR start_date>?)))";
        ConnectionDB db = new ConnectionDB();

        List<Room> rooms = new ArrayList<>();
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);

            int index = 1;
            stmt.setInt(index++, rating);
            stmt.setInt(index++, price);
            stmt.setString(index++, capacity);
            stmt.setInt(index++, minHotelSize);
            stmt.setInt(index++, hotelID);
            stmt.setInt(index++, chainID);


            if (!(address.equals("All"))){
                stmt.setString(index++, address);
            }



            stmt.setDate(index++, start);
            stmt.setDate(index++, end);
            stmt.setDate(index++, start);
            stmt.setDate(index++, end);

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

    public static boolean updateRoom(int hotelId, int chainId, boolean extendable, String view, String price, String roomNum, String capacity) throws Exception {
        String sql = "UPDATE relational_schema.room SET   extendable = ?, view = ?, price = ?, capacity = ? WHERE hotel_id = ? AND chain_id = ? AND room_num = ?;";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, String.valueOf(extendable));
            stmt.setString(2, view);
            stmt.setString(3, price);
            stmt.setInt(4, hotelId);
            stmt.setInt(5, chainId);
            stmt.setInt(6, Integer.parseInt(roomNum));
            stmt.setString(7, capacity);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Returns true if update was successful

        } catch (SQLException e) {
            throw new SQLException("Error updating room info: " + e.getMessage(), e);
        }

    }
    public static boolean deleteRoom(int hotelId, int chainId, String roomNum) throws SQLException {
        String sql = "DELETE FROM relational_schema.room " +
                "WHERE hotel_id = ? AND chain_id = ? AND room_num = ?";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);
            stmt.setInt(3, Integer.parseInt(roomNum));

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error deleting room: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static boolean createRoom(int hotelId, int chainId, boolean extendable, String view, String price, String roomNum, String capacity) throws SQLException {
        String sql = "INSERT INTO relational_schema.room (hotel_id, chain_id, extendable, view, price, room_num, capacity) VALUES (?, ?, ?, ?, ?, ?, ?);";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);
            stmt.setBoolean(3, extendable);
            stmt.setString(4, view);
            stmt.setInt(5, Integer.parseInt(price));
            stmt.setInt(6, Integer.parseInt(roomNum));
            stmt.setString(7, capacity);


            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error adding room info: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    // room amenity
    public static boolean updateRoomAmenity(int hotelId, int chainId, String roomNum, String amenity) throws Exception {
        String sql = "UPDATE relational_schema.room_amenity SET  amenity = ? WHERE hotel_id = ? AND chain_id = ? AND room_num = ?;";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, amenity);
            stmt.setInt(2, hotelId);
            stmt.setInt(3, chainId);
            stmt.setInt(4, Integer.parseInt(roomNum));


            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Returns true if update was successful

        } catch (SQLException e) {
            throw new SQLException("Error updating room amenity info: " + e.getMessage(), e);
        }

    }
    public static boolean deleteRoomAmenity(int hotelId, int chainId, String roomNum, String amenity) throws SQLException {
        String sql = "DELETE FROM relational_schema.room_amenity " +
                "WHERE hotel_id = ? AND chain_id = ? AND room_num = ? AND amenity = ?;";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);
            stmt.setInt(3, Integer.parseInt(roomNum));
            stmt.setString(4, amenity);


            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error deleting room amenity: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static boolean createRoomAmenity(int hotelId, int chainId,String roomNum, String amenity) throws SQLException {
        String sql = "INSERT INTO relational_schema.room_amenity (hotel_id, chain_id, room_num, amenity) VALUES (?, ?, ?, ?);";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);
            stmt.setInt(3, Integer.parseInt(roomNum));
            stmt.setString(4, amenity);


            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error adding room amenity info: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }


    //room damage

    public static boolean updateRoomDamage(int hotelId, int chainId, String roomNum, String damage) throws Exception {
        String sql = "UPDATE relational_schema.room_damage SET   damage = ? WHERE hotel_id = ? AND chain_id = ? AND room_num = ?;";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, damage);
            stmt.setInt(2, hotelId);
            stmt.setInt(3, chainId);
            stmt.setInt(4, Integer.parseInt(roomNum));


            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; // Returns true if update was successful

        } catch (SQLException e) {
            throw new SQLException("Error updating room damage info: " + e.getMessage(), e);
        }

    }
    public static boolean deleteRoomDamage(int hotelId, int chainId, String roomNum, String damage) throws SQLException {
        String sql = "DELETE FROM relational_schema.room_damage " +
                "WHERE hotel_id = ? AND chain_id = ? AND room_num = ? AND damage = ?;";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);
            stmt.setInt(3, Integer.parseInt(roomNum));
            stmt.setString(4, damage);

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error deleting room damage: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    public static boolean createRoomDamage(int hotelId, int chainId, String roomNum, String damage) throws SQLException {
        String sql = "INSERT INTO relational_schema.room_damage (hotel_id, chain_id, room_num, damage) VALUES (?, ?, ?, ?);";

        try (Connection con = new ConnectionDB().getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            stmt.setInt(2, chainId);
            stmt.setInt(3, Integer.parseInt(roomNum));
            stmt.setString(4, damage);


            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            throw new SQLException("Error adding room damage info: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }




}


