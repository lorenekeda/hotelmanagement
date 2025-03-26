<%--
  Created by IntelliJ IDEA.
  User: lorenekeda
  Date: 24.03.25
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Hotel Information</title>
</head>
<body>
<h2>Update Hotel Information</h2>
<form action="updateHotelServlet" method="post">
    <label for="hotel_id">Hotel ID:</label>
    <input type="text" id="hotel_id" name="hotel_id" required><br>

    <label for="chain_id">Chain ID:</label>
    <input type="text" id="chain_id" name="chain_id" required><br>

    <label for="name">Hotel Name:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="address">Address:</label>
    <textarea id="address" name="address" required></textarea><br>

    <label for="rating">Rating:</label>
    <input type="text" id="rating" name="rating"><br>

    <label for="num_of_room">Number of Rooms:</label>
    <input type="text" id="num_of_room" name="num_of_room"><br>

    <button type="submit">Update Hotel</button>
</form>

</body>
<style>
    form{
        box-shadow: 15px 15px 15px lightblue;
        padding: 50px;
        font-family: Georgia, 'Times New Roman', Times, serif;
        height: 350px;
        text-align: center;
        align-self: center;
        background-color: #528AAE;
        flex: 1;

    }
    body{
        padding: 20px;
        font-family: Georgia, 'Times New Roman', Times, serif;
        width: 600px;
        height: 419px;
        text-align: center;
        align-self: center;
        background-color: #fefefe;
        flex: 1;

    }
    label{



    }
    input, select{
        border: 1px solid rgb(2, 4, 5);

    }
    button{
        border: none;
        border-radius: 10px;
        padding: 10px;
        background-color: #63a7d1;
        box-shadow: 0px 0px 5px #528AAE;

    }
    button:hover{
        cursor: pointer;
        box-shadow: 0px 0px 7px #487b9b;

    }
</style>
</html>
