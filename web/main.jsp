<%-- 
    Document   : main
    Created on : 21 Mar 2024, 9:17:06 pm
    Author     : biancagrose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
        <title>Main Page</title>
    </head>

    <body>
        <header>
            <div class="nav-bar">
                <!--centered-logo-->
                <div class="logo">
                    <a href="home.jsp"><img src="CSS/IoTBay.png" alt=Main class="logo"></a>
                </div>

                <table class="account-mgmt">
                    <tr>
                      <td>
                        <a href="account.jsp"><img src="CSS/account.png" alt="account"></a>
                      </td>
                      <td>
                        <a href="cart.jsp"><img src="CSS/shoppingcart.png" alt="cart"></a>
                      </td>
                    </tr>
                  </table>
            </div>

            <div class="browse-bar">
                <a href="smart-home.jsp">Smart Home</a>
                <a href="SnS.jsp">Security & Surveillance</a>
                <a href="entertainment.jsp">Entertainment</a>
                <a href="HnW.jsp">Health & Wellness</a>
                <a href="other.jsp">Other</a>
            </div>
        </header>

        <div class="account-content-bg"></div>
        
        <div class="account-content">
            <%
                User user = (User) session.getAttribute("user");
            %>

            <h1>Your Profile</h1>
     
            <table class="profile-details">
                <tr>
                    <td class="profile-detail">First Name:</td> 
                    <td class="profile-detail-input">${user.firstName}</td>
                    <td class="profile-detail">Last Name:</td>
                    <td class="profile-detail-input">${user.lastName}</td>
                    <td class="profile-detail">Email:</td>
                    <td class="profile-detail-input">${user.email}</td>
                    <td class="profile-detail">Password:</td>
                    <td class="profile-detail-input">${user.password}</td>
                </tr>
            </table>
   
            <table class="profile-buttons">
                <tr>
                    <td>
                        <a href="edit.jsp">edit</a>
                    </td>
                    <td>
                        <a href="logout.jsp">logout</a>
                    </td>
                </tr>
            </table>
        </div>
            
        <a href="products.jsp" class="promotional-link">
            <div class="promotional-banner">
                <p class="promotional-body">
                    Explore our range<br> 
                    of products
                </p>
            </div>
        </a>

             
        <div class="main-content">
            <div class="product-table">
                <table>
                    <tr>
                      <td>
                        <a href="main.jsp">Smart Home<img src="CSS/smarthome.jpg"></a>
                      </td>
                      <td>
                        <a href="main.jsp">Surveillance & Security<img src="CSS/sns.png"></a>
                      </td>
                      <td>
                        <a href="main.jsp">Entertainment<img src="CSS/entertainment.png"></a>
                      </td>
                    </tr>
                 </table>
            </div>
            
            <div class="product-table-2">
                <table >
                    <tr>
                        <td>
                            <a href="main.jsp">Health & Wellness<img src="CSS/hnw.jpg"></a>
                        </td>
                        <td>
                            <a href="main.jsp">Other<img src="CSS/other.png"></a>
                        </td>
                    </tr>
                </table> 
            </div>
        </div>
                
        <div class="product-catalog">
            <hr> <!-- Divider line -->
            
            <h1>Featured Products</h1>

            <div class="products">
                <!-- Product 1 -->
                <div class="product">
                    <img src="CSS/product-a.png" alt="MILESIGHT UF51 5G ULTRA FAST CELLULAR ROUTER CPE">
                    <div class="product-title">MILESIGHT UF51 5G ULTRA FAST CELLULAR ROUTER CPE</div>
                    <p>Price: $1,099.00</p>
                    <button>Add to Cart</button>
                </div>
            
                <!-- Product 2 -->
                <div class="product">
                    <img src="CSS/product-b.png" alt="TR321 INDUSTRIAL 4G LTE CELLULAR ROUTER 2-LAN">
                    <div class="product-title">TR321 INDUSTRIAL 4G LTE CELLULAR ROUTER 2-LAN</div>
                    <p>Price: $429.00</p>
                    <button>Add to Cart</button>
                </div>
            
                <!-- Product 3 -->
                <div class="product">
                    <img src="CSS/product-c.png" alt="WS523-10A-AU LORAWAN SMART PORTABLE SOCKET">
                    <div class="product-title">WS523-10A-AU LORAWAN SMART PORTABLE SOCKET</div>
                    <p>Price: $149.00</p>
                    <button>Add to Cart</button>
                </div>
            
                <!-- Product 4 -->
                <div class="product">
                    <img src="CSS/product-d.png" alt="LOPY & SIPY ANTENNA KIT">
                    <div class="product-title">LOPY & SIPY ANTENNA KIT</div>
                    <p>Price: $30</p>
                    <button>Add to Cart</button>
                </div>
            </div>
        </div>

        <footer>
            <div class="main-footer">
                <p>
                    IoTBay©
                </p>
            </div>
        </footer>
    </body>
</html>