package com;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
@WebServlet("/createRenting")
public class RentingServlet extends HttpServlet  {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Date start = Date.valueOf(request.getParameter("start"));
        Date end = Date.valueOf(request.getParameter("end"));
        Integer chainId = Integer.parseInt(request.getParameter("cId"));
        Integer hotelId = Integer.parseInt(request.getParameter("hId"));
        Integer roomNum = Integer.parseInt(request.getParameter("rNum"));
        String customerId = request.getParameter("cusId");
        int empID = (int) session.getAttribute("user");
        int cardNum = (int) session.getAttribute("cardNum");


        //FIRST CREATE PAYMENT METHOD


        try {
            RentingService.createRenting(start, end, chainId, hotelId, roomNum, customerId, empID, cardNum);
            request.setAttribute("rentingMade", true);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.getRequestDispatcher("/rentaroom.jsp").forward(request, response);


    }


}

