<%-- 
    Document   : paymentdetails
    Created on : 18 May 2024, 12:26:00 am
    Author     : afsheensyeda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="CSS/styleSheet.css">        
    <title> Delete Payment Details </title> 
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
        <form id="paymentForm" action="DeletePaymentServlet" method="post"> 
            <div class="row">
                    
                   <h2 class="paymentTitleCenter"> Payment details have been successfully deleted! </h2>

               
                    
                  
                        
                    
                   
                
                </div>
                    
                  
                    
                    <div class="payment_button">
                        <a href="paymentfinalise.jsp" class="buttonwidth">
                            <a href="paymentfinalise.jsp" class="submit_payment_button">Continue with Payment</button>
                        </a>
                    </div>
                    
                    
                    
                    
                  
               
            </div>
        </form>            
    </div>
</body>
</html>