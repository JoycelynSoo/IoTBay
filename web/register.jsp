<%-- 
    Document   : register
    Created on : 21 Mar 2024, 9:16:33 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/styleSheet.css">
        <title> Login Page </title>
    </head>
    <body class="login_body">
        <form action ="welcome.jsp" class="login_form">
            <h1 class="login_title">Register</h1>

            <table class ="login_input_box">
                <tr><td><input type ="text" placeholder ="Enter first name" required="true"></td></tr>
                <tr><td><input type ="text" placeholder ="Enter last name" required="true"></td></tr> 
                <tr><td><input type ="text" placeholder ="Enter email" required="true"></td></tr> 
                <tr><td><input type ="password" placeholder ="Enter password" required="true"></td></tr>
                <tr><td><input type ="password" placeholder ="Re-enter password" required="true"></td></tr>
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
    </body>
</html>
