package com.portal.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM students WHERE id = ?")) {

            ps.setInt(1, Integer.parseInt(idStr));
            ps.executeUpdate();

            response.sendRedirect("viewStudents?msg=deleted");
 // ✅ refresh student list after delete

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("viewStudents.jsp?error=db");
        }
    }
}
