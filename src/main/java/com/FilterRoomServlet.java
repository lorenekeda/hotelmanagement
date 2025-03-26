package com;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

@WebServlet("/filterRoomServlet")
public class FilterRoomServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            String capacity = request.getParameter("Capacity");
            int price = Integer.parseInt(request.getParameter("Price"));

            List<Room> filteredRooms = RoomService.getFilteredRooms(price, capacity);

            request.setAttribute("filteredRooms", filteredRooms);
            request.getRequestDispatcher("/bookaroom.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Unexpected error: " + e.getMessage());
        }
    }
}

