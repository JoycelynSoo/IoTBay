<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<%@ page import="beans.Shipment" %>
<%@ page import="beans.dao.ShipmentDBManager" %>

<%
try {
    if (request.getMethod().equals("POST")) {
        int shipmentId = (int) (Math.random() * 10000); // Adjust as needed

        String shipmentStatus = "Pending";

        String shipmentAddress = request.getParameter("shipmentAddress");
        String shipmentMethod = request.getParameter("shipmentMethod");

        Date shipmentDate = new Date(System.currentTimeMillis());

        Shipment shipment = new Shipment(shipmentId, shipmentStatus, shipmentMethod, shipmentDate, shipmentAddress);

        ShipmentDBManager.createShipment(shipment);

        response.sendRedirect("payment.jsp");
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Shipment</title>
    <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
</head>

<body class="shipment-body">
    <header class="ship-header-container">
        <div class="shipment-header">
            <a href="cart.jsp">
                <img src="CSS/BackArrow.png" alt="Go Back to Shipments Page" class="ship-back-arrow">
            </a>
            
            <img src="CSS/IoTBay.png" alt="IoTBay Logo" class="ship-logo">
            
            <br></br>
        </div>
        
        <div class="ship-heading">
            <h1>Check Out</h1>
        </div>
    </header>
        
    <br></br>
    
    <div class="shipment-content">
        <form method="post">
            <table class="shipment-table" style="width: 60%;">
                <tr>
                    <th style="text-align: left; width: 200px;"><label for="shipmentId">Shipment ID:</label></th>
                    <td><input type="text" id="shipmentId" name="shipmentId" value="<%= (int) (Math.random() * 10000) %>" readonly></td>
                </tr>
                <tr>
                    <th style="text-align: left; width: 200px;"><label for="shipmentStatus">Shipment Status:</label></th>
                    <td><input type="text" id="shipmentStatus" name="shipmentStatus" value="Pending" readonly></td>
                </tr>
                <tr>
                    <th style="text-align: left; width: 200px;"><label for="shipmentAddress">Shipment Address:</label></th>
                    <td><input type="text" id="shipmentAddress" name="shipmentAddress" required></td>
                </tr>
                <tr>
                    <th style="text-align: left; width: 200px;"><label for="shipmentMethod">Shipment Method:</label></th>
                    <td>
                        <select id="shipmentMethod" name="shipmentMethod" required>
                            <option value="Standard">Standard</option>
                            <option value="Express">Express</option>
                        </select>
                    </td>
                </tr>
            </table>
            <div class="ship-buttons-container">
                <button type="submit" class="ship-button">Create Shipment</button>
            </div>
        </form>
    </div>
                
    <footer class="shipment-footer">
        <div class="ship-footer">
            <p>IoTBay©</p>
        </div>
    </footer>
</body>
</html>
