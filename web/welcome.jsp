<%-- 
    Document   : welcome
    Created on : 21 Mar 2024, 9:16:59 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/styleSheet.css">
        <script type="text/javascript" src="js/script.js"></script>

        <title>Welcome</title>
            
          <header class="header">
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
    
    <body class="welcome_body1" onload="startTime()">
    <div class ="welcome_body">
    
    <div class="welcome_box" >            
        <% 
            User user = (User) session.getAttribute("user");
            session.setAttribute("user", user);
         %>
  <div class="welcome_container">
            <div class ="welcome_form">             
                <div class="welcome_title">
                   <img src="CSS/icon.webp" alt=Profile class="welcome_ProfilePic" >
                        <h1>Welcome  <%= ((User) session.getAttribute("user")).getFirstName() %>! </h1>
                </div>
             
        <div class="welcome_personalinfo">
            <h1>Personal Information</h1>
                <h2 class="welcome_fields">Your first name is</h2> 
                <h2 class="welcome_fields"> <%= ((User) session.getAttribute("user")).getFirstName() %> </h2>
            <br>
                <h2 class="welcome_fields">Your last name is</h2>
                <h2 class="welcome_fields"> <%= ((User) session.getAttribute("user")).getLastName() %> </h2>
            <br>
                <h2 class="welcome_fields">Your email is</h2>
                <h2 class="welcome_fields"><%= ((User) session.getAttribute("user")).getEmail() %></h2>
            <br>
                <h2 class="welcome_fields">Your DOB is</h2> 
                <h2 class="welcome_fields"><%= ((User) session.getAttribute("user")).getDob() %></h2>
            <br>
                <h2 class="welcome_fields">Your password is</h2> 
                <h2 class="welcome_fields"><%= ((User) session.getAttribute("user")).getPassword() %></h2>
        </div>
        </div>
            <form action="edit.jsp">
                <div class="login_check">
                <input action="edit.jsp" class="login_button" type ="submit" value ="Edit details">
                </div> 
            </form>
            <form action="accessLogs.jsp"  method="post">
                    <div class="login_check">
                    <input class="login_button" type ="submit" value ="View Access Logs">
                    </div>   
            </form>
            <form action="main.jsp">
                <div class="login_check">
                <input action="main.jsp" class="login_button" type ="submit" value ="Main Page">
                </div>   
            </form> 
         </div>
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
