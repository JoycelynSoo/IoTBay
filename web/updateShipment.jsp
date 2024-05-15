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
    String fullAddress = rs.getString("address");
    
    String[] addressComponents = fullAddress.split(", ");
    String street = addressComponents[0];
    String suburb = addressComponents[1];
    String postcode = addressComponents[2];
    String state = addressComponents[3];
    String country = addressComponents[4];
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
            
            <table>
                <tr>
                    <td><label for="method">Shipment Method:</label></td>
                    <td>
                        <select id="method" name="method">
                            <option value="click_and_collect" <%= method.equals("click_and_collect") ? "selected" : "" %>>Click and Collect</option>
                            <option value="delivery" <%= method.equals("delivery") ? "selected" : "" %>>Delivery</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="street">Street:</label></td>
                    <td><input type="text" id="street" name="street" value="<%= street %>"></td>
                </tr>
                <tr>
                    <td><label for="suburb">Suburb:</label></td>
                    <td><input type="text" id="suburb" name="suburb" value="<%= suburb %>"></td>
                </tr>
                <tr>
                    <td><label for="postcode">Postcode:</label></td>
                    <td><input type="text" id="postcode" name="postcode" value="<%= postcode %>"></td>
                </tr>
                <tr>
                    <td><label for="state">State:</label></td>
                    <td><input type="text" id="state" name="state" value="<%= state %>"></td>
                </tr>
                <tr>
                    <td><label for="country">Country:</label></td>
                    <td><input type="text" id="country" name="country" value="<%= country %>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Update"></td>
                </tr>
            </table>
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
