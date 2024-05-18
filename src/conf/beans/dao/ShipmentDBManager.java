package beans.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import beans.Shipment;

public class ShipmentDBManager {
    private static final String DB_URL = "jdbc:derby://localhost:1527/iotbay";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public List<Shipment> getAllShipments() {
        List<Shipment> shipments = new ArrayList<>();
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Database connection successful.");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM ROOT.SHIPMENTS"); 
            
            while (rs.next()) {
                int shipmentId = rs.getInt("shipmentid");
                String shipmentStatus = rs.getString("shipmentStatus");
                String method = rs.getString("shipmentmethod").replace("_", " ");
                String capitalizedMethod = method.substring(0, 1).toUpperCase() + method.substring(1).toLowerCase();
                Date date = rs.getDate("shipmentdate");
                String address = rs.getString("shipmentaddress");

                Shipment shipment = new Shipment(shipmentId, shipmentStatus, capitalizedMethod, date, address);
                shipments.add(shipment);
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return shipments;
    }

    public Shipment getShipmentById(int shipmentId) {
        Shipment shipment = null;
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Database connection successful.");

            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM ROOT.SHIPMENTS WHERE shipmentid = ?");
            pstmt.setInt(1, shipmentId);
            ResultSet rs = pstmt.executeQuery(); 
            
            if (rs.next()) {
                String shipmentStatus = rs.getString("shipmentStatus");
                String method = rs.getString("shipmentmethod").replace("_", " ");
                String capitalizedMethod = method.substring(0, 1).toUpperCase() + method.substring(1).toLowerCase();
                Date date = rs.getDate("shipmentdate");
                String address = rs.getString("shipmentaddress");

                shipment = new Shipment(shipmentId, shipmentStatus, capitalizedMethod, date, address);
            }
            
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shipment;
    }
    
    public boolean createShipment(int shipmentID, String shipmentMethod, String shipmentAddress, Date shipmentDate) {
        boolean shipmentCreated = false;
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String query = "INSERT INTO ROOT.SHIPMENTS (shipmentID, shipmentStatus, shipmentMethod, shipmentDate, shipmentAddress) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, shipmentID);
            pstmt.setString(2, "pending"); 
            pstmt.setString(3, shipmentMethod.replace(" ", "_").toUpperCase());
            pstmt.setDate(4, shipmentDate);
            pstmt.setString(5, shipmentAddress);

            int rowsAffected = pstmt.executeUpdate();
            shipmentCreated = (rowsAffected > 0);

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shipmentCreated;
    }
    
    public boolean deleteShipment(int shipmentId) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = conn.prepareStatement("DELETE FROM ROOT.SHIPMENTS WHERE shipmentid = ?");
            stmt.setInt(1, shipmentId);

            int rowsAffected = stmt.executeUpdate();

            stmt.close();
            conn.close();
            
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static void updateShipment(Shipment shipment) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE ROOT.SHIPMENTS SET shipmentStatus = ?, shipmentMethod = ?, shipmentDate = ?, shipmentAddress = ? WHERE shipmentId = ?");
            stmt.setString(1, shipment.getShipmentStatus());
            stmt.setString(2, shipment.getShipmentMethod().replace(" ", "_").toUpperCase());
            stmt.setDate(3, shipment.getShipmentDate());
            stmt.setString(4, shipment.getShipmentAddress());
            stmt.setInt(5, shipment.getShipmentId());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Shipment updated successfully.");
            } else {
                System.out.println("Failed to update shipment.");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
