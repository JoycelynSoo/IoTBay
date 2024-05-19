package beans.controller;

import beans.dao.*;
import java.sql.*;
import java.util.*;
import java.util.logging.*;
import beans.*;

public class test {

    private static final Scanner in = new Scanner(System.in);

    public static void main(String[] args) {
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            System.out.print("Staff ID: ");
            int staffId = in.nextInt();

            System.out.print("First name: ");
            String firstName = in.nextLine();

            System.out.print("Last name: ");
            String lastName = in.nextLine();

            System.out.print("Staff email: ");
            String email = in.nextLine();

            System.out.print("Staff position: ");
            String position = in.nextLine();

            System.out.print("Staff address: ");
            String address = in.nextLine();

            System.out.print("Staff status (true/false): ");
            boolean status = in.nextBoolean();
            in.nextLine();

            db.updateStaff(staffId, firstName, lastName, email, position, address, status);
            System.out.println("Staff updated!");
            connector.closeConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
