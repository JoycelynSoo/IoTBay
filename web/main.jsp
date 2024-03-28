<%-- 
    Document   : main
    Created on : 21 Mar 2024, 9:17:06 pm
    Author     : biancagrose
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
        <title>Main Page</title>
    </head>

    <body>
        <header>
            <div class="nav-bar">
                <!--centered-logo-->
                <div class="logo">
                    <a href="main.jsp"><img src="CSS/IoTBay.png" alt=Main class="logo"></a>
                </div>

                <table class="account-mgmt">
                    <tr>
                      <td>
                        <a href="account.jsp"><img src="CSS/account.png" alt="account"></a>
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

        <div class="main-content">
            <%
                User user = (User) session.getAttribute("firstName");
            %>

            <h1>Customer Profile</h1>

            <table id="profile-table">
                <thead><th>First Name</th><th>Last Name</th><th>Email</th><th>Password</th></thead>
                <tr><td>${student.firstName}</td><td>${student.lastName}</td><td>${student.email}</td><td>${student.password}</td></tr>
            </table>

            <div class="panel-div">
                <a href="edit.jsp" class="panel-div-button">Edit</a>
                <a class="panel-div-button" hred="logout.jsp">Logout</a>
            </div>
        </div>


        <footer>

        </footer>

    </body>
</html>

