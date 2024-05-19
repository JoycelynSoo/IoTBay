<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Order</title>
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

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }

        form p {
            margin-bottom: 15px;
        }

        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        form input[type="text"],
        form input[type="date"],
        form input[type="submit"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        form input[type="submit"] {
            background-color: #00AB66;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            transition: background-color 0.2s ease-in-out;
        }

        form input[type="submit"]:hover {
            background-color: #008f57;
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

        #cartTable .product-name {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        #cartTable .price,
        #cartTable .quantity,
        #cartTable .total {
            text-align: right;
        }

        #cartTable .quantity input {
            width: 50px;
            text-align: center;
        }

        #cartTable .remove-cell {
            text-align: right;
            white-space: nowrap;
        }

        #cartTable .remove-cell div {
            display: inline-block;
            width: 20px;
            height: 20px;
            line-height: 20px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            color: #f00;
            border-radius: 50%;
            background-color: #fff;
            margin-right: 10px;
        }

        #cartTable .remove-cell div:hover {
            background-color: #f00;
            color: #fff;
        }

        #cartTotal {
            font-size: 1.5em;
            font-weight: bold;
            padding: 1em;
            text-align: right;
        }

        .cta-link, .check-link {
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
    
    <h1>Create Order</h1>
    
    <form action="data" method="post">
        
        <input type="hidden" name="action" value="create" />
        <input type="hidden" name="userId" value="${userId}" />
        
        <p>
            <label for="orderId">Order ID:</label>
            <input type="text" id="orderId" name="orderId" required />
        </p>
        
        <p>
            <label for="orderDate">Order Date:</label>
            <input type="date" id="orderDate" name="orderDate" required />
        </p>
        
         <p>
            <label for="total">Total:</label>
            <input type="text" id="total" name="total" required />
        </p>
        
    <input type="submit" value="Submit" />
    
    </form>

</body>

</html>
