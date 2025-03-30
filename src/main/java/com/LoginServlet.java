package com;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

import java.util.logging.Logger;


@WebServlet("/logIn")
public class LoginServlet extends HttpServlet  {
    //logger to help debug
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("in");
        //getting customer info as strings
        String email = request.getParameter("user");
        String password = request.getParameter("pass");
        String type = request.getParameter("radiob");
        //CHECK IF IT IS AN EMPLOYEE OR CUSTOMER
        //THEN CHECK PASSWORDS
        if (type.equals("customer")) {
            try {
                boolean validCustomer = CustomerService.checkSpecificCustomerWithPassword(email, password);
                logger.info("checked if valid");
                //if customer exists
                if (validCustomer) {
                    logger.info("its valid");

                    //HOW TO STORE USER INFO ACROSS ALL PAGES
                    //CREATE HTTPSESSION OBJECT, must import httpsession class
                    HttpSession session = request.getSession();
                    //SET THE VARIABLE NAMES AND WHAT YOU WANT TO STORE IN IT
                    session.setAttribute("user", email); //Set the user to the email/SSN
                    session.setAttribute("type", type); //Set the user type to the value of the radio button

                    response.sendRedirect("welcomeuser.jsp");
                } else {
                    logger.info("its not valid");
                    request.setAttribute("message2", "Password incorrect or user does not exist.");

                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
    }
        else if (type.equals("employee")){
            logger.info("checking employee instead!!!!");
            try {
                boolean validEmp = EmployeeService.checkSpecificEmployeeWithPassword(email, password);
                logger.info("checked if valid");
                //if employee  exists
                if (validEmp) {
                    logger.info("its valid");
                    //do the same http stuff if its an employee
                    HttpSession session = request.getSession();
                    session.setAttribute("user", email);
                    session.setAttribute("type", type);

                    response.sendRedirect("welcomeuser.jsp");
                } else {
                    logger.info("its not valid");
                    request.setAttribute("message2", "Password incorrect or user does not exist.");

                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

    }


}

