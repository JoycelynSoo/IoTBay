package beans.controller;

import beans.dao.DBConnector;
import beans.dao.DBManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class testing {
    private static final Scanner in = new Scanner(System.in);

    public static void main(String[] args) {
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            System.out.print("Shipment ID: ");
            String shipmentId = in.nextLine();

            System.out.print("Shipment Method: ");
            String shipmentMethod = in.nextLine();

            System.out.print("Shipment Address: ");
            String shipmentAddress = in.nextLine();

            db.updateShipment(shipmentId, shipmentMethod, shipmentAddress);
            System.out.println("Shipment updated!");
            connector.closeConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(testing.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
