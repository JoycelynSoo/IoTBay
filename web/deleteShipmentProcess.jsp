<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    int shipmentID = Integer.parseInt(request.getParameter("shipmentID"));

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/shipment;create=true", "root", "root");

        String sql = "DELETE FROM ROOT.SHIPMENT WHERE SHIPMENTID = ?";
        pstmt = conn.prepareStatement(sql);

        pstmt.setInt(1, shipmentID);

        int rowsAffected = pstmt.executeUpdate();

        response.sendRedirect("viewShipment.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
