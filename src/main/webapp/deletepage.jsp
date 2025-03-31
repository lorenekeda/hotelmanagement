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
      padding: 20px;
      font-family: Georgia, 'Times New Roman', Times, serif;
      width: 600px;
      height: 419px;
      text-align: center;
      align-self: center;
      background-color: #fefefe;
      flex: 10;
    }

    .container {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    .delete-option {
      margin: 15px;
      padding: 15px 30px;
      background-color: #63a7d1;
      color: white;
      text-decoration: none;
      font-size: 18px;
      border-radius: 10px;
      box-shadow: 0px 0px 5px #528AAE;
      width: 250px;
      text-align: center;
    }

    .delete-option:hover {
      cursor: pointer;
      box-shadow: 0px 0px 7px #487b9b;
    }

    form {
      box-shadow: 15px 15px 15px lightblue;
      padding: 50px;
      font-family: Georgia, 'Times New Roman', Times, serif;
      height: 350px;
      text-align: center;
      align-self: center;
      background-color: #528AAE;
      flex: 1;
    }

    label {
      font-size: 20px;
      margin-bottom: 10px;
    }

    input, select {
      border: 1px solid rgb(2, 4, 5);
      padding: 8px;
      margin: 10px;
      width: 90%;
      font-size: 16px;
    }

    button {
      border: none;
      border-radius: 10px;
      padding: 10px;
      background-color: #63a7d1;
      box-shadow: 0px 0px 5px #528AAE;
      font-size: 18px;
    }

    button:hover {
      cursor: pointer;
      box-shadow: 0px 0px 7px #487b9b;
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
  <button type="button" onclick="window.location.href='index.jsp'">
    Home
  </button>
</div>

</body>
</html>

