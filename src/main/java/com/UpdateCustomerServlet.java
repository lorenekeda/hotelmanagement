package com;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;





@WebServlet("/updateCustomer")
public class UpdateCustomerServlet extends HttpServlet  {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //getting customer info as strings
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String idType = request.getParameter("email");
        String customerId = request.getParameter("customer_id");
        String address = request.getParameter("address");


        try {
            boolean updated = CustomerService.updateCustomer(customerId, firstName, lastName, idType, address);
            if (updated) {
                request.setAttribute("message", "Customer updated successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", " Customer not found!");
                request.setAttribute("messageType", "error");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid ID format!");
            request.setAttribute("messageType", "error");
        } catch (SQLException e) {
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (Exception e) {
            request.setAttribute("message", "Unexpected error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        // Forward back to the form page
        request.getRequestDispatcher("changecustomer.jsp").forward(request, response);
    }


    }



