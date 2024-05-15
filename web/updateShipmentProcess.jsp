<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/shipment;create=true", "root", "root");

        String orderIDStr = request.getParameter("orderID");
        int orderID = Integer.parseInt(orderIDStr);

        String method = request.getParameter("method");
        String street = request.getParameter("street");
        String suburb = request.getParameter("suburb");
        String postcode = request.getParameter("postcode");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        String address = street + ", " + suburb + ", " + postcode + ", " + state + ", " + country;

        stmt = conn.prepareStatement("UPDATE ROOT.SHIPMENT SET method = ?, address = ? WHERE orderID = ?");
        stmt.setString(1, method);
        stmt.setString(2, address);
        stmt.setInt(3, orderID);

        int rowsAffected = stmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("viewShipment.jsp");
        } else {
            out.println("Failed to update shipment.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
