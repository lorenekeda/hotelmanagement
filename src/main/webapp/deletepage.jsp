<%--
  Created by IntelliJ IDEA.
  User: lorenekeda
  Date: 30.03.25
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Information</title>
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

    .delete-option {
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

    .delete-option:hover {
      cursor: pointer;
      background-color: #487b9b;
      box-shadow: 0px 0px 7px #487b9b;
    }

    button.delete-option {
      border: none;
      cursor: pointer;
      font-size: 18px;
    }
  </style>
</head>
<body>
<h2>Select Information to Delete</h2>
<div class="container">
  <a class="delete-option" href="deletecustomer.jsp">Delete Customer Information</a>
  <a class="delete-option" href="deletehotel.jsp">Delete Hotel Information</a>
  <a class="delete-option" href="deleteemployee.jsp">Delete Employee Information</a>
  <a class="delete-option" href="deleteroom.jsp">Delete Room Information</a>
  <a class="delete-option" href="deleteamenity.jsp">Delete Room Amenity Information</a>
  <a class="delete-option" href="deletedamage.jsp">Delete Room Damage Information</a>
</div>
<div style="padding: 15px">
  <button class="delete-option" type="button" onclick="window.location.href='welcomeuser.jsp'">
    Home
  </button>
</div>

</body>
</html>

