<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    // Load the Derby JDBC driver
    Class.forName("org.apache.derby.jdbc.ClientDriver");

    // Establish a connection to the database
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/IOTBAY;create=true", "root", "root");

    // Create a statement to execute queries
    Statement stmt = conn.createStatement();

    // Get the search query from the request
    String searchQuery = request.getParameter("searchQuery");

    // Execute a query to retrieve products from the database
    ResultSet rs;
    if (searchQuery!= null &&!searchQuery.isEmpty()) {
        // Search query is not empty, execute a search query
        rs = stmt.executeQuery("SELECT * FROM APP.products WHERE PRODUCT_NAME LIKE '%" + searchQuery + "%' OR PRODUCT_DESCRIPTION LIKE '%" + searchQuery + "%'");
    } else {
        // No search query, retrieve all products with category_name = 'OTHER'
        rs = stmt.executeQuery("SELECT * FROM APP.products WHERE category_name = 'ENT'");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Page</title>
    <link rel="stylesheet" href="CSS/Products.css">
</head>

<body>
    <header>
         <div class="nav-bar">
            <!-- Centered Logo -->
            <div class="logo">
                <a href="main.jsp"><img src="CSS/IoTBay.png" alt="Main" class="logo"></a>
            </div>
            <!-- Account Management Icons -->

                <table class="account-mgmt">
                    <tr>
                    <td>
                          <div class="account-dropdown">
                        <a href="welcome.jsp"> <img src="CSS/account.png" alt="account"></a>
                            <div class="account-dropdown-content">
                                <a href="shipments.jsp">Track Order</a>
                                <a href="welcome.jsp">Details</a>
                            </div>
                          </div>
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
                
        <div class="search-bar">
            <form action="search.jsp" method="post">
                <input type="text" id="searchInput" name="searchQuery" placeholder="Search all products...">
            </form>
        </div>
        
        <h1>Entertainment Products</h1>

        
    </header>

     <main>
         

         
       <%
          while (rs.next()) {
            String productid = rs.getString("PRODUCT_ID");
            String productName = rs.getString("PRODUCT_NAME");
            String productDescription = rs.getString("PRODUCT_DESCRIPTION");
            double productPrice = rs.getDouble("PRODUCT_PRICE");
            String productImage = rs.getString("PRODUCT_IMAGE");

            // Display product information
            out.println("<section class='product'>");
            out.println("<h2>" + productName + "</h2>");
            out.println("<img src='" + productImage + "' alt='Product Image'>");
            out.println("<p>" + productDescription + "</p>");
            out.println("<span class='price'>$" + productPrice + "</span>");

            out.println("<button type='button' class='addToCartButton' onclick='addToCart(\"" + productid + "\", \"" + productName + "\", " + productPrice + ")'>Add to cart</button>");

            out.println("</section>");
          }
        %>

         
    </main>

<script>
  // Declare a global array variable to store the product details
  var cart = [];

  function addToCart(productId, productName, productPrice) {
  // Retrieve the cart data from local storage
  var cartJson = localStorage.getItem('cart');

  // Convert the cart JSON string to an array
  var cart = JSON.parse(cartJson) || [];

  // Check if the product is already in the cart
  var productIndex = cart.findIndex(function(item) {
    return item.productId === productId;
  });

  // If the product is already in the cart, increment the quantity
  if (productIndex !== -1) {
    cart[productIndex].quantity++;
  } else {
    // Otherwise, add a new object to the cart array
    cart.push({
      productId: productId,
      name: productName,
      price: productPrice,
      quantity: 1
    });
  }

  // Convert the cart array to a JSON string
  var cartJson = JSON.stringify(cart);

  // Store the cart JSON string in local storage
  localStorage.setItem('cart', cartJson);

  // Display a notification message
  alert("Product added to cart.");
}
</script>
    
</body>
</html>