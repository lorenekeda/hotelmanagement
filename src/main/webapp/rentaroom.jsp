<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>

<%@ page import="java.util.List" %>
<%@ page import="com.RoomService" %>
<%@ page import="com.HotelService" %>
<%@ page import="com.HotelChainService" %>
<%@ page import="com.HotelChain" %>
<%@ page import="com.Room" %>
<%@ page import="java.util.ArrayList" %>

<%
    HotelChainService hotelChainService = new HotelChainService();
    List<HotelChain> chains = null;
    try {
        chains = hotelChainService.getHotelChain();
    } catch (Exception e) {
        e.printStackTrace();
    }

    HotelService hotelService = new HotelService();
    List<String> locations = null;
    try {
        locations = hotelService.getLocations();
    } catch (Exception e) {
        e.printStackTrace();
    }
RoomService roomService = new RoomService();
    List<Room> rooms = (List<Room>) request.getAttribute("filteredRooms");

%>
 <%
        Boolean rentingMade = (Boolean) request.getAttribute("rentingMade");
    %>
    <%
        if (rentingMade != null && rentingMade) {
    %>
        <script type="text/javascript">
            alert("Your renting was successful!");
        </script>
    <%
        }
    %>

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
            <h1>Rent A Room</h1>
            <p>Rent a room for a customer</p>
        </div>
    </div>
<div class="filter-section">
        <h2>Search Filter</h2>
        <form id="filterForm" action="filterRoomByHotelServlet" method="get">

            <div class="filter-rating">
                <label for="RatingDetail">Rating:</label>
                <select id="RatingDetail" name="RatingDetail">
                    <option value="=">Exactly</option>
                    <option value=">=">At least</option>
                </select>

                <label for="Rating"></label>
                <select id="Rating" name="Rating">
                    <option value=1>1</option>
                    <option value=2>2</option>
                    <option value=3>3</option>
                    <option value=4>4</option>
                    <option value=5>5</option>
                </select>
            </div>

         <label for="Area">Area:</label>
                    <select id="Area" name="Area">
                        <option value="All">All</option>
                        <% for (String area : locations) { %>
                            <option value="<%=area%>"> <%= area %></option>
                        <% } %>
                    </select>

        <label for="Price">Max Price $:</label>
        <input type="number" placeholder="0" min="0" id="Price" name="Price" required>

         <label for="Capacity">Capacity:</label>
                    <select id="Capacity" name="Capacity">
                        <option value="single room">single room</option>
                        <option value="double room">double room</option>
                        <option value="deluxe room">deluxe room</option>
                        <option value="family room">family room</option>
                        <option value="suite">suite</option>
                        <option value="presidential suite">presidential suite</option>
                    </select>

         <label for="StartDate">Start Date:</label>
                     <input type="date" id="StartDate" name="StartDate" required>

                     <label for="EndDate">End Date:</label>
                     <input type="date" id="EndDate" name="EndDate" required>

                     <button type="submit" onclick="return validateDate()">Filter</button>
                 </form>

 <label for="cusID">Customer Email:</label> <br>
            <input type="text" id="cusID" name = "cusID"><br><br>
            <label for="payment">Card Number:</label> <br>
              <input type="text" id="payment" name = "payment"><br><br>
             </div>
              <div class="container">
                     <h1>Available Rooms</h1>

                     <% if (rooms != null && rooms.size() == 0) { %>
                         <h1 style="margin-top: 5rem;">No Rooms found!</h1>
                     <% } else if (rooms != null) { %>
                         <% for (Room room : rooms) { %>
                             <div>
                                 <form id="makeRenting" action="createRenting" method="post">
                                     <input type="hidden" id="start" name="start" value= <%=request.getAttribute("start") %> >
                                     <input type="hidden" id="end" name="end" value= <%=request.getAttribute("end") %> >
                                     <input type="hidden" id="cId" name="cId" value= <%=room.getChainId() %> >
                                     <input type="hidden" id="hId" name="hId" value= <%=room.getHotelId() %> >
                                     <input type="hidden" id="rNum" name="rNum" value= <%=room.getRoomNum() %> >
                                     <input type="hidden" id="custId" name="custId" placeholder="placeholder"  >
                                     <input type="hidden" id="pay" name="pay" placeholder="placeholder" >
                                       <script>
                                       document.getElementById("cusID").addEventListener("input", function() {
                                           document.getElementById("custId").value = this.value;
                                       });
                                        document.getElementById("payment").addEventListener("input", function() {
                                              document.getElementById("pay").value = this.value;
                                                      });
                                       </script>
                                     <button class="button-room "type="submit">
                                              Room Number: <%= room.getRoomNum() %><br>
                                               View: <%= room.getView() %><br>
                                                   Price: <%= room.getPrice() %><br>
                                                    Capacity: <%= room.getCapacity() %><br>
                                              Amenities: <%= roomService.getRoomAmenities(room.getRoomNum(), room.getHotelId(), room.getChainId()) %> <br>
                                           Damages: <%= roomService.getRoomDamages(room.getRoomNum(), room.getHotelId(), room.getChainId()) %>
                                           </button>
                                 </form>
                             </div>
                         <% } %>
                         <% }
                         %>
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
        box-shadow: 15px 15px 15px lightblue;
        margin-top: 30px;
        text-align: center;
    }

    .filter-section form {
        display: flex;
        justify-content: left;
        gap: 20px;
        flex-wrap: wrap;
    }

    .filter-rating {
        display: flex;
        justify-content: left;
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

    .button-room {
        width: 75%;
        font-family: Georgia, 'Times New Roman', Times, serif;
        border: none;
        border-radius: 10px;
        margin: 10px;
        padding: 10px;
        background-color: #e1eaed;
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

<script>
    function validateDate(){
        document.getElementById("filterForm").addEventListener("submit", function(event) {
            var start = document.getElementById("StartDate").value;
            var end = document.getElementById("EndDate").value;

            var now = (new Date()).toISOString().substring(0,10);

            if (start<now) {
               alert("Start date cannot be before today");
               event.preventDefault();
               return;
            } else if (start>end) {
               alert("Start date cannot be after end date");
               event.preventDefault();
               return;
            }
        });
    }
</script>
        </html>