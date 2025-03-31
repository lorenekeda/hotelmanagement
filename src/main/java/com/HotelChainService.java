package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.Level;

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
     * Get Hotel Chain based on the chain ID.
     * @param chainNum
     * @return
     * @throws Exception
     */
    public static HotelChain getHotelChain(int chainNum) throws Exception{
        String sql = "SELECT * FROM relational_schema.hotel_chain WHERE chain_id = ?";

        ConnectionDB db = new ConnectionDB();

        Logger logger = Logger.getLogger(BookingService.class.getName());
        logger.info(("inside hotlechain"));
        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, chainNum);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                HotelChain chain = new HotelChain(
                        rs.getInt("chain_id"),
                        rs.getString("chain_name"),
                        rs.getInt("num_of_hotel")
                );
                logger.info("chain"+chain.getChainName());
                return chain;
            }




        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

    return null;
    }

    /**
     * Method to get average rating of HotelChains
     *
     * @return HashMap of HotelChain name and rating from database
     * @throws Exception when trying to connect to database
     */
    public HashMap<String, Double> getHotelChainAverageRating() throws Exception {

        String sql = "SELECT chain_name, avg(rating) as average FROM relational_schema.hotel_chain NATURAL JOIN relational_schema.hotel GROUP BY chain_name";

        ConnectionDB db = new ConnectionDB();

        HashMap<String, Double> info = new HashMap<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Double rate = Math.round(rs.getDouble("average") * 100.0) / 100.0;
                info.put(rs.getString("chain_name"), rate);
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

    /**
     * Method to get emails for given Chain from the database
     *
     * @return String listing the emails for a Chain
     * @throws Exception when trying to connect to database
     */
    public String getChainEmails(Integer chainId) throws Exception {

        String sql = "SELECT c_email FROM relational_schema.chain_email WHERE chain_id=?";


        ConnectionDB db = new ConnectionDB();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, chainId);
            ResultSet rs = stmt.executeQuery();

            String emails = "";

            while (rs.next()) {
                emails += rs.getString("c_email") + ", ";
            }

            if (emails.isEmpty()){
                emails = "N/A";
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return emails;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to get phone numbers for given Chain from the database
     *
     * @return String listing the phone numbers for a Chain
     * @throws Exception when trying to connect to database
     */
    public String getChainPhones(Integer chainId) throws Exception {

        String sql = "SELECT c_phone_number FROM relational_schema.chain_number WHERE chain_id=?";


        ConnectionDB db = new ConnectionDB();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, chainId);
            ResultSet rs = stmt.executeQuery();

            String phones = "";

            while (rs.next()) {
                phones += rs.getString("c_phone_number") + ", ";
            }

            if (phones.isEmpty()){
                phones = "N/A";
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return phones;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to get addresses for given Chain from the database
     *
     * @return String listing the addresses for a Chain
     * @throws Exception when trying to connect to database
     */
    public String getChainAddresses(Integer chainId) throws Exception {

        String sql = "SELECT c_address FROM relational_schema.chain_address WHERE chain_id=?";


        ConnectionDB db = new ConnectionDB();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, chainId);
            ResultSet rs = stmt.executeQuery();

            String addresses = "";

            while (rs.next()) {
                addresses += rs.getString("c_address") + ", ";
            }

            if (addresses.isEmpty()){
                addresses = "N/A";
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return addresses;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to get number of locations HotelChains have Hotels in
     *
     * @return HashMap of HotelChain name and number of locations from database
     * @throws Exception when trying to connect to database
     */
    public HashMap<String, Integer> getHotelChainLocationNumber() throws Exception {

        String sql = "SELECT chain_name, count(DISTINCT address) as amount FROM relational_schema.hotel_chain NATURAL JOIN relational_schema.hotel GROUP BY chain_name";

        ConnectionDB db = new ConnectionDB();

        HashMap<String, Integer> info = new HashMap<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                info.put(rs.getString("chain_name"), rs.getInt("amount"));
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

