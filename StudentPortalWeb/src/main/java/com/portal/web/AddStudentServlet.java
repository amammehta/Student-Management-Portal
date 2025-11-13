package com.portal.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Prevents serialization warning

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Session check (ensure admin is logged in)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // ✅ Collect form data
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String marksStr = request.getParameter("marks");
        String attendanceStr = request.getParameter("attendance");

        try {
            int marks = Integer.parseInt(marksStr);
            int attendance = Integer.parseInt(attendanceStr);

            // ✅ Database Insertion
            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(
                         "INSERT INTO students (name, course, marks, attendance) VALUES (?, ?, ?, ?)")) {

                ps.setString(1, name);
                ps.setString(2, course);
                ps.setInt(3, marks);
                ps.setInt(4, attendance);

                int result = ps.executeUpdate();

                if (result > 0) {
                    // ✅ Redirect safely to servlet, NOT JSP
                    response.sendRedirect("viewStudents");
                } else {
                    response.sendRedirect("addStudent.jsp?error=insert");
                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("addStudent.jsp?error=invalid");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addStudent.jsp?error=db");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
