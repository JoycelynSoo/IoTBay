<%-- 
    Document   : welcome
    Created on : 27/03/2024, 4:36:32 PM
    Author     : bianc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
        %>
        
        <h1>Welcome <%= firstName %></h1>
        <p class="p">Your first name is:<%= firstName %></p>
        <p class="p">Your last name is:<%= lastName %></p>
        <p class="p">Your email is:<%= email %></p>
        <p class="p">Your password is:<%= password %></p>
        
        <div class="panel-div">
            <a class="panel-div-button" href="index.jsp">Cancel</a>
            <a class="panel-div-button" href="main.jsp">Main</a>
        </div>
        
        <%
            User user = new User(firstName, lastName, email, password);
            session.setAttribute("user", user);
        %>
    </body>
</html>
