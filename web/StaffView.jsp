<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Staff" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Staff List</title>
</head>
    <body>
        <header>
            <div class="nav-bar">
                <!--centered-logo-->
                <div class="logo">
                    <a href="home.jsp"><img src="CSS/IoTBay.png" alt=Main class="logo"></a>
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



    <h1>Staff List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Position</th>
                <th>Address</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                ArrayList<Staff> staffList = (ArrayList<Staff>) request.getAttribute("staffList");
                if (staffList != null) {
                    for (Staff staff : staffList) {
            %>
            <tr>
                <td><%= staff.getStaffId() %></td>
                <td><%= staff.getFirstName() %></td>
                <td><%= staff.getLastName() %></td>
                <td><%= staff.getEmail() %></td>
                <td><%= staff.getPosition() %></td>
                <td><%= staff.getAddress() %></td>
                <td><%= staff.getStatus() ? "Active" : "Inactive" %></td>
            </tr>
        </tbody>
    </table>
</body>
</html>