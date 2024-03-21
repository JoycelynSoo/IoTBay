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
        <title>Login Page</title>
    </head>
    <body>
        <h1 class="Login">Login Page </h1>
        
        <div class ="login">
            <form action ="welcome.jsp" class="login__form">
                <table>
                    <tr><td>Email:</td></td> <td><input type ="text" placeholder ="Enter email" name ="email" required="true"></td></tr>
                    <tr><td>Password:</td></td> <td><input type ="password" placeholder ="Enter password" name ="password" required="true"></td></tr>
                </table>
            </form>
        </div>
    </body>
</html>
