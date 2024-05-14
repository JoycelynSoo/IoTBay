<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Retrieve the orderID parameter from the request
    int orderID = Integer.parseInt(request.getParameter("orderID"));

    // JDBC code to delete the orderID from the table
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/shipment;create=true", "root", "root");

        // Prepare the SQL statement
        String sql = "DELETE FROM ROOT.SHIPMENT WHERE orderID = ?";
        pstmt = conn.prepareStatement(sql);

        // Set the orderID parameter
        pstmt.setInt(1, orderID);

        // Execute the update
        int rowsAffected = pstmt.executeUpdate();

        // Redirect back to the view shipments page
        response.sendRedirect("viewShipment.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
