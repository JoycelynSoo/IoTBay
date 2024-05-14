<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/shipment;create=true", "root", "root");
    
    String orderIDStr = request.getParameter("orderID");
    int orderID = Integer.parseInt(orderIDStr);
    String method = request.getParameter("method");
    String address = request.getParameter("address");

    PreparedStatement stmt = conn.prepareStatement("UPDATE ROOT.SHIPMENT SET method = ?, address = ? WHERE orderID = ?");
    stmt.setString(1, method);
    stmt.setString(2, address);
    stmt.setInt(3, orderID);

    int rowsAffected = stmt.executeUpdate();

    if (rowsAffected > 0) {
        response.sendRedirect("viewShipment.jsp");
    } else {
        out.println("Failed to update shipment.");
    }

    stmt.close();
    conn.close();
%>
