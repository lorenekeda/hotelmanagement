package com;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PaymentService {

    public static boolean checkSpecificPayment(Integer cardNumber) throws Exception {
        String sql = "SELECT * FROM relational_schema.payment WHERE card_number = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, cardNumber);
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                return false;
            }
            else {
                return true;
            }

        } catch (Exception e) {

            throw new Exception(e.getMessage());
        }
    }

    public static void createPayment(Integer cardNumber, Integer cvv, String expiryDate, String customerId) throws Exception {
        String sql = "INSERT INTO relational_schema.payment (card_number, cvv, expiry_date, customer_id) VALUES (?, ?, ?, ?)";

        try (Connection con = new ConnectionDB().getConnection();

            PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, cardNumber);
            stmt.setInt(2, cvv);
            stmt.setString(3, expiryDate);
            stmt.setString(4, customerId);

            stmt.executeUpdate();

        } catch (Exception e) {
            throw new Exception(e.getMessage(), e);
        }
    }
}
