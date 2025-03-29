package com;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Date;
import java.util.List;

@WebServlet("/filterRoomServlet")
public class FilterRoomServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            String chain = request.getParameter("Chain");
            String location = request.getParameter("Area");
            String capacity = request.getParameter("Capacity");
            String num = request.getParameter("Price");
            Date start = Date.valueOf(request.getParameter("StartDate"));
            Date end = Date.valueOf(request.getParameter("EndDate"));

            int price = 0;
            if (!(num.isEmpty())) {
                price = Integer.parseInt(num);
            }
            int rating = Integer.parseInt(request.getParameter("Rating"));

            List<Room> filteredRooms = RoomService.getFilteredRooms(chain, location, rating, price, capacity, start, end);

            request.setAttribute("filteredRooms", filteredRooms);
            request.setAttribute("start", start);
            request.setAttribute("end", end);
            request.getRequestDispatcher("/bookaroom.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
        }
    }
}

