package beans.dao;

import beans.Shipment;
import java.sql.*;
import java.util.ArrayList; 

public class DBManager {

    private final Connection conn;

    public DBManager(Connection conn) {       
        this.conn = conn;
    }

    public Shipment findShipment(String shipmentId) throws SQLException {       
        String query = "SELECT * FROM ROOT.SHIPMENT WHERE SHIPMENTID = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, shipmentId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String shipmentMethod = rs.getString("SHIPMENTMETHOD");
                    String shipmentAddress = rs.getString("SHIPMENTADDRESS");
                    return new Shipment(shipmentId, null, shipmentMethod, null, shipmentAddress);
                }
            }
        }
        return null;
    }

    public void addShipment(Shipment shipment) throws SQLException {                   
        String query = "INSERT INTO ROOT.SHIPMENT (SHIPMENTID, SHIPMENTMETHOD, SHIPMENTADDRESS) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, shipment.getShipmentId());
            pstmt.setString(2, shipment.getShipmentMethod());
            pstmt.setString(3, shipment.getShipmentAddress());
            pstmt.executeUpdate();
        }
    }

    public void updateShipment(String shipmentId, String shipmentMethod, String shipmentAddress) throws SQLException {       
        String query = "UPDATE ROOT.SHIPMENT SET SHIPMENTMETHOD = ?, SHIPMENTADDRESS = ? WHERE SHIPMENTID = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, shipmentMethod);
            pstmt.setString(2, shipmentAddress);
            pstmt.setString(3, shipmentId);
            pstmt.executeUpdate();
        }
    }       

    public void deleteShipment(String shipmentId) throws SQLException {       
        String query = "DELETE FROM ROOT.SHIPMENT WHERE SHIPMENTID = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, shipmentId);
            pstmt.executeUpdate();
        }
    }

    public ArrayList<Shipment> fetchShipments() throws SQLException {
        String query = "SELECT * FROM ROOT.SHIPMENT";
        ArrayList<Shipment> shipments = new ArrayList<>();
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                String shipmentId;
                shipmentId = rs.getString("SHIPMENTID");
                String shipmentMethod = rs.getString("SHIPMENTMETHOD");
                String shipmentAddress = rs.getString("SHIPMENTADDRESS");
                shipments.add(new Shipment(null, null, shipmentMethod,null, shipmentAddress));
            }
        }
        return shipments;
    }
}
