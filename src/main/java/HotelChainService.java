import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelChainService {

    /**
     * Method to get all HotelChain from the database
     *
     * @return List of HotelChain from database
     * @throws Exception when trying to connect to database
     */
    public List<HotelChain> getHotelChain() throws Exception {

        String sql = "SELECT * FROM hotel_chain";

        ConnectionDB db = new ConnectionDB();

        List<HotelChain> chains = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // create HotelChain object from result
                HotelChain chain = new HotelChain(
                        rs.getInt("chain_id"),
                        rs.getString("chain_name"),
                        rs.getInt("num_of_hotel")
                );

                chains.add(chain);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return chains;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

}

