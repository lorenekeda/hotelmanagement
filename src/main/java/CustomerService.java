import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {

    /**
     * Method to get all Customer from the database
     *
     * @return List of Customer from database
     * @throws Exception when trying to connect to database
     */
    public List<Customer> getCustomer() throws Exception {

        String sql = "SELECT * FROM customer";

        ConnectionDB db = new ConnectionDB();

        List<Customer> customers = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

           
            while (rs.next()) {
                // create Room object from result
                Customer customer = new Customer(
                        rs.getString("customer_id"),
                        rs.getString("registration_date"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("id_type"),
                        rs.getString("address")
                );

                customers.add(customer);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return customers;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

}



