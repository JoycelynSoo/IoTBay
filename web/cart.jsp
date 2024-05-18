<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="CSS/Products.css">
    
    <style>
        #cartTable {
          width: 100%;
          border-collapse: collapse;
          table-layout: fixed;
        }

        #cartTable th,
        #cartTable td {
          padding: 1em;
          border: 1px solid #ddd;
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

        .cta-link,.check-link {
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

    </style>

</head>

<body>
    <header class="header">
         <div class="nav-bar">
            <!-- Centered Logo -->
            <div class="logo">
                <a href="main.jsp"><img src="CSS/IoTBay.png" alt="Main" class="logo"></a>
            </div>
            <!-- Account Management Icons -->

                <table class="account-mgmt">
                    <tr>
                      <td>
                        <a href="login.jsp"><img src="CSS/account.png" alt="account"></a>
                      </td>
                      <td>
                        <a href="cart.jsp"><img src="CSS/shoppingcart.png" alt="cart"></a>
                      </td>
                    </tr>
                  </table>
        </div>
        
   
        <!-- Browse Bar -->
        <div class="browse-bar">
            <a href="SMH.jsp">Smart Home</a>
            <a href="SS.jsp">Security & Surveillance</a>
            <a href="ENT.jsp">Entertainment</a>
            <a href="HnW.jsp">Health & Wellness</a>
            <a href="other.jsp">Other</a>
        </div>
        

        
        <h1>Your Cart</h1>
        
    </header>
  
    <main>
        
<<<<<<< HEAD
        <a href="checkout.jsp" class="cta-link">Proceed to Checkout</a>
=======
        <a href="checkour.jsp" class="cta-link">Proceed to Checkout</a>
        <a href="payment.jsp" class="cta-link">Add payment method</a>
>>>>>>> bd9d7ab107d9d7dc7d860a35f202741f77960031

        
 <div id="cartTableContainer">
    <table id="cartTable">
      <thead>
        <tr>
          <th>Product</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Total</th>
          <th>Remove</th>
        </tr>
      </thead>
      <tbody>
        <!-- The cart items will be displayed here -->
      </tbody>
      <tfoot>
        <tr>
          <td colspan="3"></td>
          <td id="cartTotal">$0.00</td>

        </tr>
      </tfoot>
    </table>
</div>
       

    </main>


<script>
// Retrieve the cart data from local storage
var cartJson = localStorage.getItem('cart');

// Convert the cart JSON string to an array
var cart = JSON.parse(cartJson) || [];

// Display the cart data in the table
var cartTableBody = document.querySelector("#cartTable tbody");

// Remove any existing cart items
cartTableBody.innerHTML = "";

// Calculate the total price of the cart
var totalPrice = 0;

// Display each cart item
for (let i = 0; i < cart.length; i++) {
  let product = cart[i];

  // Create a new row for the cart item
  let row = document.createElement("tr");

  // Create the product cell
  let productCell = document.createElement("td");
  productCell.textContent = product.name;
  row.appendChild(productCell);

  // Create the price cell
  let priceCell = document.createElement("td");
  let priceSpan = document.createElement("span");
  priceSpan.textContent = "$" + product.price.toFixed(2);
  priceCell.appendChild(priceSpan);
  row.appendChild(priceCell);

  // Create the quantity cell
  let quantityCell = document.createElement("td");
  let quantityInput = document.createElement("input");
  quantityInput.type = "number";
  quantityInput.min = "1";
  quantityInput.value = product.quantity;
  quantityCell.appendChild(quantityInput);
  row.appendChild(quantityCell);

  // Create the total cell
  let totalCell = document.createElement("td");
  totalCell.textContent = "$" + (product.price * product.quantity).toFixed(2);
  row.appendChild(totalCell);

  // Create the remove cell
  let removeCell = document.createElement("td");
  let removeX = document.createElement("div");
  removeX.textContent = "❌";
  removeX.style.cursor = "pointer";
  removeX.addEventListener("click", function() {
    removeFromCart(i);
  });
  removeCell.appendChild(removeX);
  row.appendChild(removeCell);

  // Add the row to the cart table body
  cartTableBody.appendChild(row);

  // Add the product price to the total price
  totalPrice += product.price * product.quantity;

  // Add an event listener to the quantity input
  quantityInput.addEventListener("input", function() {
    // Calculate the new total price
    let newTotalPrice = 0;
    for (let j = 0; j < cart.length; j++) {
      let cartItem = cart[j];
      let quantity = document.querySelectorAll("#cartTable tbody tr")[j].querySelector("input[type='number']").value;
      newTotalPrice += cartItem.price * quantity;
    }

    // Update the cart total element
    document.querySelector("#cartTotal").textContent = "$" + newTotalPrice.toFixed(2);
  });
}

// Display the total price
document.querySelector("#cartTotal").textContent = "$" + totalPrice.toFixed(2);

// Define the removeFromCart function
function removeFromCart(index) {
  // Remove the item from the cart array
  cart.splice(index, 1);

  // Convert the cart array to a JSON string
  var cartJson = JSON.stringify(cart);

  // Store the cart JSON string in local storage
  localStorage.setItem('cart', cartJson);

  // Refresh the cart page to display the updated cart data
  location.reload();
}
</script>