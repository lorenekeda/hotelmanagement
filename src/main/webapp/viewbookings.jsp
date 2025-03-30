<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.BookingService" %>
<%@ page import="com.Booking" %>
<%
  String user = (String) session.getAttribute("user");
List<Booking> bookings = BookingService.getAllCustomerBookings(user);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./cssAndjs/welcomeuser.css">
    <title>Document</title>
</head>
<body>
<h1> My bookings </h1>

</body>
<style>
body {
    font-family: Georgia, 'Times New Roman', Times, serif;
    background: linear-gradient(to right, rgb(255, 255, 255), #528AAE);
}
</style>
</html>