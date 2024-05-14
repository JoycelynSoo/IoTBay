<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/shipment;create=true", "root", "root");

        int highestShipmentId = 0;
        stmt = conn.prepareStatement("SELECT MAX(shipmentid) FROM ROOT.SHIPMENT");
        rs = stmt.executeQuery();
        if (rs.next()) {
            highestShipmentId = rs.getInt(1);
        }

        int nextShipmentId = highestShipmentId + 1;

        String method = request.getParameter("method");
        String street = request.getParameter("street");
        String suburb = request.getParameter("suburb");
        String postcode = request.getParameter("postcode");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        String address = street + ", " + suburb + ", " + postcode + ", " + state + ", " + country;

        java.util.Date currentDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());

        stmt = conn.prepareStatement("INSERT INTO ROOT.SHIPMENT (shipmentid, method, address, date, orderid) VALUES (?, ?, ?, ?, null)");
        stmt.setInt(1, nextShipmentId);
        stmt.setString(2, method);
        stmt.setString(3, address);
        stmt.setDate(4, sqlDate);

        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("viewShipment.jsp");
        } else {
            out.println("Failed to add shipment.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
