package com;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

@WebServlet("/deleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            // Get customerId from request parameters
            String customerId = request.getParameter("customer_id");

            if (customerId == null || customerId.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Customer ID is required");
                return;
            }

            try {

                boolean isDeleted = CustomerService.deleteCustomer(customerId);

                if (isDeleted) {
                    request.setAttribute("message", "Customer deleted successfully!");
                    request.setAttribute("messageType", "success");
                } else {
                    request.setAttribute("message", "Customer not found!");
                    request.setAttribute("messageType", "error");
                }

            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid ID format!");
                request.setAttribute("messageType", "error");
            } catch (SQLException e) {
                request.setAttribute("message", "Database error: " + e.getMessage());
                request.setAttribute("messageType", "error");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            // Forward back to the HTML page
            request.getRequestDispatcher("/deletecustomer.jsp").forward(request, response);
        }

}
