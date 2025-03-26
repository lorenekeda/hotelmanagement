<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
     <h1>
        Welcome insert user!
    </h1>
    <a href="rentaroom.jsp">
        <div class="rent-a-room">
            <h3>Rent a room</h3>
            <p>Rent a room for a customer.</p>
        </div>
        </a>

        <a href="viewcustomerbookings.jsp">
        <div class="view-customer-bookings">
            <h3>Customer Bookings</h3>
            <p>View all bookings of every customer</p>
        </div>
        </a>
        <a href="changeinfo">
        <div class="change-info" onclick="window.location.href='about.html';">
            <h3>Hotel Info</h3>
            <p>Change employee, customer, or hotel information.</p>
        </div>
        </a>


</div>
</body>
</html>