<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="restaurantbooking.servlets.Booking" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .history-container {
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
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="history-container">
    <h2>Booking History for <%= session.getAttribute("username")%> </h2>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Table ID</th>
                <th>Booking Date</th>
                <th>Number of People</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>     
            <%            	
                List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                if (bookings != null && !bookings.isEmpty()) {
                    for (Booking booking : bookings) {
			%>
                <tr>
                    <td><%= booking.getId() %></td>
                    <td><%= booking.getTableId() %></td>
                    <td><%= booking.getBookingDate() %></td>
                    <td><%= booking.getNumberOfPeople() %></td>
                    <td><%= booking.getStatus() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6">No bookings found.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
