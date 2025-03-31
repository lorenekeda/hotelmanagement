package com;

import com.Room;
import com.RoomService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.Date;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/filterRoomByHotelServlet")
public class FilterRoomByHotelServlet extends HttpServlet {
    Logger logger = Logger.getLogger(LoginServlet.class.getName());
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        try {
            logger.info("in the try");
            HttpSession session = request.getSession(false);
            Hotel hotel = HotelService.getSpecificHotel((Integer) session.getAttribute("hotel"));
            logger.info("got the hotel"+(Integer) session.getAttribute("hotel"));
            int hotelID = (int) session.getAttribute("hotel");
            logger.info("got the chain3");
            int chainID = (int) session.getAttribute("chain");

            logger.info("got the chain3"+(int) session.getAttribute("chain"));
            String location = request.getParameter("Area");
            logger.info("got the area"+location);
            String capacity = request.getParameter("Capacity");
            logger.info("got the capacity"+capacity);
            String num = request.getParameter("Price");
            logger.info("got the price"+num);
            String size = request.getParameter(String.valueOf(hotel.getNumOfRoom()));
            logger.info("got the size"+String.valueOf(hotel.getNumOfRoom()));
            Date start = Date.valueOf(request.getParameter("StartDate"));
            Date end = Date.valueOf(request.getParameter("EndDate"));
            logger.info("got the start"+String.valueOf(start));
            logger.info("got the end"+String.valueOf(end));
            int price = 0;
            if (!(num.isEmpty())) {
                price = Integer.parseInt(num);
            }
            logger.info("got the price"+price);
            logger.info("got the hotelsize1");
            int minHotelSize = 0;
            if (!(size.isEmpty())) {
                minHotelSize = Integer.parseInt(size);

            }
            //it stops logging here
            logger.info("got the hotelsize");
            logger.info("got the hotelsize"+ minHotelSize);
            String ratingDetail = request.getParameter("RatingDetail");
            logger.info("got the ratingdetail"+ratingDetail);
            int rating = Integer.parseInt(request.getParameter("Rating"));
            logger.info("got the rating"+String.valueOf(rating));

            List<Room> filteredRooms = RoomService.getRoomsForHotel(chainID,hotelID, location, ratingDetail, rating, price, capacity, start, end, minHotelSize);
            logger.info("got the rooms");
            request.setAttribute("filteredRooms", filteredRooms);
            request.setAttribute("start", start);
            request.setAttribute("end", end);
            request.getRequestDispatcher("/rentaroom.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("errorMessage", e.getMessage());
        }
    }
}
