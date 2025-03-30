<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<%@ page import="java.util.List" %>
<%@ page import="com.BookingService" %>
<%@ page import="com.Booking" %>
<%@ page import="java.util.ArrayList" %>


<%
    Integer employeeSsn = (Integer) session.getAttribute("user");

    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Convert Booking</title>
</head>
<body>
    <div class="container1">
        <div class="title">
            <h1>Convert Booking To Renting</h1>
            <p>Convert an existing booking to a renting</p>
        </div>
    </div>

    <div class="filter-section">
        <h2>Search</h2>
        <form action="filterBookingServlet" method="get">
            <label for="CustomerId">Enter CustomerId:</label>
            <input type="text" placeholder="type here" id="CustomerId" name="CustomerId">
            <button type="submit">Search</button>
        </form>
    </div>

    <div class="container">
        <h1>Untransformed Bookings</h1>
        <% if (bookings != null && bookings.size() == 0) { %>
            <h1 style="margin-top: 5rem;">No Unconverted Bookings Found!</h1>
        <% } else if (bookings != null) { %>
            <% for (Booking booking : bookings) { %>
                <div>
                    <form action="convertBooking" method="post">
                        <input type="hidden" id="start" name="start" value= <%=booking.getStartDate() %> >
                        <input type="hidden" id="end" name="end" value= <%=booking.getEndDate() %> >
                        <input type="hidden" id="cId" name="cId" value= <%=booking.getChainId() %> >
                        <input type="hidden" id="hId" name="hId" value= <%=booking.getHotelId() %> >
                        <input type="hidden" id="rNum" name="rNum" value= <%=booking.getRoomNum() %> >
                        <input type="hidden" id="custId" name="custId" value= <%=booking.getCustomerId() %> >
                        <input type="hidden" id="eSsn" name="eSsn" value= <%=employeeSsn %> >

                        <button class="button-booking "type="submit">
                            Room Number: <%= booking.getRoomNum() %><br>
                            Hotel: <%= booking.getHotelId() %><br>
                            Chain: <%= booking.getChainId() %>
                        </button>
                    </form>
                </div>
            <% } %>
            <% }
            %>
    </div>

</body>

<style>
    .container1 {
        margin-top: 30px;
        display:flex;
        justify-content: center;
        align-items: center;
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

    .filter-section {
        background-color: #e1eaed;
        padding: 20px;
        box-shadow: 15px 15px 15px lightblue;
        margin-top: 30px;
        text-align: center;
    }

    .filter-section form {
        display: flex;
        justify-content: left;
        gap: 20px;
        flex-wrap: wrap;
    }

    .filter-section select {
        padding: 5px;
        border-radius: 5px;
    }

    button {
        border: none;
        border-radius: 10px;
        padding: 10px;
        background-color: #63a7d1;
        box-shadow: 0px 0px 5px #528AAE;
    }

    .button-booking {
        width: 75%;
        font-family: Georgia, 'Times New Roman', Times, serif;
        border: none;
        border-radius: 10px;
        margin: 10px;
        padding: 10px;
        background-color: #e1eaed;
    }

    button:hover{
        cursor: pointer;
        box-shadow: 0px 0px 7px #487b9b;
    }

    .container {
        text-align: center;
        font-family: Georgia, 'Times New Roman', Times, serif;
    }
</style>
</html>