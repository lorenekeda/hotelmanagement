package com;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

@WebServlet("/addEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hotelId = Integer.parseInt(request.getParameter("hotel_id"));
        int chainId = Integer.parseInt(request.getParameter("chain_id"));
        int employeeSsn = Integer.parseInt(request.getParameter("employee_ssn"));
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String address = request.getParameter("address");
        String position = request.getParameter("position");

        try {



            boolean updateSuccess = EmployeeService.updateEmployee(address, firstName, lastName, position, hotelId, chainId, employeeSsn);

            if (updateSuccess) {
                request.setAttribute("message", "Employee updated successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Employee not found!");
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
        request.getRequestDispatcher("changeemployee.jsp").forward(request, response);
    }
}
