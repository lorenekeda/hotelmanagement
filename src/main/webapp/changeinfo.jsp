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

        .update-option {
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

        .update-option:hover {
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
<h2>Select Information to Update</h2>
<div class="container">
    <a class="update-option" href="changecustomer.jsp">Update Customer Information</a>
    <a class="update-option" href="changehotel.jsp">Update Hotel Information</a>
    <a class="update-option" href="changeemployee.jsp">Update Employee Information</a>
    <a class="update-option" href="changeroom.jsp">Update Room Information</a>
</div>

</body>
</html>
