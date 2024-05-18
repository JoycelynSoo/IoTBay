/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans.controller;

import beans.Payment;
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




System.out.print("paymentNameOnCard: ");
String paymentNameOnCard = in.nextLine();

System.out.print("paymentCardNumber: ");
String paymentCardNumber = in.nextLine();

System.out.print("paymentExpiryMonth: ");
int paymentExpiryMonth = Integer.parseInt(in.nextLine());

System.out.print("paymentExpiryYear: ");
int paymentExpiryYear = Integer.parseInt(in.nextLine());

System.out.print("paymentCVV: ");
int paymentCVV = Integer.parseInt(in.nextLine());

System.out.print("amt: ");
double amount = Double.parseDouble(in.nextLine());

System.out.print("date: ");
java.util.Date paymentDate = new java.util.Date(System.currentTimeMillis());

System.out.print("customerEmail: ");
String customerEmail = in.nextLine();


db.addPayment(paymentNameOnCard, paymentCardNumber, paymentExpiryMonth, paymentExpiryYear, paymentCVV, amount, paymentDate, customerEmail);


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