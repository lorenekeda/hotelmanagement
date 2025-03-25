<%--
  Created by IntelliJ IDEA.
  User: lorenekeda
  Date: 24.03.25
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Customer Information </title>
</head>
<body>
<h2>Update Customer Information</h2>
<form action="updateCustomer" method="post">
    <label for="customer_id">Customer ID:</label>
    <input type="text" id="customer_id" name="customer_id" required><br>

    <label for="first_name">First Name:</label>
    <input type="text" id="first_name" name="first_name"><br>

    <label for="last_name">Last Name:</label>
    <input type="text" id="last_name" name="last_name"><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email"><br>

    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone"><br>

    <label for="address">Address:</label>
    <textarea id="address" name="address"></textarea><br>

    <button type="submit">Update Customer</button>
</form>




</body>
<style>
   form{

   }
   body{

   }
   label{

   }
   input, select{

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
