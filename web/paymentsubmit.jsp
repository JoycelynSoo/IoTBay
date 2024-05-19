<%-- 
    Document   : payment1
    Created on : 17 May 2024, 11:37:23 pm
    Author     : afsheensyeda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="CSS/styleSheet.css">        
    <title> Payment Page </title> 
</head>
<header>
    <div class="nav-bar">
        <!--centered-logo-->
        <div class="logo">
            <a href="home.jsp"><img src="CSS/IoTBay.png" alt=Main class="logo"></a>
        </div>
        <table class="account-mgmt">
            <tr>
                <td>
                          <div class="account-dropdown">
                        <a href="welcome.jsp"><img src="CSS/account.png" alt="account"></a>
                            <div class="account-dropdown-content">
                                <a href="shipments.jsp">Track Order</a>
                                <a href="welcome.jsp">Details</a>
                            </div>
                          </div>
                </td>
                <td>
                    <a href="cart.jsp"><img src="CSS/shoppingcart.png" alt="cart"></a>
                </td>
            </tr>
        </table>
    </div>
    <!-- Browse Bar -->
    <div class="browse-bar">
        <a href="SMH.jsp">Smart Home</a>
        <a href="SS.jsp">Security & Surveillance</a>
        <a href="ENT.jsp">Entertainment</a>
        <a href="HnW.jsp">Health & Wellness</a>
        <a href="other.jsp">Other</a>
    </div>
</header>
<body> 
    <div class="paymentContainer">
        <form id="paymentForm" action="createPayment" method="post"> 
            <div class="row">
                <div class="column">
                        <h2 class="paymentTitle"> Order Submitted! </h2>
                        
                </div>

                    
                    <div class="payment_button">
                        <a href="paymenthistory.jsp" class="buttonwidth">
                            <a href='paymenthistory.jsp' class="submit_payment_button">View Payment History</a>
                        </a>
                    </div>
                    
                    <div class="payment_button">
                        <a href="paymentedit.jsp" class="buttonwidth">
                            <a href='paymentedit.jsp' class="submit_payment_button">Edit Payment Details</a>
                        </a>
                    </div>
                    
                    
                  
       
            </div>
        </form>            
    </div>
</body>
</html>