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

        <title>Welcome</title>
            
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
    
    <body class="welcome_body1">
    <div class ="welcome_body">
    
    <div class="welcome_box" >            
        <% 
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String password = request.getParameter("password");
         %>
         <div class="welcome_container">
            <div class ="welcome_form">             
                <div class="welcome_title">
                   <img src="CSS/icon.webp" alt=Profile class="welcome_ProfilePic" >
                    <% if (firstName == null) { %>
                        <h1>Welcome Back Again</h1>
                    <% } else { %>
                        <h1>Welcome</h1>
                    <% } %>
                    <% if (firstName != null) { %>
                        <h1><%= firstName %></h1>
                    <% } %>
                   <% if (lastName != null) { %>
                    <h1><%= lastName %></h1>
                     <% } %>
                </div>
             
        <div class="welcome_personalinfo">
            <h1>Personal Information</h1>
            <% if (firstName != null) { %>
                <h2 class="welcome_fields">your first name is</h2> 
                <h2 class="welcome_fields"><%= firstName %></h2>
            <% } %>
            <br>
            <% if (lastName != null) { %>
                <h2 class="welcome_fields">Your last name is</h2>
                <h2 class="welcome_fields"><%= lastName %></h2>
            <% } %>
            <br>
            <% if (email != null) { %>
                <h2 class="welcome_fields">Your email is</h2>
                <h2 class="welcome_fields"><%= email %></h2>
            <% } %>
            <br>
            <% if (dob != null) { %>
                <h2 class="welcome_fields">Your DOB is</h2> 
                <h2 class="welcome_fields"><%= dob %></h2>
            <% } %>
        </div>
            </div>
            <form action="main.jsp">
                <div class="login_check">
                <input action="main.jsp" class="login_button" type ="submit" value ="Main Page">
                </div>   
            </form> 
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
     
     <%
         User user = new User(firstName, lastName, email, dob, password);
         session.setAttribute("user", user);
     %>
    </body>
    

</html>
