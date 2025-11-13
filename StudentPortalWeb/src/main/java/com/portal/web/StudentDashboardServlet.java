package com.portal.web;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/studentDashboard")
public class StudentDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("studentId") == null) {
            response.sendRedirect("student_login.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("studentId");
        String name = (String) session.getAttribute("studentName");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE id=?")) {
            
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("course", rs.getString("course"));
                request.setAttribute("marks", rs.getInt("marks"));
                request.setAttribute("attendance", rs.getInt("attendance"));
            }

            request.setAttribute("studentName", name);
            RequestDispatcher rd = request.getRequestDispatcher("studentDashboard.jsp");
            rd.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
