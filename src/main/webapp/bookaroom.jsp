<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="com.RoomService" %>
<%@ page import="com.HotelService" %>
<%@ page import="com.HotelChainService" %>
<%@ page import="com.HotelChain" %>
<%@ page import="com.Room" %>
<%@ page import="java.util.ArrayList" %>


<%
    HotelChainService hotelChainService = new HotelChainService();
    List<HotelChain> chains = null;
    try {
        chains = hotelChainService.getHotelChain();
    } catch (Exception e) {
        e.printStackTrace();
    }

    HotelService hotelService = new HotelService();
    List<String> locations = null;
    try {
        locations = hotelService.getLocations();
    } catch (Exception e) {
        e.printStackTrace();
    }

    List<Room> rooms = (List<Room>) request.getAttribute("filteredRooms");

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Room Filter</title>
</head>
<body>
    <div class="container1">
        <div class="title">
            <h1>Book A Room</h1>
            <p>Search for the perfect room that fits all your needs!</p>
        </div>
    </div>

    <div class="filter-section">
        <h2>Search Filter</h2>
        <form action="filterRoomServlet" method="get">
            <label for="Chain">Chain:</label>
            <select id="Chain" name="Chain">
                <% for (HotelChain chain : chains) { %>
                    <option value=<%= chain.getChainName() %>> <%= chain.getChainName() %></option>
                <% } %>
            </select>

            <label for="Rating">Rating:</label>
            <select id="Rating" name="Rating">
                <option value=1>1</option>
                <option value=2>2</option>
                <option value=3>3</option>
                <option value=4>4</option>
                <option value=5>5</option>
            </select>

            <label for="Area">Area:</label>
            <select id="Area" name="Area">
                <% for (String area : locations) { %>
                    <option value=<%=area%>> <%= area %></option>
                <% } %>
            </select>

            <label for="Price">Max Price $:</label>
            <input type="text", id="Price" name="Price">

            <label for="Capacity">Capacity:</label>
            <select id="Capacity" name="Capacity">
                <option value="single room">single room</option>
                <option value="double room">double room</option>
                <option value="deluxe room">deluxe room</option>
                <option value="family room">family room</option>
                <option value="suite">suite</option>
                <option value="presidential suite">presidential suite</option>
            </select>

            <label for="StartDate">Start Date:</label>
            <input type="date" id="StartDate" name="StartDate">

            <label for="EndDate">End Date:</label>
            <input type="date" id="EndDate" name="EndDate">

            <button type="submit">Filter</button>
        </form>
    </div>

    <div class="container">
        <h1>Available Rooms</h1>

        <% if (rooms != null && rooms.size() == 0) { %>
            <h1 style="margin-top: 5rem;">No Rooms found!</h1>
        <% } else if (rooms != null) { %>
            <% for (Room room : rooms) { %>
                <div class="room-item">
                    <button class="button-room">
                        Room Number: <%= room.getRoomNum() %><br>
                        View: <%= room.getView() %><br>
                        Price: <%= room.getPrice() %><br>
                        Capacity: <%= room.getCapacity() %>
                    </button>
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

    .button-room {
        width: 75%;
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
