<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.RoomService" %>
<%@ page import="com.HotelService" %>
<%@ page import="com.Hotel" %>
<%@ page import="com.HotelChainService" %>
<%@ page import="com.HotelChain" %>
<%@ page import="com.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Booking" %>
<%@ page import="com.BookingService" %>
<%@ page import="com.BookingServlet" %>

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
<% if (bookings.size()==0) {
%>
<h3>No bookings! </h3>
<% }
else {
for (Booking book : bookings) {
%>
<div>
<h2> <%=book.getStartDate()%> to <%=book.getEndDate()%> </h2>
<% String chainName = HotelChainService.getHotelChain(book.getChainId()).getChainName(); %>
<% String hotelName = HotelService.getSpecificHotel(book.getHotelId()).getHotelName(); %>
  <h3> At chain: <%=chainName%></h3>
  <h3> At hotel: <%=hotelName%></h3>

</div>

<% }
}
%>
</body>
<style>
body {
    font-family: Georgia, 'Times New Roman', Times, serif;
    background: linear-gradient(to right, rgb(255, 255, 255), #528AAE);
}
div {
border: 1px solid;

}
</style>
</html>