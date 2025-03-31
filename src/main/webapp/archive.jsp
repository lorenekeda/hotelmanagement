<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.BookingService" %>
<%@ page import="com.Booking" %>
<%@ page import="com.RentingService" %>
<%@ page import="com.Renting" %>
<%@ page import="java.util.ArrayList" %>


<%
    BookingService bookingService = new BookingService();
    RentingService rentingService = new RentingService();

    List<Booking> bookings = null;
    List<Renting> rentings = null;

    try {
        bookings = bookingService.getBooking();
        rentings = rentingService.getRenting();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Archive</title>
</head>
<body>
    <div class="container1">
        <div class="title">
            <h1>View Booking & Renting Archive</h1>
            <button type="button" onclick="window.location.href='welcomeuser.jsp'"> Home </button>
        </div>
    </div>

    <div class="container">
        <div class="booking" id="Booking">
            <% if (bookings != null && bookings.size() == 0) { %>
                <h1 style="margin-top: 5rem;">No Bookings Found!</h1>
            <% } else if (bookings != null) { %>
                <table style="width:100%">
                    <caption><b>Bookings</b></caption>
                    <tr>
                        <th>Chain Id</th>
                        <th>Hotel Id</th>
                        <th>Room Number</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Customer Id</th>
                    </tr>
                    <% for (Booking booking : bookings) { %>
                        <tr>
                            <td><%=booking.getChainId() %></td>
                            <td><%=booking.getHotelId() %></td>
                            <td><%=booking.getRoomNum() %></td>
                            <td><%=booking.getStartDate() %></td>
                            <td><%=booking.getEndDate() %></td>
                            <td><%=booking.getCustomerId() %></td>
                        </tr>
                    <% } %>
                </table>
            <% }
            %>
        </div>

        <div id="Renting">
            <% if (rentings != null && rentings.size() == 0) { %>
                <h1 style="margin-top: 5rem;">No Rentings Found!</h1>
            <% } else if (rentings != null) { %>
                <table style="width:100%">
                    <caption><b>Rentings</b></caption>
                    <tr>
                        <th>Chain Id</th>
                        <th>Hotel Id</th>
                        <th>Room Number</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Customer Id</th>
                        <th>Employee SSN</th>
                    </tr>
                    <% for (Renting renting : rentings) { %>
                        <tr>
                            <td><%=renting.getChainId() %></td>
                            <td><%=renting.getHotelId() %></td>
                            <td><%=renting.getRoomNum() %></td>
                            <td><%=renting.getStartDate() %></td>
                            <td><%=renting.getEndDate() %></td>
                            <td><%=renting.getCustomerId() %></td>
                            <td><%=renting.getEmployeeSsn() %></td>
                        </tr>
                    <% } %>
                </table>
            <% }
            %>
        </div>

    </div>

</body>

<style>
    th, td {
        border-style: ridge;
        border-color: #528AAE;
    }

    tr:nth-child(odd) {background-color: #e1eef7;}

    .container1 {
        margin-top: 30px;
        display:flex;
        justify-content: center;
        align-items: center;
    }

    .booking{
        padding: 20px;
    }

    .title {
        box-shadow: 15px 15px 15px lightblue;
        padding: 50px;
        font-family: Georgia, 'Times New Roman', Times, serif;
        height: 100px;
        text-align: center;
        align-self: center;
        background-color: #528AAE;
        flex: 1;
    }

    .container {
        text-align: center;
        font-family: Georgia, 'Times New Roman', Times, serif;
    }
</style>

</html>