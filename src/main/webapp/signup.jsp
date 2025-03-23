<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookingHotel</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="menu">
        <ul>
            <li><a>About Us</a></li>
            <li><a>About the Hotels</a></li>
        </ul>
    </nav>

    <div class="sign-in-box">

        <form class="signin">
            <h1>Create an Account:</h1>
            <label for="fname">First Name:</label> <br>
            <input type="text" id="fname" name = "fname"><br><br>
                <label for="lname">Last Name:</label> <br>
                <input type="text" id="lname" name = "lname"><br><br>
                <label for="phone">Phone Number:</label> <br>
                <input type="text" id="phone" name = "phone"><br><br>
                <label for="email">Email:</label> <br>
                <input type="text" id="email" name = "email"><br><br>
                <label for="pass">Password:</label> <br>
                <input type="password" id="pass" name = "pass"><br><br>
            <button id="create">Create Account</button>
            </form>
    </div>
</body>
</html>