<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link rel="stylesheet" href="CSS/Products.css">
</head>

<body>
    <header>
         <div class="nav-bar">
            <!-- Centered Logo -->
            <div class="logo">
                <a href="home.jsp"><img src="CSS/IoTBay.png" alt="Main" class="logo"></a>
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
        
         <div class="search-bar">
            <form action="search.jsp" method="post">
                <input type="text" id="searchInput" name="searchQuery" placeholder="Search all products..." value="<%= request.getParameter("searchQuery") %>">
            </form>
        </div>
        
        <h1>Search Results</h1>
        

        
    </header>

     <main>
         

         
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
            ResultSet rs = stmt.executeQuery("SELECT * FROM APP.products WHERE PRODUCT_NAME LIKE '%" + searchQuery + "%' OR PRODUCT_DESCRIPTION LIKE '%" + searchQuery + "%'");

            // Iterate over the result set and display products
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
                
                
                out.println("<form action='cart.jsp' method='post' target='_blank'>");
                out.println("<input type='hidden' name='productID' value='" + productid + "'>");
                out.println("<button type='submit' class='addToCartButton'>Add to cart</button>");
                out.println("</form>");
                
                out.println("</section>");
                
                
 
            }
            
                rs.close();
                stmt.close();
                conn.close();

          %>

         