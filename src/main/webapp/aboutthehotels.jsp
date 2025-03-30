<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.HotelChainService" %>
<%@ page import="com.HotelChain" %>
<%@ page import="java.util.ArrayList" %>

<%
    HotelChainService hotelChainService = new HotelChainService();
    List<HotelChain> chains = null;
    HashMap<String, Double> ratings = null;
    HashMap<String, Integer> locations = null;
    try {
        chains = hotelChainService.getHotelChain();
        ratings = hotelChainService.getHotelChainAverageRating();
        locations = hotelChainService.getHotelChainLocationNumber();
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Hotel Chain</title>
</head>
<body>

<div class="about-title">
    <div class="container">
        <h1>About The Hotels</h1>
        <p>Learn more about what our chains have to offer.</p>
    </div>
</div>

<div class="companies">
    <div class="container">
        <% for (HotelChain chain : chains) { %>
            <div class="company">
                <h2><%= chain.getChainName() %></h2>
                <p>Come enjoy your stay at <%= chain.getChainName() %></p>
                <p>With an average rating of <%= ratings.get(chain.getChainName()) %></p>
                <p>And <%= locations.get(chain.getChainName()) %> different hotel locations</p>
            </div>
        <% } %>
    </div>
</div>
</body>
<style>
    .about-title {
        background-color: #528AAE;
        padding: 40px 0;
        text-align: center;
    }

    .companies {
        width: 80%;
        margin: 50px auto;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 15px 15px 15px 15px lightblue;
    }

    .company{
        padding: 10px;
    }

    .company h2 {
        font-size: 2rem;
        color: #2c3e50;
        margin-bottom: 10px;
    }

    .company p {
        font-size: 1rem;
        margin-bottom: 10px;
    }
</style>
</html>