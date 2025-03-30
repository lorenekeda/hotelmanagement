package com;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

@WebServlet("/deleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
            int chainId = Integer.parseInt(request.getParameter("chain_id"));
            String roomNum = request.getParameter("room_num");

            boolean isDeleted = RoomService.deleteRoom(hotelId, chainId, roomNum);

            if (isDeleted) {
                request.setAttribute("message", "Room deleted successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Room not found!");
                request.setAttribute("messageType", "error");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid ID format!");
            request.setAttribute("messageType", "error");
        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        // Forward back to the HTML page
        request.getRequestDispatcher("/deleteroom.jsp").forward(request, response);
    }
}
