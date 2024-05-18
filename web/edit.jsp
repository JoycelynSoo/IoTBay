<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
<head>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/styleSheet.css">
        <script type="text/javascript" src="js/script.js"></script>

        <title>Edit Page</title>
            
          <header>
            <div class="nav-bar">
                <!--centered-logo-->
                <div class="logo">
                <a href="main.jsp"><img src="CSS/IoTBay.png" alt="Main" class="logo"></a>
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
    
 <%
    
String existErr = (String) session.getAttribute("existErr");
String nameErr = (String) session.getAttribute("nameErr");
String emailErr = (String) session.getAttribute("emailErr");
String passErr = (String) session.getAttribute("passErr");
User user = (User) session.getAttribute("user");
String updated = (String) session.getAttribute("updated");
%>
<body class="welcome_body1" onload="startTime()">
<div class="welcome_body">
<div class="welcome_box">
<div class="welcome_container">
<div class ="welcome_form"> 
    <div class="welcome_title">
       <img src="CSS/icon.webp" alt=Profile class="welcome_ProfilePic" >
       <h1>Edit User Details <span class="message">${(updated != null ? updated : "")}</span> <span class="message"><%= (existErr != null ? existErr : "") %></span> </h1>
    </div>
    
    <div class="welcome_personalinfo" method="post" action="UpdateServlet">
      <h1>Personal Information</h1>
    <form action="UpdateServlet" method="post">
        <h2 class="welcome_fields">Your first name is</h2>     
        <input class="welcome_text" type="text" name="firstName" required="true"  value="${user.getFirstName()}" >

        <br>
        <h2 class="welcome_fields">Your last name is</h2>
        <input class="welcome_text" type="text" name="lastName" required="true"  value="${user.getLastName()}" >

        <br>
        <h2 class="welcome_fields">Your email is</h2>
        <input class="welcome_text" type="text" name="email" required="true"  value="${user.getEmail()}" >
        <br>
        <h2 class="welcome_fields">Your DOB is</h2>
        <input class="welcome_text" type="text" name="dob" required="true"  value="${user.getDob()}" >

        <br>
        <h2 class="welcome_fields">Your password is</h2>
        <input class="welcome_text" type="text" name="password" required="true" value="${user.getPassword()}" >
        <br>
    </div>
    </div>
        
                <div class="login_check">
                <input class="login_button" type ="submit" value ="Update Details">
                </div> 
    </form>
     <form action="CancelRegistrationServlet"  method="post">
                <div class="login_check">
                <input class="login_button" type ="submit" value ="Delete Account?">
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
</body>
</html>
