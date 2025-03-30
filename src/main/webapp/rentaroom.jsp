<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

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

<div class="filter-section">
        <h2>Search Filter</h2>
        <form id="filterForm" action="filterRoomServlet" method="get">


        </body>

        </html>