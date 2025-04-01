package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

public class ViewService {
    public HashMap<String, Integer> getHotelRoomCapacity() throws Exception {

        String sql = "SELECT * FROM relational_schema.hotel_room_capacity";

        ConnectionDB db = new ConnectionDB();

        HashMap<String, Integer> info = new HashMap<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                info.put(rs.getInt("hotel_id")+"-"+rs.getInt("chain_id"), rs.getInt("total_rooms"));
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return info;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public HashMap<String, Integer> getAddressRooms() throws Exception {

        String sql = "SELECT * FROM relational_schema.rooms_per_area";

        ConnectionDB db = new ConnectionDB();

        HashMap<String, Integer> info = new HashMap<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                info.put(rs.getString("address"), rs.getInt("num_of_rooms"));
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return info;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}
