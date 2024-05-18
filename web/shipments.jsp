<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="beans.dao.ShipmentDBManager" %>
<%@ page import="beans.Shipment" %>

<%
    ShipmentDBManager shipmentManager = new ShipmentDBManager();
    List<Shipment> shipments = shipmentManager.getAllShipments();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
    <title>Your Shipments</title>
</head>

<body class="shipment-body">
    <header class="ship-header-container">
        <div class="shipment-header">
            <a href="main.jsp">
                <img src="CSS/BackArrow.png" alt="Go Back to Main Page" class="ship-back-arrow">
            </a>
            
            <img src="CSS/IoTBay.png" alt="IoTBay Logo" class="ship-logo">
            
            <br></br>
        </div>
        
        <div class="ship-heading">
            <h1>Your Shipments</h1>
        </div>
    </header>
    
    <br></br>

    <div class="shipment-content">
        <table class="shipment-table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Shipment Status</th>
                    <th>Shipment Method</th>
                    <th>Delivery Date</th>
                    <th colspan="2">Address</th>
                </tr>
            </thead>
            <tbody>
                <% for (Shipment shipment : shipments) { %>
                <tr>
                    <td><%= (shipment.getShipmentId() == 0) ? "no existing order" : shipment.getShipmentId() %></td>
                    <td><%= shipment.getShipmentStatus() %></td>
                    <td><%= shipment.getShipmentMethod() %></td>
                    <td><%= shipment.getShipmentDate() %></td>
                    <td><%= shipment.getShipmentAddress() %></td>
                    <td>
                        <a href="viewShipment.jsp?shipmentID=<%= shipment.getShipmentId() %>" class="view-button">view</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
            
    <br></br>
    
    <footer class="shipment-footer">
        <div class="ship-footer">
            <p>IoTBay©</p>
        </div>
    </footer>
</body>
</html>
