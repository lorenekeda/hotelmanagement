<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="./cssAndjs/style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="/cssAndjs/index.js"></script>
    <title>Document</title>
</head>
<body>
<!-- First message for a successfully account creation -->
<%
     String message = (String) request.getAttribute("message");
     if (message != null) {
 %>

     <script>
         alert("<%= message %>");
     </script>

 <% } %>
 <!-- Second message for incorrect password -->
 <%
      String message2 = (String) request.getAttribute("message2");
      if (message2 != null) {
  %>

      <script>
          alert("<%= message2 %>");
      </script>
  <% } %>
    <nav class="menu">
        <ul>
            <li><a href="aboutus.jsp">About Us</a></li>
            <li><a href="aboutthehotels.jsp">About the Hotels</a></li>
        </ul>
    </nav>

    <div class="container1">

        <div class="title">
            <h1>BookingHotels</h1>
            <p>Booking a stay just got easier!</p>
        </div>
        
        <div class="signin">
            <h1>Sign In Here!</h1>
            <form action="logIn" method="post">
                <label for="user">Username:</label> <br>
                <input type="text" id="user" name = "user"><br><br>
                <label for="pass">Password:</label> <br>
                <input type="password" id="pass" name = "pass"> <br> <br>
                 <label>User type:</label> <br>
              <input type="radio" id="customer" name="radiob" value="customer" >
             <label for="customer">Customer</label><br><br>
             <input type="radio" id="employee" name="radiob" value="employee" >
                   <label for="employee">Employee</label><br> <br>
                    <input type="radio" id="manager" name="radiob" value="manager" >
                         <label for="manager">Manager</label><br> <br>
           <button id="signinbutton" >Sign in</button>


            </form>
            <p>Don't have an account?</p>
            <a href="signup.jsp">Click here to create one.</a>

<%--            <a href="changecustomer.jsp" class="customerinfo-button">TEMPORARY BUTTON TO VIEW CUSTOMER CHANGE PAGE</a>--%>
<%--            <a href="changehotel.jsp" class="hotelchange-button">TEMP BUTTON TO VIEW HOTEL UPDATE PAGE</a>--%>
<%--            <a href="changeinfo.jsp" class="infochange-button">TEMP BUTTON TO VIEW INFORMATION UPDATE PAGE</a>--%>
<%--            <a href="createpage.jsp" class="room-button">TEMP BUTTON TO create PAGE</a>--%>
<%--            <a href="deletepage.jsp" class="room-button">TEMP BUTTON TO delete PAGE</a>--%>


        </div>
    </div>
   

   <div class="container">
    <h1>Our Company Statement</h1>
    <p>BookingHotels.com just made booking hotels from the most popular hotel chains in North America much easier with a click of a button!</p>
   </div>
</body>

</html> 
