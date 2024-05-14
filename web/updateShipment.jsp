<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/shipment;create=true", "root", "root");

    String orderIDStr = request.getParameter("orderID");
    int orderID = Integer.parseInt(orderIDStr);

    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM ROOT.SHIPMENT WHERE orderID = ?");
    stmt.setInt(1, orderID);
    ResultSet rs = stmt.executeQuery();
    rs.next();

    String method = rs.getString("method");
    String address = rs.getString("address");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
        <title>Edit Shipment</title>
    </head>
    
    <body class="shipment-body">
        <header>
            <div class="shipment-header">
                <a href="main.jsp">exit</a>

                <h1>Editing Order #<%= orderID %></h1>
                
                <br></br>
            </div>
        </header>

        <div class="ship-update-content">
            <form action="updateShipmentProcess.jsp" method="POST">
                <input type="hidden" name="orderID" value="<%= orderID %>">
                
                <label for="method">Shipment Method:</label>
                <select id="method" name="method">
                    <option value="click_and_collect">Click and Collect</option>
                    <option value="delivery">Delivery</option>
                </select>

                <br><br>


                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= address %>"><br><br>

                <input type="submit" value="Update">
            </form>
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
