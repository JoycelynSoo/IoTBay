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
    <title> Register Page </title>
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
<body class="login_body1" onload="startTime()">
    <div class ="login_body">
        
    <%
    String existErr = (String) session.getAttribute("existErr");
    String nameErr = (String) session.getAttribute("nameErr");
    String emailErr = (String) session.getAttribute("emailErr");
    String passErr = (String) session.getAttribute("passErr");

    %>

    <form action="RegisterServlet" method="post" class="login_form">
        <h1 class="login_title">Register <span class="message"><%= (existErr != null ? existErr : "") %></span></h1>

        <table class ="login_input_box">
            <tr><td><input type ="text" placeholder ="<%= (emailErr != null ? emailErr : "Enter email") %>" name ="email" required="true"></td></tr>
            <tr><td><input type="text" placeholder="<%= (nameErr != null ? nameErr : "Enter first name") %>" name="firstName" required="true"</td></tr> 
            <tr><td><input type="text" placeholder="<%= (nameErr != null ? nameErr : "Enter last name") %>"name="lastName" required="true"</td>
            <tr><td><input type="date" placeholder="Enter Date of Birth" name="dob" required="true"></td></tr> 
            <tr><td><input type="password" placeholder="<%= (passErr != null ? passErr : "Enter password") %>" name="password" required></td></tr>
        </table>
        <div class="login_check">
            <input class="login_button" type ="submit" value ="Register">
        </div>
        <div class="login_go_back_to_register"
          <p class="login_register">Already have an account?
            <a href="login.jsp" class="login_register_link"> Login</a>
          </p>
          
          <p>
            <a href ="home.jsp" class="login_register_link"> Go back to home page </a> 
          </p>
        </div>
    </form>
    </div>
    
    <footer>
    <div class="main-footer">
        <p>
            IoTBay©
        </p>

        <table class="footer-links">
            <tr>
                <td>
                    <a href="home.jsp">Home</a>
                </td>
                <td>
                    <a href="main.jsp">Main</a>
                </td>
                <td>
                    <a href="welcome.jsp">Welcome</a>
                </td>
                <td>
                    <a href="register.jsp">Register</a>
                </td>
                <td>
                    <a href="login.jsp">Login</a>
                </td>
            </tr>
        </table>
    </div>
      </footer>
</body>
</html>