<%-- 
    Document   : payment1
    Created on : 17 May 2024, 11:37:23 pm
    Author     : afsheensyeda
--%>
<%@page import="beans.Payment"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="CSS/styleSheet.css">        
    <title>Payment Page</title> 
</head>
<header>
    <div class="nav-bar">
        <!--centered-logo-->
        <div class="logo">
            <a href="home.jsp"><img src="CSS/IoTBay.png" alt="Main" class="logo"></a>
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
         <% 
            Payment payment = (Payment) session.getAttribute("payment");
            session.setAttribute("payment", payment);
         %>
        
        <form id="paymentForm" action="EditPaymentServlet" method="post"> 
            <div class="row">
                <div class="column">
                    <h2 class="paymentTitle">Finalise Payment</h2>
                    <div class="input-box">
                        <span>Name on Card</span>
                        <input type="text" name="nameOnCard" value="${payment.getPaymentNameOnCard()}" required>                     
                    </div>
                    <div class="input-box" required>
                        <span>Card Number</span>
                        <input type="text" name="cardNumber" value="${payment.getPaymentCardNumber()}" required>
                    </div>
                    <div class="input-box">
                        <span>Expiry Month</span>
                        <input type="text" name="paymentExpiryMonth" value= "${payment.getPaymentExpiryMonth()}" required>
                    </div>
                    <div class="input-box">
                        <span>Expiry Year</span>
                        <input type="text" name="expYear" value= "${payment.getPaymentExpiryYear()}" required>
                    </div>
                    <div class="input-box">
                        <span>CVV</span>
                        <input type="text" name="paymentCvv" value= "${payment.getPaymentCvv()}" required>
                    </div>
                    <div class="input-box">
                        <span>Total Order Amount</span>
                        <input type="text" name="totalOrderAmount" value= "${payment.getAmount()}" required>
                    </div>
                </div>
            </div>
            <div class="payment_button">
                <a href="paymentedit.jsp" class="buttonwidth">
                    <span class="submit_payment_button">Edit Payment Details</span>
                </a>
            </div>
            <div class="payment_button">
                <a href="paymentsubmit.jsp" class="buttonwidth">
                    <span class="submit_payment_button">Submit Payment</span>
                </a>
            </div>
            <div class="payment_button">
                <a href="paymentdelete.jsp" class="buttonwidth">
                    <span class="submit_payment_button">Delete Payment Details</span>
                </a>
            </div>
        </form>            
    </div>
</body>
</html>
