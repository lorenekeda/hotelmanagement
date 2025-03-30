package com;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.List;

@WebServlet("/filterBookingServlet")
public class FilterBookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            String customerId = request.getParameter("CustomerId");

            List<Booking> bookings = new ArrayList<>();

            if (customerId.isEmpty()) {
                bookings = BookingService.getBookingWithoutRenting();
            } else {
                bookings = BookingService.getCustomerBookingWithoutRenting(customerId);
            }

            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("/viewcustomerbookings.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
        }
    }
}

