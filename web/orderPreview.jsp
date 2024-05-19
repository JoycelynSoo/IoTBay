<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Preview</title>
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

        table {
            width: 100%;
            max-width: 600px;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .button {
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 10px;
            background-color: #00AB66;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }

        .button:hover {
            background-color: #008f57;
        }
    </style>
</head>
<body>
    <h1>Order Preview</h1>
    <table>
        <tr>
            <th>Order ID</th>
            <td>${param.orderId}</td>
        </tr>
        <tr>
            <th>Order Date</th>
            <td>${param.orderDate}</td>
        </tr>
        <tr>
            <th>Total</th>
            <td>${param.total}</td>
        </tr>
    </table>
    <form action="/IOTBay/data" method="post">
    <input type="hidden" name="action" value="create" />
    <input type="hidden" name="orderId" value="${param.orderId}" />
    <input type="hidden" name="orderDate" value="${param.orderDate}" />
    <input type="hidden" name="total" value="${param.total}" />
    <input class="button" type="submit" value="Submit Order" />
</form>
    <a class="button" href="orderForm.jsp">Edit Order</a>
</body>
</html>
