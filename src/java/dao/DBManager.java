/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import beans.*;
import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    // Find user by email and password in the database
    public Staff findStaff(String firstname, String lastname, String position) throws SQLException {
        // Setup the select SQL query string
        String fetch = "SELECT * FROM APP.STAFF WHERE F_NAME = '" + firstname + "' AND L_NAME = '" + lastname + "' AND POSITION = '" + position + "'";
        ResultSet rs = st.executeQuery(fetch);
        // Add the results to a ResultSet
        while (rs.next()) {
            String staffFName = rs.getString(2);
            String staffLName = rs.getString(3);
            String staffPosition = rs.getString(5);
            
            if (staffFName.equals(firstname) && staffLName.equals(lastname) && staffPosition.equals(position)) {
                int staffId = rs.getInt(1);
                String staffEmail = rs.getString(4);
                String staffAddress = rs.getString(6);
                boolean staffStatus = rs.getBoolean(7);
                System.out.println("User " + staffFName + " is found.");
                return new Staff(staffId, staffFName, staffLName, staffEmail, staffPosition, staffAddress, staffStatus);
            }
        }
        // Search the ResultSet for a user using the parameters
        return null;
    }

    // Add a user-data into the database
    public void addStaff(int id, String firstName, String lastName, String email, String position, String address, boolean status) throws SQLException {
        st.executeUpdate("INSERT INTO APP.STAFF (STAFF_ID, FIRST_NAME, LAST_NAME, EMAIL, POSITION, ADDRESS, STATUS) VALUES (" + id + ", '" + firstName + "', '" + lastName + "', '" + email + "', '" + position + "', '" + address + "', " + status + ")");
    }

    // Update staff details in the database
    public void updateStaff(int id, String firstName, String lastName, String email, String position, String address, boolean status) throws SQLException {
        st.executeUpdate("UPDATE APP.STAFF SET FIRST_NAME='" + firstName + "', LAST_NAME='" + lastName + "', EMAIL='" + email + "', POSITION='" + position + "', ADDRESS='" + address + "', STATUS=" + status + " WHERE STAFF_ID=" + id);
    }

    // Delete a staff member from the database
    public void deleteStaff(int id) throws SQLException {
        st.executeUpdate("DELETE FROM APP.STAFF WHERE STAFF_ID=" + id);
    }

    public ArrayList<User> fetchUser() throws SQLException {
        String fetch = "select * from APP.CUSTOMER";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> temp = new ArrayList();

        while (rs.next()) {
            String firstName = rs.getString(1);
            String lastName = rs.getString(2);
            String email = rs.getString(3);
            String dob = rs.getString(4);
            String password = rs.getString(5);

            temp.add(new User(firstName, lastName, email, dob, password));
        }
        return temp;
    }

    public boolean checkStaff(String firstName, String lastName, String position) throws SQLException {
        String fetch = "SELECT * FROM APP.STAFF WHERE FIRST_NAME = '" + firstName + "' AND LAST_NAME = '" + lastName + "' AND POSITION = '" + position + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String foundFirstName = rs.getString(2);
            String foundLastName = rs.getString(3);
            String foundPosition = rs.getString(5);
            if (foundFirstName.equals(firstName) && foundLastName.equals(lastName) && foundPosition.equals(position)) {
                return true;
            }
        }
        return false;
    }
}
