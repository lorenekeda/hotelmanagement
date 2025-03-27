package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class HotelChainService {

    /**
     * Method to get all com.HotelChain from the database
     *
     * @return List of com.HotelChain from database
     * @throws Exception when trying to connect to database
     */
    public List<HotelChain> getHotelChain() throws Exception {

        String sql = "SELECT * FROM relational_schema.hotel_chain";

        ConnectionDB db = new ConnectionDB();

        List<HotelChain> chains = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // create com.HotelChain object from result
                HotelChain chain = new HotelChain(
                        rs.getInt("chain_id"),
                        rs.getString("chain_name"),
                        rs.getInt("num_of_hotel")
                );

                chains.add(chain);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return chains;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to get average rating of HotelChains
     *
     * @return HashMap of HotelChain name and rating from database
     * @throws Exception when trying to connect to database
     */
    public HashMap<Integer, Double> getHotelChainAverageRating() throws Exception {

        String sql = "SELECT chain_name, avg(rating) as average FROM relational_schema.hotel_chain NATURAL JOIN relational_schema.hotel GROUP BY chain_name";

        ConnectionDB db = new ConnectionDB();

        HashMap<Integer, Double> info = new HashMap<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                info.put(rs.getInt("chain_id"), rs.getDouble("average"));
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

