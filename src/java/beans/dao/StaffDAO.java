package beans.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import beans.Staff;
import java.sql.SQLException;

public class StaffDAO {
    public ArrayList<Staff> getStaff() {
        ArrayList<Staff> staffList = new ArrayList<>();
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            DBConnector dbConnector = new DBConnector();
            con = dbConnector.openConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM APP.STAFF");

            while (resultSet.next()) {
                int id = resultSet.getInt("STAFF_ID");
                String firstName = resultSet.getString("F_NAME");
                String lastName = resultSet.getString("L_NAME");
                String email = resultSet.getString("EMAIL");
                String position = resultSet.getString("POSITION");
                String address = resultSet.getString("ADDRESS");
                boolean status = resultSet.getBoolean("STATUS");
                Staff staff = new Staff(id, firstName, lastName, email, position, address, status);
                staffList.add(staff);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return staffList;
    }


}