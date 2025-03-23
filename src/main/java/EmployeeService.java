import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {

    /**
     * Method to get all Employee from the database
     *
     * @return List of Employee from database
     * @throws Exception when trying to connect to database
     */
    public List<Employee> getEmployee() throws Exception {

        String sql = "SELECT * FROM employee";

        ConnectionDB db = new ConnectionDB();

        List<Employee> employees = new ArrayList<>();

        //connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            

            while (rs.next()) {
                // create Employee object from result
                Employee employee = new Employee(
                        rs.getInt("employee_ssn"),
                        rs.getInt("chain_id"),
                        rs.getInt("hotel_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("address"),
                        rs.getString("position")
                );

                employees.add(employee);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return employees;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

}
