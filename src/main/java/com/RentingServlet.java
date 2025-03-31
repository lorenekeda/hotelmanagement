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
        String customerId = request.getParameter("custId");
        int empID = (int) session.getAttribute("user");
        int cardNum = Integer.parseInt(request.getParameter("pay"));
        int cvv = Integer.parseInt(request.getParameter("cvv2"));
        Date expiry = Date.valueOf(request.getParameter("expiry2"));

        //FIRST CREATE PAYMENT METHOD
        try {
            boolean exists = PaymentService.checkSpecificPayment(cardNum);
            if (exists) {
                request.setAttribute("paymentExists", true);

            } else {
                try {
                    PaymentService.createPayment(cardNum, cvv, String.valueOf(expiry), customerId);
                    request.setAttribute("paymentSet", true);

                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        try {
            RentingService.createRenting(start, end, chainId, hotelId, roomNum, customerId, empID, cardNum);
            request.setAttribute("rentingMade", true);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        request.getRequestDispatcher("/rentaroom.jsp").forward(request, response);


    }


}

