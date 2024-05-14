<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Create New Shipment</title>
</head>

<body class="shipment-body">
    <header>
        <div class="shipment-header">
                <a href="viewShipment.jsp">close</a>

                <h1>Create New Shipment</h1>

                <br></br>
        </div>
    </header>
    
    
    <div class="ship-create-content">
        <form action="createShipmentProcess.jsp" method="post">
            <table>
                <tr>
                    <td><label for="method">Shipment Method:</label></td>
                    <td>
                        <select id="method" name="method">
                            <option value="click_and_collect">Click and Collect</option>
                            <option value="delivery">Delivery</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="street">Street:</label></td>
                    <td><input type="text" id="street" name="street"></td>
                </tr>
                <tr>
                    <td><label for="suburb">Suburb:</label></td>
                    <td><input type="text" id="suburb" name="suburb"></td>
                </tr>
                <tr>
                    <td><label for="postcode">Postcode:</label></td>
                    <td><input type="text" id="postcode" name="postcode"></td>
                </tr>
                <tr>
                    <td><label for="state">State:</label></td>
                    <td><input type="text" id="state" name="state"></td>
                </tr>
                <tr>
                    <td><label for="country">Country:</label></td>
                    <td><input type="text" id="country" name="country"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Add Shipment"></td>
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
