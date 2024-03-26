<%-- 
    Document   : login
    Created on : 21 Mar 2024, 9:15:59 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="CSS/styleSheet.css">
    <title>Login Page</title>
</head>
<body class="login_body">
<%
    if(request.getMethod().equalsIgnoreCase("post")) {
        String validEmail = "user@example.com";
        String validPassword = "password";

        String inputEmail = request.getParameter("email");
        String inputPassword = request.getParameter("password");

        boolean isAuthenticated = validEmail.equals(inputEmail) && validPassword.equals(inputPassword);

        if (isAuthenticated) {
            response.sendRedirect("welcome.jsp");
            return;
        } else {
            out.println("<p>Invalid email or password. Please try again.</p>");
        }
    }
%>
<form action="welcome.jsp" method="post" class="login_form">
    <h1 class="login_title">Login</h1>

    <table class="login_input_box">
        <tr><td><input type="text" name="email" placeholder="Enter email" required="true"></td></tr>
        <tr><td><input type="password" name="password" placeholder="Enter password" required="true"></td></tr>
    </table>

    <div class="login_check">
        <input class="login_button" type="submit" value="Login">
    </div>

    <div class="login_go_back_to_register">
        <p class="login_register">Don't have an account?
            <a href="register.jsp" class="login_register_link">Register</a>
        </p>

        <p>
            <a href="home.jsp" class="login_register_link">Go back to home page</a>
        </p>
    </div>
</form>
</body>
</html>
