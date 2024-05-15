<%-- 
    Document   : login
    Created on : 21 Mar 2024, 9:15:59 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="CSS/styleSheet.css">
    <title> Cancel Registration Page </title>
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
        <div class="browse-bar">
            <a href="smart-home.jsp">Smart Home</a>
            <a href="SnS.jsp">Security & Surveillance</a>
            <a href="entertainment.jsp">Entertainment</a>
            <a href="HnW.jsp">Health & Wellness</a>
            <a href="other.jsp">Other</a>
        </div>
    </header>
</head>
<body class="welcome_body1" onload="startTime()">
<div class ="welcome_body">

    <%
        String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");

    %>

<form class="login_form" action="home.jsp">
    <h1 class="login_title" >Your account has been cancelled successfully </h1>
    <div class="login_check">
     <a><button class="login_button">Go back to Home page</button></a>
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
</body>

</html>
