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
    h2 {
        font-size: 32px;
        color: #528AAE;
        margin-bottom: 40px; /* Adds space between title and form */
        text-align: center;
    }
    form {
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1); /* Softer shadow for a more modern look */
        padding: 40px;
        font-family: 'Georgia', 'Times New Roman', Times, serif;
        max-width: 600px; /* Makes the form more responsive */
        margin: 50px auto; /* Centers the form horizontally */
        background-color: #528AAE;
        border-radius: 15px; /* Rounded corners for a smoother look */
        text-align: center;
        flex: 1;
    }

    /* Body Styling */
    body {
        padding: 20px;
        font-family: 'Georgia', 'Times New Roman', Times, serif;
        width: 100%;
        max-width: 800px; /* Prevents body from becoming too wide */
        min-height: 100vh;
        text-align: center;
        background-color: #fefefe;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }

    /* Label Styling (you can add label text styling if needed) */
    label {
        display: block;
        font-size: 16px;
        margin-bottom: 8px;
    }

    /* Input and Select Styling */
    input, select {
        border: 1px solid rgb(2, 4, 5);
        border-radius: 8px; /* Rounded corners */
        padding: 12px;
        width: 100%; /* Ensures full-width inputs */
        margin: 10px 0;
        font-size: 16px;
        background-color: #f7f7f7;
        transition: border-color 0.3s ease, box-shadow 0.3s ease; /* Smooth transition for focus */
    }

    input:focus, select:focus {
        border-color: #63a7d1; /* Change border color on focus */
        box-shadow: 0 0 5px rgba(99, 167, 209, 0.5); /* Subtle glow effect */
    }

    /* Button Styling */
    button {
        border: none;
        border-radius: 10px;
        padding: 12px 20px;
        background-color: #63a7d1;
        color: white;
        font-size: 16px;
        box-shadow: 0px 0px 5px #528AAE;
        cursor: pointer;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
    }

    /* Button Hover Styling */
    button:hover {
        background-color: #487b9b; /* Darker blue on hover */
        box-shadow: 0px 0px 7px rgba(72, 123, 155, 0.6); /* Stronger shadow on hover */
    }


    /* Responsive Design */
    @media (max-width: 768px) {
        body {
            padding: 10px;
        }

        form {
            padding: 30px;
        }

        input, select, button {
            font-size: 14px; /* Adjust font size for smaller screens */
            padding: 10px;
        }
    }

</style>
</html>
