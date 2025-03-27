package com;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

public class UpdateRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                // Redirect to success page or display success message
                response.sendRedirect("updateSuccess.jsp");
            } else {
                // Redirect to failure page
                response.sendRedirect("updateFail.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format (if numOfRoom is not an integer)
            request.setAttribute("errorMessage", "Invalid number format for Number of Rooms.");
            request.getRequestDispatcher("updateFail.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle database errors
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("updateFail.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle other errors
            request.setAttribute("errorMessage", "Unexpected error: " + e.getMessage());
            request.getRequestDispatcher("updateFail.jsp").forward(request, response);
        }
    }


}
