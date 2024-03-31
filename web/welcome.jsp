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
        <link rel="stylesheet" href="CSS/newCss.css">

        <title>Welcome</title>
    </head>   
   
    <body class="welcome_body" >            
        <% 
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String dob = request.getParameter("DOB");
         %>
         <div class="welcome_container">
         <div class ="welcome_form">             
             <div class="welcome_title">
                <img src="CSS/ProfilePic.jpeg" alt=Profile class="welcome_ProfilePic" >
                <h1>Welcome</h1>
                <h1><%= firstName %></h1>
                <h1><%= lastName %></h1>
             </div>
             
             <div class ="welcome_personalinfo">
               <h1>Personal Information</h1>
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
                   
                   <tr>
                     <td> <h2 class = "welcome_fields" >Your email is</h2> </td>
                     <td><h2 class = "welcome_fields" ><%= email %> </h2></td>
                   </tr>
                   
                   <tr>
                     <td> <h2 class = "welcome_fields" >Your DOB is</h2> </td>
                     <td><h2 class = "welcome_fields" ><%= dob %> </h2></td>
                   </tr>
                </table>             
             </div>
        </div> 
         </div>
    </body>
</html>
