<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.dao.ShipmentDBManager" %>
<%@ page import="beans.Shipment" %>
<%@ page import="java.util.List" %>

<%
    String message = null;
    Shipment shipment = null;
    
    String shipmentIdParam = request.getParameter("shipmentID");
    if (shipmentIdParam != null) {
        try {
            int shipmentId = Integer.parseInt(shipmentIdParam);
            ShipmentDBManager shipmentManager = new ShipmentDBManager();
            shipment = shipmentManager.getShipmentById(shipmentId);
            if (shipment != null) {
                boolean deleted = false;
                if ("POST".equalsIgnoreCase(request.getMethod()) && "delete".equalsIgnoreCase(request.getParameter("action"))) {
                    deleted = shipmentManager.deleteShipment(shipmentId);
                    message = deleted ? "Shipment deleted successfully!" : "Error deleting shipment!";
                    response.sendRedirect("shipments.jsp");
                }
            } else {
                message = "Error: Shipment not found!";
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            message = "Error: Invalid shipment ID!";
        }
    } else {
        message = "Error: Shipment ID parameter missing!";
    }
    
    request.getSession().setAttribute("deleteMessage", message);
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
    <title>View Order #<%= shipment.getShipmentId() %></title>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to cancel this shipment?");
        }
    </script>
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
        <% if (shipment != null) { %>
        <table class="shipment-table">
            <tr>
                <th style="text-align: left; width: 200px;">Shipment Status</th>
                <td><%= shipment.getShipmentStatus() %></td>
            </tr>
            <tr>
                <th style="text-align: left;">Shipment Method</th>
                <td><%= shipment.getShipmentMethod() %></td>
            </tr>
            <tr>
                <th style="text-align: left;">Delivery Date</th>
                <td><%= shipment.getShipmentDate() %></td>
            </tr>
            <tr>
                <th style="text-align: left;">Address</th>
                <td><%= shipment.getShipmentAddress() %></td>
            </tr>
        </table>
        
        <br></br>
            
        <% if ("pending".equalsIgnoreCase(shipment.getShipmentStatus())) { %>
        <div class="ship-buttons-container">
            <form action="editShipment.jsp" method="get">
                <input type="hidden" name="shipmentID" value="<%= shipment.getShipmentId() %>">
                <button type="submit" class="ship-button">Edit Shipment</button>
            </form>
            <form action="viewShipment.jsp" method="post" onsubmit="return confirmDelete();">
                <input type="hidden" name="shipmentID" value="<%= shipment.getShipmentId() %>">
                <input type="hidden" name="action" value="delete">
                <button type="submit" class="ship-button">Cancel Shipment</button>
            </form>
        </div>
        <% } else { %>
        <br></br>
        <p class="ship-error-message">Shipment cannot be deleted or updated because its status is '<%= shipment.getShipmentStatus() %>'</p>
        <div class="ship-error-container">
            <a class="ship-error-confirm" href="shipments.jsp">Go Back</a>
        </div>
        <% } %>
        <% } else { %>
        <br></br>
        <p class="ship-error-message">Shipment not found or invalid Order ID</p>
        <div class="ship-error-container">
            <a class="ship-error-confirm" href="shipments.jsp">Go Back</a>
        </div>
        <% } %>
    </div>
    
    <footer class="shipment-footer">
        <div class="ship-footer">
            <p>IoTBay©</p>
        </div>
    </footer>
</body>
</html>
