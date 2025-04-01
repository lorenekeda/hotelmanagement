<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.ViewService" %>
<%@ page import="java.util.ArrayList" %>


<%
    ViewService viewService = new ViewService();

    HashMap<String, Integer> totalRoom = null;
    HashMap<String, Integer> locationsRoom = null;

    try {
        totalRoom = viewService.getHotelRoomCapacity();
        locationsRoom = viewService.getAddressRooms();
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
            <h1>View Info</h1>
            <button type="button" onclick="window.location.href='index.jsp'"> Home </button>
        </div>
    </div>

    <div class="container">
        <div class="total" id="total">
            <% if (totalRoom != null && totalRoom.size() == 0) { %>
                <h1 style="margin-top: 5rem;">No info found!</h1>
            <% } else if (totalRoom != null) { %>
                <table style="width:100%">
                    <caption><b>Total rooms</b></caption>
                    <tr>
                        <th>Hotel Id - Chain Id</th>
                        <th>Total Rooms</th>
                    </tr>
                    <% for (String x : totalRoom.keySet()) { %>
                        <tr>
                            <td><%=x %></td>
                            <td><%=totalRoom.get(x) %></td>
                        </tr>
                    <% } %>
                </table>
            <% }
            %>
        </div>

        <div id="location">
            <% if (locationsRoom != null && locationsRoom.size() == 0) { %>
                <h1 style="margin-top: 5rem;">No info found!</h1>
            <% } else if (locationsRoom != null) { %>
                <table style="width:100%">
                    <caption><b>Location Rooms</b></caption>
                    <tr>
                        <th>Location</th>
                        <th>Rooms</th>
                    </tr>
                    <% for (String x : locationsRoom.keySet()) { %>
                        <tr>
                            <td><%=x %></td>
                            <td><%=locationsRoom.get(x) %></td>
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

    .total{
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