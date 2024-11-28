package restaurantbooking.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dashboard.DatabaseConnection;

@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HistoryServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("user_id");

        List<Booking> bookings = new ArrayList<>();

        try (Connection connection = DatabaseConnection.getConnection()) {
        	String query = "SELECT id, table_id, booking_date, number_of_people, status, created_at " +
                    "FROM bookings WHERE user_id = ? ORDER BY booking_date DESC";
			     PreparedStatement stmt = connection.prepareStatement(query);
			     stmt.setInt(1, userId);
			     ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("id"));
                booking.setTableId(rs.getInt("table_id"));
                booking.setBookingDate(rs.getTimestamp("booking_date").toString());
                booking.setNumberOfPeople(rs.getInt("number_of_people"));
                booking.setStatus(rs.getString("status"));
                booking.setCreatedAt(rs.getTimestamp("created_at").toString());

                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to load booking history.");
        }

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("historyBooking.jsp").forward(request, response);

        
    }
}

