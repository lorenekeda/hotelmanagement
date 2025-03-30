package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;


@WebServlet("/createBooking")
public class BookingServlet extends HttpServlet  {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Date start = Date.valueOf(request.getParameter("start"));
        Date end = Date.valueOf(request.getParameter("end"));
        Integer chainId = Integer.parseInt(request.getParameter("cId"));
        Integer hotelId = Integer.parseInt(request.getParameter("hId"));
        Integer roomNum = Integer.parseInt(request.getParameter("rNum"));
        String customerId = request.getParameter("custId");

        try {
            BookingService.createBooking(start, end, chainId, hotelId, roomNum, customerId);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.getRequestDispatcher("/bookaroom.jsp").forward(request, response);


    }


}
