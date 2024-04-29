<%-- 
    Document   : register
    Created on : 21 Mar 2024, 9:16:33 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/styleSheet.css">
        <title> Logout Page</title>
              <header>
            <div class="nav-bar">
                <!--centered-logo-->
                <div class="logo">
                    <a href="home.jsp"><img src="CSS/IoTBay.png" alt=Main class="logo"></a>
                </div>

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
      </header>

    </head>
    <body class="login_body1">
        <div class ="login_body">
            <form class="logout_form">
             <a><img src="CSS/tick.png" alt=tick class="logout_tick"></a>
            
             <h1 class="login_title">You Have Been Logged out</h1>

            <div class="login_check">
                 <a href="home.jsp">
                 <button class="logout_button" type ="button"> Go Back To Home Page </button> 
                 </a>
            </div>
            
             <div class="login_check">
                 <a href="login.jsp">
                 <button class="logout_button" type ="button"> Login Again</button> 
                 </a>
            </div>
        </form>
        </div>
        <footer>
            <div class="main-footer">
                <p>
                    IoTBay©
                </p>

            </div>
        </footer>
        <% session.invalidate(); %>
    </body>
</html>

