<%-- 
    Document   : main
    Created on : 21 Mar 2024, 9:17:06 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="CSS/styleSheet.css">
    </head>

    <body>
        <header>
            <div class="nav-bar">
                <!--centered-logo-->
                <div class="logo">
                    <a href="home.jsp"><img src="CSS/IoTBay.png" alt"Home" class="logo"></a>
                </div>

                <div>
                    <a href="login.jsp">Login</a>
                    <a href="register.jsp">Register</a>
                </div>
            </div> 
        </header>

        <div class="home-page">
            <h1>Welcome to IoTBay!</h1>
            <p>Explore our range of products and start shopping now</p>

            <form action="register.jsp" method="post">
                <input type="submit" value="Create Account">
            </form>

            <form action="login.jsp" method="post">
                <input type="submit" value="Login">
            </form>
        </div>

        <footer>

        </footer>
        
    </body>
</html>

