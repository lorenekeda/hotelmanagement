<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %> <!--Put this in your file -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./cssAndjs/welcomeuser.css">
    <title>Document</title>
</head>
<body>
    <nav class="menu">
        <ul>
            <li><a>About Us</a></li>
            <li><a>About the Hotels</a></li>
        </ul>
    </nav>
    <div class="welcome-box">

     <%
            // first grab the type attribute set in the LoginServlet
                String role = (String) session.getAttribute("type");


                // check if it is null
                if (role != null) {

                //if it is an employee then show these options
                    if (role.equals("employee")) {
                     int user = (int) session.getAttribute("user");
            %>
                        <h2>Employee Dashboard</h2>
                        <p>Welcome, Employee. You have access to management features.</p>
                        <a href="rentaroom.jsp">Rent a room for a customer</a><br>
                        <a href="viewcustomerbookings.jsp">View all customer bookings</a>
            <%

                // if it is a customer then show these options
                    } else if (role.equals("customer")) {
                     String user = (String) session.getAttribute("user");
            %>
                        <h1>Welcome <%= user %></h1>
                        <h2>Customer Dashboard</h2>
                        <p>Welcome, Customer. You can manage your bookings and view information.</p>
                        <a href="viewbookings.jsp">View Bookings</a><br>
                        <a href="bookaroom.jsp">Book A Room!</a>
            <%
                    }
                    else if (role.equals("manager")) {
                    int user = (int) session.getAttribute("user");
                    %>
                    <h2>Manager Dashboard</h2>
                  <p>Welcome, Manager. You have access to management features.</p>
                 <a href="rentaroom.jsp">Rent A Room For A Customer</a><br>
                 <a href="viewcustomerbookings.jsp">View All Customer Bookings</a><br>
                 <a href="changeinfo.jsp">Change Information</a>
                 <a href="deletepage.jsp">Delete Information</a>
                 <a href="createpage.jsp">Add Information</a>
           <%     }
           }
            %>


</div>
</body>
</html>