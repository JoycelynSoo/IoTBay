<%-- 
    Document   : login
    Created on : 23/03/2024, 5:27:55 PM
    Author     : bianc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/styleSheet.css">
        <title> Login Page </title>
    </head>
    <body class="login_body">
        <form action ="welcome.jsp" class="login_form">
            <h1 class="login_title">Login</h1>

            <table class ="login_input_box">
                <tr><td><input type ="text" placeholder ="Enter email" name="email" required="true"></td></tr> 
                <tr><td><input type ="password" placeholder ="Enter password" name="password" required="true"></td></tr>            
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
    </body>
</html>
