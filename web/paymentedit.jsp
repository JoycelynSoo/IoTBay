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
            <title> Payment Edit Page </title> 
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
            <form id="paymentForm" action="EditPaymentServlet" method="post"> 
                    <div class="payment-row">
                <div class="column">
                    <h2 class="paymentTitle">Edit Your Payment Details </h2>
            
            <div class="input-box" >
            <span>Name on Card</span>
            <input name ="paymentNameOnCard" type="text" placeholder="Full Name" required>
            </div>
            
            <div class="input-box" required>
            <span>Card Number</span>
            <input name ="paymentCardNumber" type="number" placeholder="XXXX XXXX XXXX XXXX" required>
            </div>

            <div class="input-box" >
            <span>Expiry Month</span>
            <input name ="paymentExpiryMonth" type="number" placeholder="Month" min="1" max="12" required>
            </div>
                    
            <div class="input-box" >
            <span>Expiry Year</span>
            <input  name ="paymentExpiryYear" type="number" placeholder="Year" min="2024" max="2040" required>
            </div>
                    
            <div class="input-box" >
            <span> CVV </span>
            <input  name ="paymentCVV" type="number" placeholder="123"required> 
            </div>
                    
        </div>
     </div>
            <a class="buttonwidth">
            <input class="submit_payment_button" type="submit" value="Continue with Payment"> 
            </a>
            </form>            
            </div>

</body>
</html>