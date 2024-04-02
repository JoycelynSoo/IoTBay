<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="CSS/styleSheet.css">
    <title>Home Page</title>
    <!-- Include navigation bar CSS -->
</head>
<body class="home_body">
    <!-- Navigation Bar -->
    <header>
        <div class="nav-bar">
            <!-- Centered Logo -->
            <div class="logo">
                <a href="main.jsp"><img src="CSS/IoTBay.png" alt="Main" class="logo"></a>
            </div>
            <!-- Account Management Icons -->
            <div class="account-mgmt">
                <a href="account.jsp"><img src="CSS/userwhite.png" alt="Main"></a>
                <a href="cart.jsp"><img src="CSS/carticon.png" alt="Cart"></a>
            </div>
        </div>
        <!-- Browse Bar -->
        <div class="browse-bar">
            <a href="smart-home.jsp">Smart Home</a>
            <a href="SnS.jsp">Security & Surveillance</a>
            <a href="entertainment.jsp">Entertainment</a>
            <a href="HnW.jsp">Health & Wellness</a>
        </div>
    </header>
    
    <div class="image-container">
        <img src="CSS/promotional-banner.png" alt="Promotional Banner">
        <div class="text-overlay">
            <p>Explore IoTBay's most <br>
                popular products!
            </p>
        <div class="button-container">
            <a href="login.jsp"><button class="btn">Login</button></a>
            <a href="register.jsp"><button class="btn">Register</button></a>
        </div>
        </div>
    </div>

    
    <div class="image-grid">
        <div class="image-item">
            <img src="CSS/image1.jpg" alt="Image 1">
            <div class="overlay">Raspberry Pi 2 Model B</div>
        </div>
        <div class="image-item">
            <img src="CSS/image2.jpg" alt="Image 2">
            <div class="overlay">MPU-6050 Gyroscope</div>
        </div>
        <div class="image-item">
            <img src="CSS/image3.jfif" alt="Image 3">
            <div class="overlay">Potentiometer/Rotary Switch</div>
    </div>
</div>
    
      <footer>
            <div class="main-footer">
                <p>
                    IoTBay©
                </p>

                <table class="footer-links">
                    <tr>
                        <td>
                            <a href="home.jsp">Home</a>
                        </td>
                        <td>
                            <a href="main.jsp">Main</a>
                        </td>
                        <td>
                            <a href="register.jsp">Register</a>
                        </td>
                        <td>
                            <a href="login.jsp">Login</a>
                        </td>
                    </tr>
                </table>
            </div>
        </footer>

</body>
</html>
