<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Customer" %>
<%@ page import="com.CustomerService" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookingHotel</title>
    <link rel="stylesheet" href="./cssAndjs/style.css">
</head>
<body>


    <nav class="menu">
        <ul>
            <li><a>About Us</a></li>
            <li><a>About the Hotels</a></li>
        </ul>
    </nav>

    <div class="sign-in-box">

        <form class="signin" action="/createCustomerServlet" method="post">
            <h1>Create an Account:</h1>
            <label for="fname">First Name:</label> <br>
            <input type="text" id="fname" name = "fname"><br><br>
                <label for="lname">Last Name:</label> <br>
                <input type="text" id="lname" name = "lname"><br><br>
                <label for="email">Email:</label> <br>
                <input type="text" id="email" name = "email"><br><br>
                <label>Choose an ID for verification:</label> <br>
         <input type="radio" id="SIN" name="radiob" value="SIN" >
                     <label for="SIN">SIN</label><br><br>
                      <input type="radio" id="driver" name="radiob" value="Driver's License"
                         <label for="driver">Driver's License'</label><br><br>
                          <input type="radio" id="passport" name="radiob" value="Passport" >
                             <label for="passport">Passport</label><br><br>
                <label for="pass">Password:</label> <br>
                <input type="password" id="pass" name = "pass"><br><br>
            <button id="create" >Create Account</button>
            </form>
    </div>
</body>
<style>
.sign-in-box {
     font-family: Georgia, 'Times New Roman', Times, serif;
    margin-top: 50px;
    justify-self: center;
    border: 2px solid grey;
    box-shadow: 0px 0px 5px #528AAE;
    border-radius: 10px;
    padding: 20px;
    align-items: center;
    display: flex;
}

</style>

</html>