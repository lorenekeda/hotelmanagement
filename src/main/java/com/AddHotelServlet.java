package com;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

@WebServlet("/addHotelServlet")
public class AddHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
        // Retrieve form parameters
        int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
        int chainId = Integer.parseInt(request.getParameter("chain_id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String rating = request.getParameter("rating");
        String numOfRoomStr = request.getParameter("num_of_room");

        try {
            // Convert numOfRoom from String to an Integer (for validation)
            int numOfRoom = Integer.parseInt(numOfRoomStr);

            // Call the updateHotel method
            boolean updateSuccess = HotelService.updateHotel(hotelId, chainId, address, name, rating, numOfRoomStr);

            if (updateSuccess) {
                request.setAttribute("message", "Hotel updated successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Hotel not found!");
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
        request.getRequestDispatcher("changehotel.jsp").forward(request, response);
    }
}
