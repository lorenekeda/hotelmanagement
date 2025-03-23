import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelService {

    /**
     * Method to get all Hotel from the database
     *
     * @return List of Hotel from database
     * @throws Exception when trying to connect to database
     */
    public List<Hotel> getHotel() throws Exception {

        String sql = "SELECT * FROM hotel";

        ConnectionDB db = new ConnectionDB();

        List<Hotel> hotels = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();




            while (rs.next()) {
                // create Hotel object from result
                Hotel hotel = new Hotel(
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getInt("rating"),
                        rs.getInt("num_of_room")
                );

                hotels.add(hotel);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return hotels;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

}


