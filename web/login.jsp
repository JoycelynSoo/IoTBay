<%-- 
    Document   : login
    Created on : 21 Mar 2024, 9:15:59 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/styleSheet.css">
        <title> Login Page </title>
            
          <header>
            <div class="nav-bar">
                <!--centered-logo-->
                <div class="logo">
                    <a href="main.jsp"><img src="CSS/IoTBay.png" alt=Main class="logo"></a>
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
    <body class="login_body1">
        <div class ="login_body">
        <form action ="welcome.jsp" class="login_form">
            <h1 class="login_title">Login</h1>

            <table class ="login_input_box" >
                <tr><td><input type ="text" placeholder ="Enter email" name = "email" required="true"></td></tr> 
                <tr><td><input type ="password" placeholder ="Enter password" name = "password" required="true"></td></tr>            
            </table>
            
            
            <div class="login_check">
                <input class="login_button" type ="submit" value ="Login">
            </div>
            
            <div class="login_go_back_to_register"
                <p class="login_register">Don't have an account?
                    <a href="register.jsp" class="login_register_link"> Register</a>
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
            </div>
        </footer>
    </body>
    
</html>
