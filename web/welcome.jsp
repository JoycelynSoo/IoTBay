<%-- 
    Document   : welcome
    Created on : 21 Mar 2024, 9:16:59 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/styleSheet.css">

        <title>Welcome</title>
    </head>
    <body class="welcome_body" >
                
        <% 
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dob = request.getParameter("DOB");
         %>
         
         <div class ="welcome_form">
             <h1 class="welcome_title">Welcome <%= firstName %> <%= lastName %></h1>
             <h1 class="welcome_personalinfo">Personal Information</h1>
            
             <table class = "welcome_table">
                 <tr>
                     <th class="welcome_table_width"></th>
                 </tr>
                <tr>
                  <td> <h2 class = "welcome_fields" >Your first name is</h2> </td>
                  <td><h2 class = "welcome_fields" ><%= firstName %> </h2></td>
                </tr>
                <tr>
                  <td><h2 class = "welcome_fields" >Your last name is</h2></td>
                  <td><h2 class = "welcome_fields" > <%= lastName %> </h2></td>
                </tr>
          </table>
            <h2 class = "welcome_fields" >Your first name is <%= firstName %> </h2>
            <h2 class = "welcome_fields" >Your last name is <%= lastName %> </h2>
            <h2 class = "welcome_fields" >Your email is <%= email %> </h2>
            <h2 class = "welcome_fields">Your DOB is <%= dob %> </h2>
         </div>
    </body>
</html>
