package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ManagerService {

    public static Manager checkSpecificManager(int empSSN) throws Exception {
        String sql = "SELECT * FROM relational_schema.manager WHERE ssn = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, empSSN);

            ResultSet rs = stmt.executeQuery();

            // if there is no next that means it does not exist
            if (!rs.next()) {
                return null;
            }
            else {
                Manager emp = new Manager(
                        rs.getInt("ssn"),
                        rs.getString("position"),
                        rs.getInt("hotel_id"),
                        rs.getInt("chain_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("address")
                );
                return emp;
            }

        } catch (Exception e) {

            throw new Exception(e.getMessage());
        }

    }






}
