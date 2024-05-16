/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans.dao;

import beans.User;
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

// ======================CRUD USER ACCESS LOGS======================
public void addLogout(String customerEmail, Timestamp logoutTime, Timestamp loginTime) throws SQLException {
    String query = ("UPDATE APP.ACCESSLOGS SET ACCESSLOGS_LOGOUT_TIME ='" + logoutTime + "' WHERE CUSTOMER_EMAIL='" + customerEmail +"' AND ACCESSLOGS_LOGIN_TIME='"+ loginTime + "'"); 
    st.executeUpdate(query); 
}
public void addLog(String customerEmail, Timestamp loginTime) throws SQLException {
    String query = "INSERT INTO APP.ACCESSLOGS (CUSTOMER_EMAIL, ACCESSLOGS_LOGIN_TIME) VALUES ('"+customerEmail+"', '"+loginTime+"')"; 
    st.executeUpdate(query); 
    }

public void insertLogoutTime(String customerEmail, Timestamp logoutTime) throws SQLException {
    String checkQuery = "SELECT * FROM APP.ACCESSLOGS WHERE CUSTOMER_EMAIL = '" + customerEmail + "' AND ACCESSLOGS_LOGOUT_TIME IS NULL";
    
    ResultSet result = st.executeQuery(checkQuery);

    if (result.next()) {
        String loginTime = result.getTimestamp("ACCESSLOGS_LOGIN_TIME").toString(); // Assuming column name is ACCESSLOGS_LOGIN_TIME
        String updateQuery = "UPDATE APP.ACCESSLOGS SET ACCESSLOGS_LOGOUT_TIME = '" + logoutTime + "' WHERE CUSTOMER_EMAIL = '" + customerEmail + "' AND ACCESSLOGS_LOGIN_TIME = '" + loginTime + "'";
        
        st.executeUpdate(updateQuery);
    }
}



  
}
