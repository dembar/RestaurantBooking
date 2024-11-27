<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .profile-container {
            background-color: white;
            padding: 30px;
            margin: 50px auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 50%;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="profile-container">
    <h2>Edit Profile</h2>
    <form action="ProfileServlet" method="post">
        <!-- display Password (Non-Editable) -->
        <div class="form-group">
            <label for="role">Role:</label>
            <input type="text" id="role" name="role" value="<%= session.getAttribute("role") %>" readonly>
        </div>

        <!-- Display Email (Non-Editable) -->
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= session.getAttribute("email") %>" readonly>
        </div>
        
        <!-- display Password (Non-Editable) -->
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= session.getAttribute("password") %>" readonly>
        </div>
        
        <!-- Display Name (Editable) -->
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= session.getAttribute("username") %>" required>
        </div>
        
        <!-- Editable Phone Number -->
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" value="<%= session.getAttribute("phone_number") %>" required>
        </div>
        
        <!-- Submit Button -->
        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>

