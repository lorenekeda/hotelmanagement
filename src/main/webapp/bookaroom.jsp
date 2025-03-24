<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Room Filter</title>
</head>
<body>
    <div class="container1">
        <div class="title">
            <h1>Book A Room</h1>
            <p>Search for the perfect room that fits all your needs!</p>
        </div>
    </div>

    <div class="filter-section">
        <h2>Search Filter</h2>
        <form>
            <label for="Chain">Chain:</label>
            <select id="Chain" name="Chain">
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C">C</option>
            </select>

            <label for="Rating">Rating:</label>
            <select id="Rating" name="Rating">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>

            <label for="Price">Price:</label> <br>
            <input type="text", id="Price" name="Price"><br><br>

            <button>Filter</button>
        </form>
    </div>

    <div class="container">
        <h1>Available Rooms</h1>
    </div>
</body>

<style>
    .container1 {
        margin-top: 30px;
        display:flex;
        justify-content: center;
        align-items: center;
    }

    .title {
        box-shadow: 15px 15px 15px lightblue;
        padding: 50px;
        font-family: Georgia, 'Times New Roman', Times, serif;
        height: 100px;
        text-align: center;
        align-self: center;
        background-color: #528AAE;
        flex: 1;
    }

    .filter-section {
        background-color: #e1eaed;
        padding: 20px;
        box-shadow: 15px 15px 15px #528AAE;
        margin-top: 30px;
        text-align: center;
    }

    .filter-section form {
        display: flex;
        justify-content: left;
        gap: 20px;
        flex-wrap: wrap;
    }

    .filter-section select {
        padding: 5px;
        border-radius: 5px;
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

    .container {
        text-align: center;
        font-family: Georgia, 'Times New Roman', Times, serif;
    }
</style>
</html>
