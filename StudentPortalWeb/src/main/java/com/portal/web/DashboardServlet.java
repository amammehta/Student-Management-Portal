package com.portal.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int totalStudents = 0;
        double avgMarks = 0;
        int maxMarks = 0;
        double avgAttendance = 0;

        try (Connection con = DBConnection.getConnection()) {
            Statement st = con.createStatement();

            // Total students
            ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM students");
            if (rs1.next()) totalStudents = rs1.getInt(1);

            // Average marks
            ResultSet rs2 = st.executeQuery("SELECT AVG(marks) FROM students");
            if (rs2.next()) avgMarks = rs2.getDouble(1);

            // Highest marks
            ResultSet rs3 = st.executeQuery("SELECT MAX(marks) FROM students");
            if (rs3.next()) maxMarks = rs3.getInt(1);

            // Average attendance
            ResultSet rs4 = st.executeQuery("SELECT AVG(attendance) FROM students");
            if (rs4.next()) avgAttendance = rs4.getDouble(1);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // ✅ Pass values to JSP
        request.setAttribute("totalStudents", totalStudents);
        request.setAttribute("avgMarks", avgMarks);
        request.setAttribute("maxMarks", maxMarks);
        request.setAttribute("avgAttendance", avgAttendance);

        // Forward to JSP
        RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
        rd.forward(request, response);
    }
}
