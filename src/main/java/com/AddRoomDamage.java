package com;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

@WebServlet("/addRoomDamage")
public class AddRoomDamage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
        int chainId = Integer.parseInt(request.getParameter("chain_id"));
        String roomNum = request.getParameter("room_num");
        String damage = request.getParameter("damage");

        try {


            // Call the updateHotel method
            boolean addSuccess = RoomService.createRoomDamage(hotelId, chainId, roomNum, damage);

            if (addSuccess) {
                request.setAttribute("message", "Room Damage added successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Room Damage not created!");
                request.setAttribute("messageType", "error");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid ID format!");
            request.setAttribute("messageType", "error");
        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (Exception e) {
            request.setAttribute("message", "Unexpected error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        // Forward back to the form page
        request.getRequestDispatcher("createdamage.jsp").forward(request, response);
    }
}
