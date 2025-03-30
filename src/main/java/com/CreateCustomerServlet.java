package com;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;


@WebServlet("/signIn")
public class CreateCustomerServlet extends HttpServlet  {
   //logger to help debug
    private static final Logger logger = Logger.getLogger(CreateCustomerServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("in");
        //getting customer info as strings
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String verID = request.getParameter("radiob");
        String password = request.getParameter("pass");
        //create the registration date
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        try {
            //first check if the customer exists
           boolean customerExists = CustomerService.checkSpecificCustomer(email);
           //if it exists then send a message that it already exists
           if(customerExists){
               request.setAttribute("message", "Customer account already exists.");
               RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
               dispatcher.forward(request, response);
               logger.info("ALREADY GOT A CUSTOMER");
           }
           else {
               logger.info("DONT HAVE CUSTOMER");
               try {
                   //if it does not exist try to create a customer
                   boolean created = CustomerService.createCustomer(email, String.valueOf(date), firstName, lastName, verID, address, password); //change to create customer
                   if (created) {
                       logger.info("CREATED");
                       response.sendRedirect("index.jsp");
                   } else {
                       logger.info("NOT CREATED");
                       request.setAttribute("message", "Customer account could not be created.");
                       RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                       dispatcher.forward(request, response);
                   }
               }catch (Exception e) {
                   throw new RuntimeException(e);
               }
           }
        } catch (ServletException e) {
            e.getMessage();
            throw new RuntimeException(e);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }


}
