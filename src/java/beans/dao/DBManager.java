/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans.dao;

import beans.Staff;
import beans.User;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList; 

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {

private final Statement st;
   
public DBManager(Connection conn) throws SQLException {       
   st = conn.createStatement();   
}
// ======================CRUD ONLINE ACCESS MANAGEMENT======================

//Find user by email and password in the database   
public User findUser(String email, String password) throws SQLException {       
   //setup the select sql query string       
   String fetch = "select * from APP.CUSTOMER where CUSTOMER_EMAIL = '" + email + "'and CUSTOMER_PASSWORD='" + password + "'"; 
   //execute this query using the statement field   
   ResultSet rs = st.executeQuery(fetch);
   //add the results to a ResultSet
   while (rs.next()){
       String customerEmail = rs.getString(3);
       String customerPassword = rs.getString(5);
       
       if(customerEmail.equals(email) && customerPassword.equals(password)){
           String customerFName = rs.getString(1);
           String customerLName = rs.getString(2);
           String customerDOB = rs.getString(4);
           System.out.println("User " + customerFName + " is found.");
           return new User(customerFName, customerLName, customerEmail, customerDOB, customerPassword);
       }
   }
   //search the ResultSet for a user using the parameters               
   return null;   
}

//Add a user-data into the database   
public void addUser(String firstName, String lastName, String email, String dob, String password) throws SQLException {                   //code for add-operation       
  st.executeUpdate("INSERT INTO APP.CUSTOMER " + "VALUES ('" + firstName + "', '" + lastName + "', '" + email + "', '" + dob + "', '" + password + "')");
}

//update a user details in the database   
public void updateUser(String firstName, String lastName, String email, String dob, String password) throws SQLException {       
   st.executeUpdate("UPDATE APP.CUSTOMER SET CUSTOMER_FNAME='" + firstName + "',CUSTOMER_LNAME='" + lastName + "',CUSTOMER_DOB='" + dob + "',CUSTOMER_PASSWORD='" + password + "' WHERE CUSTOMER_EMAIL='" + email + "'"); 

}       

//delete a user from the database   
public void deleteUser(String email) throws SQLException{       
   //code for delete-operation   
   st.executeUpdate("DELETE FROM APP.Customer WHERE CUSTOMER_EMAIL ='" + email + "'");
}
 
public ArrayList<User> fectUser() throws SQLException{
    String fetch = "select * from APP.CUSTOMER";
    ResultSet rs = st.executeQuery(fetch);
    ArrayList<User> temp = new ArrayList();
    
    while(rs.next()){
        String firstName = rs.getString(1);
        String lastName = rs.getString(2);
        String email = rs.getString(3);
        String dob = rs.getString(4);
        String password = rs.getString(5);
        
        temp.add(new User(firstName, lastName, email, dob, password));
    }
    return temp;
}

public boolean checkUser(String email, String password) throws SQLException{
    String fetch = "select * from APP.CUSTOMER where CUSTOMER_EMAIL= '" + email + "' and password ='" + password + "'";
    ResultSet rs = st.executeQuery(fetch);
     while(rs.next()){
        String userEmail = rs.getString(3);
        String userPassword = rs.getString(5);
        
        if(userEmail.equals(email) && userPassword.equals(password)){
            return true;
        }
    }
    return false; 
}

//======================CRUD USER ACCESS LOGS======================
//update logout log - this wasn't needed 
public void addLogout(String customerEmail, Timestamp logoutTime, Timestamp loginTime) throws SQLException {
    String query = ("UPDATE APP.ACCESSLOGS SET ACCESSLOGS_LOGOUT_TIME ='" + logoutTime + "' WHERE CUSTOMER_EMAIL='" + customerEmail +"' AND ACCESSLOGS_LOGIN_TIME='"+ loginTime + "'"); 
    st.executeUpdate(query); 
}
// add login log 
public void addLog(String customerEmail, Timestamp loginTime) throws SQLException {
    String query = "INSERT INTO APP.ACCESSLOGS (CUSTOMER_EMAIL, ACCESSLOGS_LOGIN_TIME) VALUES ('"+customerEmail+"', '"+loginTime+"')"; 
    st.executeUpdate(query); 
}
//update logout log 
public void insertLogoutTime(String customerEmail, Timestamp logoutTime) throws SQLException {
    String checkQuery = "SELECT * FROM APP.ACCESSLOGS WHERE CUSTOMER_EMAIL = '" + customerEmail + "' AND ACCESSLOGS_LOGOUT_TIME IS NULL";
    
    ResultSet result = st.executeQuery(checkQuery);

    if (result.next()) {
        String loginTime = result.getTimestamp("ACCESSLOGS_LOGIN_TIME").toString(); // Assuming column name is ACCESSLOGS_LOGIN_TIME
        String updateQuery = "UPDATE APP.ACCESSLOGS SET ACCESSLOGS_LOGOUT_TIME = '" + logoutTime + "' WHERE CUSTOMER_EMAIL = '" + customerEmail + "' AND ACCESSLOGS_LOGIN_TIME = '" + loginTime + "'";
        
        st.executeUpdate(updateQuery);
    }
}
//====================== PAYMENT=====================
public void addPayment(String paymentNameOnCard, String paymentCardNumber, int paymentExpiryMonth, 
                   int paymentExpiryYear, int paymentCvv, double amount, String paymentDate, String customerEmail) throws SQLException {

    
    String query = "INSERT INTO APP.PAYMENT (PAYMENT_NAME_ON_CARD, PAYMENT_CARD_NUMBER , PAYMENT_EXPIRY_MONTH, PAYMENT_EXPIRY_YEAR, PAYMENT_CVV, AMOUNT, PAYMENT_DATE, CUSTOMER_EMAIL) VALUES (" + 
                     "'" + paymentNameOnCard + "', " +  //quote
                    "'"  + paymentCardNumber + "', " + //quote
                        paymentExpiryMonth + ", " + 
                        paymentExpiryYear + ", " + 
                        paymentCvv + ", " + 
                       amount + ", " +
                        "'" + paymentDate + "', " + //quote
                     "'" + customerEmail + "')"; //quote

            st.executeUpdate(query);
    } 
    
    public void deletePayment (String paymentNameOnCard, String paymentCardNumber, int paymentExpiryMonth, 
                   int paymentExpiryYear, int paymentCvv, double amount, String paymentDate, String customerEmail) throws SQLException {

    
    String query = "DELETE FROM APP.PAYMENT " +
                   "WHERE PAYMENT_NAME_ON_CARD = '" + paymentNameOnCard + "' " +
                   "AND PAYMENT_CARD_NUMBER = '" + paymentCardNumber + "' " +
                   "AND PAYMENT_EXPIRY_MONTH = " + paymentExpiryMonth + " " +
                   "AND PAYMENT_EXPIRY_YEAR = " + paymentExpiryYear + " " +
                   "AND PAYMENT_CVV = " + paymentCvv + " " +
                   "AND AMOUNT = " + amount + " " +
                   "AND PAYMENT_DATE = '" + paymentDate + "' " +
                   "AND CUSTOMER_EMAIL = '" + customerEmail + "'";
    
    st.executeUpdate(query);
        }
     public void editPayment(String paymentNameOnCard, String newPaymentCardNumber, int expMonth, int expYear, int paymentCvv, double amount, String paymentDate, String customerEmail) throws SQLException {
    String query = "UPDATE APP.PAYMENT " + 
                   "SET PAYMENT_NAME_ON_CARD = '" + paymentNameOnCard + "', " +
                   "PAYMENT_CARD_NUMBER = '" + newPaymentCardNumber + "', " +
                   "PAYMENT_EXPIRY_MONTH = " + expMonth + ", " +
                   "PAYMENT_EXPIRY_YEAR = " + expYear + ", " +
                   "PAYMENT_CVV = " + paymentCvv + ", " +
                   "AMOUNT = " + amount + ", " +
                   "PAYMENT_DATE = '" + paymentDate + "' " +
                   "WHERE CUSTOMER_EMAIL = '" + customerEmail + "'";
    

    st.executeUpdate(query);
}     
//====================== STAFF=====================
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
