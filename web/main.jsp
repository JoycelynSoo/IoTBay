
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/styleSheet.css">
        <title>Main Page</title>
    </head>

    <body>
        <header class="main-header">
            <div class="nav-bar">
                <div class="logo">
                    <a href="home.jsp"><img src="CSS/IoTBay.png" alt=Main class="logo"></a>
                </div>

                <table class="account-mgmt">
                    <tr>
                        <td>
                            <div class="account-dropdown">
                                <img class="account-img" src="CSS/account.png">
                                <div class="account-dropdown-content">
                                <a href="shipments.jsp">Track Order</a>
                                <a href="login.jsp">Login</a>
                                </div>
                            </div>
                        </td>

                        <td>
                        <a href="cart.jsp"><img src="CSS/shoppingcart.png" alt="cart"></a>
                        </td>
                    </tr>
                </table>
            </div>
    </body>
</html>