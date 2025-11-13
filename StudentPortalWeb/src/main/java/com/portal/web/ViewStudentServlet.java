package com.portal.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.RequestDispatcher; // ✅ Add this line
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/viewStudents")
public class ViewStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<String[]> students = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM students")) {

            while (rs.next()) {
                students.add(new String[]{
                    String.valueOf(rs.getInt("id")),
                    rs.getString("name"),
                    rs.getString("course"),
                    String.valueOf(rs.getInt("marks")),
                    String.valueOf(rs.getInt("attendance"))
                });
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred");
        }

        request.setAttribute("students", students);
        RequestDispatcher rd = request.getRequestDispatcher("viewStudents.jsp");
        rd.forward(request, response);
    }
}
