/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package beans.controller;

 import java.sql.Timestamp;


import beans.dao.DBConnector;
import beans.dao.DBManager;
import java.sql.*;

import java.util.*;

import java.util.logging.*;

 

public class testing {

private static final Scanner in = new Scanner(System.in);

public static void main(String[] args) {

try {

DBConnector connector = new DBConnector();

Connection conn = connector.openConnection();

DBManager db = new DBManager(conn);


System.out.print("User email: ");

String email = in.nextLine();

System.out.print("User login time: ");

String inputTime = in.nextLine(); 
Timestamp time = Timestamp.valueOf(inputTime);

db.insertLogoutTime(email, time);
 /*

System.out.print("User email: ");

String email = in.nextLine();

System.out.print("User password: ");

String password = in.nextLine();

System.out.print("First name: ");

String firstName = in.nextLine();

System.out.print("Last name: ");

String lastName = in.nextLine();

System.out.print("User DOB: ");

String dob = in.nextLine();

db.updateUser(firstName, lastName, email, dob, password);
System.out.println("User updated!");
connector.closeConnection();
*/
 

} catch (ClassNotFoundException | SQLException ex) {

Logger.getLogger(testing.class.getName()).log(Level.SEVERE, null, ex);

}

}

}