<%--
  Created by IntelliJ IDEA.
  User: lorenekeda
  Date: 24.03.25
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Information</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            background-color: #fefefe;
            text-align: center;
        }

        h2 {
            font-size: 28px;
            color: #528AAE;
            margin-bottom: 20px;
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            max-width: 600px;
        }

        .update-option {
            margin: 10px;
            padding: 12px 25px;
            background-color: #63a7d1;
            color: white;
            text-decoration: none;
            font-size: 18px;
            border-radius: 10px;
            box-shadow: 0px 0px 5px #528AAE;
            width: 100%;
            max-width: 250px;
            text-align: center;
            display: inline-block;
            transition: box-shadow 0.3s ease, background-color 0.3s ease;
        }

        .update-option:hover {
            cursor: pointer;
            background-color: #487b9b;
            box-shadow: 0px 0px 7px #487b9b;
        }

        button.update-option {
            border: none;
            cursor: pointer;
            font-size: 18px;
        }
    </style>
</head>
<body>
<h2>Select Information to Update</h2>
<div class="container">
    <a class="update-option" href="changecustomer.jsp">Update Customer Information</a>
    <a class="update-option" href="changehotel.jsp">Update Hotel Information</a>
    <a class="update-option" href="changeemployee.jsp">Update Employee Information</a>
    <a class="update-option" href="changeroom.jsp">Update Room Information</a>
    <a class="update-option" href="changeamenity.jsp">Update Room Amenity Information</a>
    <a class="update-option" href="changedamage.jsp">Update Room Damage Information</a>

    <div style="padding: 15px">
    <button class="update-option" type="button" onclick="window.location.href='welcomeuser.jsp'">
        Home
    </button>
    </div>



</div>




</body>
</html>
