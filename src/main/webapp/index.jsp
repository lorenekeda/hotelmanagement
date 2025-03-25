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
            <p>Don't have an account?</p> <a>Click here to create one.</a>
            <a href="bookaroom.jsp" class="room-button">TEMPORARY BUTTON TO BOOK A ROOM TO TEST</a>
            <a href="changecustomer.jsp" class="customerinfo-button">TEMPORARY BUTTON TO VIEW CUSTOMER CHANGE PAGE</a>
        </div>
    </div>
   

   <div class="container">
    <h1>Our Company Statement</h1>
    <p>BookingHotels.com just made booking hotels from the most popular hotel chains in North America much easier with a click of a button!</p>
   </div>
</body>
<style>
.container h1 {
    font-weight: bold;
    text-decoration: dotted;
 }
 .title {
     box-shadow: 15px 15px 15px lightblue;
     padding: 50px;
       font-family: Georgia, 'Times New Roman', Times, serif;
     height: 350px;
     text-align: center;
         align-self: center;
     background-color: #528AAE;
     flex: 1;
 }
 .signin {

     padding: 20px;
     font-family: Georgia, 'Times New Roman', Times, serif;
     width: 600px;
     height: 419px;
     text-align: center;
     align-self: center;
     background-color: #fefefe;
    flex: 1;
 }
 .container1 {
    margin-top: 30px;
     display:flex;
     justify-content: center;
     align-items: center;

 }

 .container{
    text-align: center;
    font-family: Georgia, 'Times New Roman', Times, serif;
 }
 input {
     border-radius: 5px;
     border: 1px solid rgb(2, 4, 5);

 }
 input:focus {

     box-shadow: 0px 0px 5px #528AAE;
 }
  button {
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

 .menu {
    background-color: #528AAE;
    position: fixed;
    top:0;
    left:0;
    width: 100%;
    padding: 10px 0;
    margin-bottom: 100px;
 }
 .menu ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: center;
 }

 .menu li {
    margin: 0 20px;
}

</style>
</html> 
