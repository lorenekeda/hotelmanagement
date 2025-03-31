package com;

import com.PaymentService;
import com.RentingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
@WebServlet("/createPayment")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String customerId = request.getParameter("cusId");
        int cardNum = Integer.parseInt(request.getParameter("payment"));
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        Date expiry = Date.valueOf(request.getParameter("expiry"));
        try {
            boolean exists = PaymentService.checkSpecificPayment(cardNum);
            if (exists) {
                request.setAttribute("paymentSet", true);
                session.setAttribute("cardNum",cardNum);

                request.getRequestDispatcher("/rentaroom.jsp").forward(request, response);
            } else {
                try {
                    PaymentService.createPayment(cardNum, cvv, String.valueOf(expiry), customerId);
                    request.setAttribute("paymentSet", true);
                    session.setAttribute("cardNum",cardNum);
                    request.getRequestDispatcher("/rentaroom.jsp").forward(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
}

