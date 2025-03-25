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
        String email = request.getParameter("email");
        String customerId = request.getParameter("customer_id");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");


        try {
            boolean updated = CustomerService.updateCustomer(customerId, firstName, lastName, email, phone, address);
            if (updated) {
                response.sendRedirect("success.jsp"); // Redirect to success page
            } else {
                response.sendRedirect("error.jsp"); // Redirect to error page
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }


}
