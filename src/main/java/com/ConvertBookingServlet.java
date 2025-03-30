package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;


@WebServlet("/convertBooking")
public class ConvertBookingServlet extends HttpServlet  {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Date start = Date.valueOf(request.getParameter("start"));
        Date end = Date.valueOf(request.getParameter("end"));
        Integer chainId = Integer.parseInt(request.getParameter("cId"));
        Integer hotelId = Integer.parseInt(request.getParameter("hId"));
        Integer roomNum = Integer.parseInt(request.getParameter("rNum"));
        String customerId = request.getParameter("custId");
        Integer employeeSsn = Integer.parseInt(request.getParameter("eSsn"));

        Integer cardNumber = Integer.parseInt(request.getParameter("CardNumber"));
        Integer cvv = Integer.parseInt(request.getParameter("Cvv"));
        String expiry = request.getParameter("ExpiryDate");

        try {
            if(!(PaymentService.checkSpecificPayment(cardNumber))){
                PaymentService.createPayment(cardNumber,cvv,expiry,customerId);
            }
            RentingService.createRenting(start, end, chainId, hotelId, roomNum, customerId, employeeSsn, cardNumber);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.getRequestDispatcher("/viewcustomerbookings.jsp").forward(request, response);


    }


}
