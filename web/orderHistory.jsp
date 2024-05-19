<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.dao.DBManager" %>
<%@ page import="beans.model.Order" %>

<%
    String userId = request.getParameter("userId");
    DBManager dbManager = new DBManager();
    List<Order> orders = dbManager.getOrdersByUser(userId);
    request.setAttribute("orders", orders);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <link rel="stylesheet" href="CSS/Products.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }

        h1 {
            color: #333;
        }

        #cartTableContainer {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #cartTable {
            width: 100%;
            table-layout: fixed;
        }

        #cartTable th,
        #cartTable td {
            padding: 1em;
            box-sizing: border-box;
        }

        #cartTable th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        #cartTable tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .cta-link {
            display: inline-block;
            padding: 0.5em 1em;
            background-color: #00AB66;
            color: #fff;
            border: none;
            border-radius: 0.25em;
            text-decoration: none;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            transition: background-color 0.2s ease-in-out;
            float: right;
            margin-left: 1em;
            margin-bottom: 30px;
        }

        .spacer {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Order History</h1>
    <div id="cartTableContainer">
        <table id="cartTable">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.total}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="spacer"></div>
    <a class="cta-link" href="orderForm.jsp">Create New Order</a>
</body>
</html>
