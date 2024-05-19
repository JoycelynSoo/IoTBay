<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.Shipment" %>
<%@ page import="beans.dao.ShipmentDBManager" %>
<%@ page import="java.sql.Date" %>

<%
    int shipmentId = Integer.parseInt(request.getParameter("shipmentID"));
    ShipmentDBManager shipmentDBManager = new ShipmentDBManager();
    Shipment shipment = shipmentDBManager.getShipmentById(shipmentId);

    if (shipment == null) {
        out.println("<h3>Shipment not found!</h3>");
        return;
    }

    String errorMessage = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        if ("pending".equalsIgnoreCase(shipment.getShipmentStatus())) {
            String shipmentAddress = request.getParameter("shipmentAddress");

            shipment.setShipmentAddress(shipmentAddress);

            shipmentDBManager.updateShipment(shipment);

            response.sendRedirect("viewShipment.jsp?shipmentID=" + shipment.getShipmentId());
            return;
        } else {
            errorMessage = "Only shipments with 'pending' status can be edited.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
    <title>Edit Order #<%= shipment.getShipmentId() %></title>
</head>
<body class="shipment-body">
    <div class="ship-header-container">
        <div class="shipment-header">
            <a href="shipments.jsp">
                <img src="CSS/BackArrow.png" alt="Go Back to Shipments Page" class="ship-back-arrow">
            </a>
            
            <img src="CSS/IoTBay.png" alt="IoTBay Logo" class="ship-logo">
        
            <br></br>
        </div>
        
        <div class="ship-heading">
            <h1>Order #<%= shipment.getShipmentId() %></h1>
        </div>
    </div>
        
    <br></br>

    <div class="shipment-content">
        <% if (errorMessage != null) { %>
            <div class="error-message"><%= errorMessage %></div>
            <div class="form-group">
                <button onclick="window.location.href='shipments.jsp'">Go Back</button>
            </div>
        <% } else { %>
            <form method="post" action="editShipment.jsp?shipmentID=<%= shipment.getShipmentId() %>">
                <table class="shipment-table">
                    <tr>
                        <th style="text-align: left; width: 200px;"><label for="shipmentStatus">Shipment Status:</label></th>
                        <td><input type="text" id="shipmentStatus" name="shipmentStatus" value="<%= shipment.getShipmentStatus() %>" readonly></td>
                    </tr>
                    <tr>
                        <th style="text-align: left;"><label for="shipmentMethod">Shipment Method:</label></th>
                        <td><input type="text" name="shipmentMethod" value="<%= shipment.getShipmentMethod() %>" readonly></td>
                    </tr>
                    <tr>
                        <th style="text-align: left;"><label for="shipmentDate">Shipment Date:</label></th>
                        <td><input type="date" id="shipmentDate" name="shipmentDate" value="<%= shipment.getShipmentDate().toString() %>" readonly></td>
                    </tr>
                    <tr>
                        <th style="text-align: left;"><label for="shipmentAddress">Shipment Address:</label></th>
                        <td><input type="text" id="shipmentAddress" name="shipmentAddress" value="<%= shipment.getShipmentAddress() %>" <%= "pending".equalsIgnoreCase(shipment.getShipmentStatus()) ? "" : "readonly" %>></td>
                    </tr>
                </table>
                <% if ("pending".equalsIgnoreCase(shipment.getShipmentStatus())) { %>
                    <div class="ship-buttons-container">
                        <button type="submit" class="ship-button">Update</button>
                        <button type="button" class="ship-button" onclick="window.location.href='shipments.jsp'">Cancel</button>
                    </div>
                <% } %>
            </form>
        <% } %>
    </div>

    <footer class="shipment-footer">
        <div class="ship-footer">
            <p>IoTBay©</p>
        </div>
    </footer>
</body>
</html>
