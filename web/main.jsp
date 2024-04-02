<%-- 
    Document   : main
    Created on : 21 Mar 2024, 9:17:06 pm
    Author     : joycelyn.soo
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
                    <a href="main.jsp"><img src="CSS/IoTBay.png" alt=Main class="logo"></a>
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
                        <a href="products.jsp">Smart Home<img src="CSS/smarthome.jpg"></a>
                      </td>
                      <td>
                        <a href="products.jsp">Surveillance & Security<img src="CSS/sns.png"></a>
                      </td>
                      <td>
                        <a href="products.jsp">Entertainment<img src="CSS/entertainment.png"></a>
                      </td>
                    </tr>
                 </table>
            </div>
            
            <div class="product-table-2">
                <table >
                    <tr>
                        <td>
                            <a href="products.jsp">Health & Wellness<img src="CSS/hnw.jpg"></a>
                        </td>
                        <td>
                            <a href="products.jsp">Other<img src="CSS/other.png"></a>
                        </td>
                    </tr>
                </table> 
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