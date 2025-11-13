package com.portal.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String marks = request.getParameter("marks");
        String attendance = request.getParameter("attendance");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "UPDATE students SET name=?, course=?, marks=?, attendance=? WHERE id=?")) {

            ps.setString(1, name);
            ps.setString(2, course);
            ps.setInt(3, Integer.parseInt(marks));
            ps.setInt(4, Integer.parseInt(attendance));
            ps.setInt(5, Integer.parseInt(id));

            ps.executeUpdate();
            response.sendRedirect("viewStudents?msg=added");
 // ✅ back to list after update

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("editStudent.jsp?id=" + id + "&error=db");
        }
    }
}
