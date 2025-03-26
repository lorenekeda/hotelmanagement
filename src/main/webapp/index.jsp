<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <nav class="menu">
        <ul>
            <li><a>About Us</a></li>
            <li><a>About the Hotels</a></li>
        </ul>
    </nav>
    <div class="container1">

        <div class="title">
            <h1>BookingHotels</h1>
            <p>Booking a stay just got easier!</p>
        </div>
        
        <div class="signin">
            <h1>Sign In Here!</h1>
            <form>
                <label for="user">Username:</label> <br>
                <input type="text" id="user" name = "user"><br><br>
                <label for="pass">Password:</label> <br>
                <input type="password" id="pass" name = "pass"> <br> <br>
           <button>Sign in</button>
            </form>
            <p>Don't have an account?</p>
            <a href="signup.jsp">Click here to create one.</a>
            <a href="bookaroom.jsp" class="room-button">TEMPORARY BUTTON TO BOOK A ROOM TO TEST</a>
            <a href="changecustomer.jsp" class="customerinfo-button">TEMPORARY BUTTON TO VIEW CUSTOMER CHANGE PAGE</a>
            <a href="changehotel.jsp" class="hotelchange-button">TEMP BUTTON TO VIEW HOTEL UPDATE PAGE</a>
            <a href="changeinfo.jsp" class="infochange-button">TEMP BUTTON TO VIEW INFORMATION UPDATE PAGE</a>
        </div>
    </div>
   

   <div class="container">
    <h1>Our Company Statement</h1>
    <p>BookingHotels.com just made booking hotels from the most popular hotel chains in North America much easier with a click of a button!</p>
   </div>
</body>

</html> 
