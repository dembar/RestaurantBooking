<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #4CAF50;
            overflow: hidden;
        }
        .navbar a {
            float: left;
            display: block;
            color: white;
            padding: 14px 20px;
            text-align: center;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #45a049;
        }
        .dashboard-container {
            background-color: white;
            padding: 30px;
            margin: 50px auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .user-info {
            font-size: 16px;
            margin-bottom: 20px;
        }
        .admin-section, .customer-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .admin-section h3, .customer-section h3 {
            color: #4CAF50;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<%@ include file="navbar.jsp" %>

<!-- Dashboard Content -->
<div class="dashboard-container">
    <h2>Welcome, <%= session.getAttribute("username") %>!</h2>

    <!-- Display user information -->
    <div class="user-info">
        <p><strong>Name:</strong> <%= session.getAttribute("username") %></p>
        <p><strong>Email:</strong> <%= session.getAttribute("email") %></p>
        <p><strong>Phone Number:</strong> <%= session.getAttribute("phone_number") %></p>
        <p><strong>Role:</strong> <%= session.getAttribute("role") %></p>
    </div>

    <!-- Role-Based Content: Admin Section -->
    <%
        String role = (String) session.getAttribute("role");
        if ("admin".equals(role)) {
    %>
        <div class="admin-section">
            <h3>Admin Panel</h3>
            <p>Welcome, Admin! You have full access to manage users and view analytics.</p>
            <ul>
                <li><a href="manageUsers.jsp">Manage Users</a></li>
                <li><a href="viewAnalytics.jsp">View Analytics</a></li>
            </ul>
        </div>
    <%
        } else if ("customer".equals(role)) {
    %>
        <!-- Role-Based Content: Customer Section -->
        <div class="customer-section">
            <h3>Your Dashboard</h3>
            <p>Welcome, Customer! You can view your booking history and update your profile.</p>
            <ul>
                <li><a href="viewBookings.jsp">View Bookings</a></li>
                <li><a href="editProfile.jsp">Edit Profile</a></li>
            </ul>
        </div>
    <%
        }
    %>

</div>

</body>
</html>
