<%-- 
    Document   : accessLogs
    Created on : 15 May 2024, 9:06:29 pm
    Author     : joycelyn.soo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="beans.User"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Logs</title>
    <link rel="stylesheet" href="CSS/Products.css">
    
    <style>
        #cartTable {
          width: 100%;
          border-collapse: collapse;
          table-layout: fixed;
        }

        #cartTable th,
        #cartTable td {
          padding: 1em;
          border: 1px solid #ddd;
          box-sizing: border-box;
        }

        #cartTable th {
          background-color: #f2f2f2;
          font-weight: bold;
        }

        #cartTable tbody tr:nth-child(even) {
          background-color: #f2f2f2;
        }

        #cartTable .product-name {
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }

        #cartTable .price,
        #cartTable .quantity,
        #cartTable .total {
          text-align: right;
        }

        #cartTable .quantity input {
          width: 50px;
          text-align: center;
        }

        #cartTable .remove-cell {
          text-align: right;
          white-space: nowrap;
        }

        #cartTable .remove-cell div {
          display: inline-block;
          width: 20px;
          height: 20px;
          line-height: 20px;
          text-align: center;
          font-size: 16px;
          font-weight: bold;
          color: #f00;
          border-radius: 50%;
          background-color: #fff;
          margin-right: 10px;
        }

        #cartTable .remove-cell div:hover {
          background-color: #f00;
          color: #fff;
        }

        #cartTotal {
          font-size: 1.5em;
          font-weight: bold;
          padding: 1em;
          text-align: right;
        }

        .cta-link,.check-link {
          display: inline-block;
          padding: 0.5em 1em;
          background-color: #00AB66;
          color: #fff;
          border: none;
          border-radius: 0.25em;
          text-decoration: none;
          cursor: pointer;
          font-size: 1em;
          font-weight: bold;
          text-transform: uppercase;
          letter-spacing: 0.1em;
          transition: background-color 0.2s ease-in-out;
          float: right;
          margin-left: 1em;
          margin-bottom: 30px;
        }

    </style>

</head>

<body>
    <header>
         <div class="nav-bar">
            <!-- Centered Logo -->
            <div class="logo">
                <a href="home.jsp"><img src="CSS/IoTBay.png" alt="Main" class="logo"></a>
            </div>
            <!-- Account Management Icons -->

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
        

        
        <h1>Access Logs </h1>
        
    </header>
  
    <main>
        
        <a href="main.jsp" class="cta-link"> Main Page</a>
        <a href="edit.jsp" class="cta-link"> Personal Details </a>

        
 <div id="cartTableContainer">
    <table id="cartTable">
      <thead>
        <tr>
          <th>Login Time</th>
          <th>Logout Time</th>
        </tr>
      </thead>
      <%
            User user = (User) session.getAttribute("user");
            session.setAttribute("user", user);
            String email = ((User) session.getAttribute("user")).getEmail();
          try{
          Class.forName("org.apache.derby.jdbc.ClientDriver");
          Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/IOTBAY;create=true", "root", "root");
          Statement st = con.createStatement();
          String fetch = "SELECT  * FROM APP.ACCESSLOGS where CUSTOMER_EMAIL = '" + email  + "'";   
        //execute this query using the statement field       
            ResultSet rs = st.executeQuery(fetch);
            while(rs.next()){
            
         
    %>
   <tbody>
       <tr>
           <td> <%=rs.getTimestamp("ACCESSLOGS_LOGIN_TIME")%></td>
           <td> <%=rs.getTimestamp("ACCESSLOGS_LOGOUT_TIME")%></td>
       </tr>
    </tbody>
    <%
        }
}   catch (Exception e){

}
    %>
    </table>
</div>
       

    </main>