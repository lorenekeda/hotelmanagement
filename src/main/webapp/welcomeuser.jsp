<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %> <!--Put this in your file -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./cssAndjs/welcomeuser.css">
    <title>Document</title>
</head>
<body>
    <nav class="menu">
        <ul>
            <li><a>About Us</a></li>
            <li><a href="aboutthehotels.jsp">About the Hotels</a></li>
        </ul>
    </nav>
    <div class="welcome-box">

     <%
            // first grab the type attribute set in the LoginServlet
                String role = (String) session.getAttribute("type");


                // check if it is null
                if (role != null) {

                //if it is an employee then show these options
                    if (role.equals("employee")) {
                     int user = (int) session.getAttribute("user");
            %>
                        <h2>Employee Dashboard</h2>
                        <p>Welcome, Employee. You have access to management features.</p>
                        <a href="rentaroom.jsp">Rent a room for a customer</a><br>
                        <a href="viewcustomerbookings.jsp">Convert customer bookings</a>
            <%

                // if it is a customer then show these options
                    } else if (role.equals("customer")) {
                     String user = (String) session.getAttribute("user");
            %>
                        <h1>Welcome <%= user %></h1>
                        <h2>Customer Dashboard</h2>
                        <p>Welcome, Customer. You can manage your bookings and view information.</p>
                        <a href="viewbookings.jsp">View Bookings</a><br>
                        <a href="bookaroom.jsp">Book A Room!</a>
            <%
                    }
                    else if (role.equals("manager")) {
                    int user = (int) session.getAttribute("user");
                    %>
                    <h2>Manager Dashboard</h2>
                  <p>Welcome, Manager. You have access to management features.</p>
                 <a href="rentaroom.jsp">Rent A Room For A Customer</a><br>
                 <a href="viewcustomerbookings.jsp">Convert Customer Bookings</a><br>
                 <a href="archive.jsp">View Booking And Renting Archive</a><br>
                 <a href="changeinfo.jsp">Change Information</a>
                 <a href="deletepage.jsp">Delete Information</a>
                 <a href="createpage.jsp">Add Information</a>
           <%     }
           }
            %>


</div>
</body>
<style>
body {
    font-family: Georgia, 'Times New Roman', Times, serif;
    background: linear-gradient(to right, rgb(255, 255, 255), #528AAE);
}
.welcome-box a{
border: 1px solid;
margin:100px;

background-color: grey;
 text-decoration: none;
 color: black;
 }

 .welcome-box a:hover{
 border: 1px solid;
 margin:100px;
 box-shadow: 0px 0px 5px blue;
 background-color: grey;
  text-decoration: none;
  color: black;
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

.welcome-box{
    margin-top: 40px;

   justify-self: center;
}

.rent-a-room{

    background-color: #60a0c9;
    border-radius: 10px;
    padding:10px;
    width:200px;
    margin: 10px;
    text-align: center;
}

.view-customer-bookings {
    background-color: #60a0c9;
    border-radius: 10px;
    padding:10px;
    width:200px;
    text-align: center;
    margin: 10px;

}

.change-info {
    background-color: #60a0c9;
    border-radius: 10px;
    padding:10px;
    width:200px;
    text-align: center;
    margin: 10px;

}
.rent-a-room:hover{

    background-color: #60a0c9;
    box-shadow: 0px 0px 5px #528AAE;
    cursor: pointer;
    border-radius: 10px;
    padding:10px;
    width:200px;
    margin: 10px;
    text-align: center;
}

.view-customer-bookings:hover {
    background-color: #60a0c9;
    border-radius: 10px;
    padding:10px;
    width:200px;
    box-shadow: 0px 0px 5px #528AAE;
    cursor: pointer;
    text-align: center;
    margin: 10px;

}

.change-info:hover{
    background-color: #60a0c9;
    border-radius: 10px;
    padding:10px;
    width:200px;
    text-align: center;
    margin: 10px;
    box-shadow: 0px 0px 5px #528AAE;
    cursor: pointer;

}

</style>
</html>