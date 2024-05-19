<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.Shipment" %>
<%@ page import="beans.dao.ShipmentDBManager" %>
<%@ page import="java.sql.Date" %>

<%
    String errorMessage = null;
    Shipment shipment = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        int shipmentID = Integer.parseInt(request.getParameter("shipmentID"));

        ShipmentDBManager shipmentDBManager = new ShipmentDBManager();
        shipment = shipmentDBManager.getShipmentById(shipmentID);

        if (shipment != null) {
            response.sendRedirect("viewShipment.jsp?shipmentID=" + shipmentID);
            return;
        } else {
            errorMessage = "Order ID not found. Please enter a valid order ID.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Track My Shipment</title>
    <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
</head>
<body class="shipment-body">
    <div class="ship-header-container">
        <div class="shipment-header">
            <a href="main.jsp">
                <img src="CSS/BackArrow.png" alt="Go Back to Shipments Page" class="ship-back-arrow">
            </a>
            
            <img src="CSS/IoTBay.png" alt="IoTBay Logo" class="ship-logo">
        
            <br></br>
        </div>
        
        <div class="ship-heading">
            <h1>Track My Shipment</h1>
        </div>
    </div>
        
    <br></br>

    <div class="shipment-content">
        
        <form method="post">
            <table class="shipment-table" style="width: 50%;">
                <tr>
                    <th style="text-align: left; width: 200px;"><label for="shipmentID">Enter Order ID:</label></th>
                    <td><input type="text" id="shipmentID" name="shipmentID" required></td>
                </tr>
            </table>
            <div class="ship-buttons-container">
                <button type="submit" class="ship-button">Track</button>
            </div>
        </form>
    </div>
    
    <% if (errorMessage != null) { %>
        <div class="ship-error-message"><%= errorMessage %></div>
    <% } %>

    <footer class="shipment-footer">
        <div class="ship-footer">
            <p>IoTBay©</p>
        </div>
    </footer>
</body>
</html>
