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
    <title> Edit Payment Page </title> 
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
                    <a href="login.jsp"><img src="CSS/account.png" alt="account"></a>
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
                     <form id="paymentForm" action="EditPaymentServlet" method="post"> 
            <div class="row">
                    
                   <h2 class="paymentTitleCenter"> Edit Payment Details </h2>

                   <div class="centered-column" > 
                    <div class="edit-input-box" >
                        <span>Name on Card</span>
                        <input type="text" placeholder="Prefix. Full Name" required>
                    </div>
                    <div class="edit-input-box" required>
                        <span>Card Number</span>
                        <input type="number" placeholder="XXXX XXXX XXXX XXXX" required>
                    </div>
                        
                    
                        <div class="edit-input-box" >
                            <span>Expiry Month</span>
                            <input type="number" placeholder="Month" min="1" max="12" required>
                        </div>
                        <div class="edit-input-box" >
                            <span>Expiry Year</span>
                            <input type="number" placeholder="Year" min="2024" max="2040" required>
                        </div>
                        <div class="edit-input-box" >
                            <span> CVV </span>
                            <input type="number" placeholder="123"required> 
                        </div>
                    
                
                </div>
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