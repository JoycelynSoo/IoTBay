<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Shipment" %>
<%@ page import="java.sql.*" %>

<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/shipment;create=true", "root", "root");

    Statement stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery("SELECT * FROM ROOT.SHIPMENT");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
    <title>View Shipments</title>
</head>

<body class="shipment-body">
    <header>
        <div class="shipment-header">
                <a href="viewShipment.jsp">close</a>

                <h1>Your Shipment Details</h1>

                <a href="createShipment.jsp">add</a>
        </div>
    </header>

    <div class="shipment-filler"></div>
    <% 
            while (rs.next()) {
                int SHIPMENTID = rs.getInt("SHIPMENTID");
                int ORDERID = rs.getInt("orderID");
                String method = rs.getString("method").replace("_", " ");
                String METHOD = method.substring(0, 1).toUpperCase() + method.substring(1).toLowerCase();
                Date DATE = rs.getDate("date");
                String ADDRESS = rs.getString("address");
                
                String orderIdDisplay = (ORDERID == 0 || rs.wasNull()) ? "no existing order" : String.valueOf(ORDERID);

    %>

    <div class="shipment-content">
        <table class="shipment-table">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Shipment Method</th>
                    <th>Date</th>
                    <th>Address</th>
                    <th>
                        <a href="updateShipment.jsp?orderID=<%= ORDERID %>">edit</a>
                        
                        <form action="deleteShipmentProcess.jsp" method="post" class="deleteBtn">
                            <input type="hidden" name="shipmentID" value="<%= SHIPMENTID %>">
                            <input type="submit" value="delete">
                        </form>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= orderIdDisplay %></td>
                    <td><%= METHOD %></td>
                    <td><%= DATE %></td>
                    <td colspan="2"><%= ADDRESS %></td>
                </tr>
            </tbody>
        </table>
        <%
            }
        %>
    </div>
    
    <footer class="shipment-footer">
        <div class="ship-footer">
            <p>
                IoTBay©
            </p>
        </div>
    </footer>
    </body>
</html>
