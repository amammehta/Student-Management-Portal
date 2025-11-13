package com.portal.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/studentLogin")
public class StudentLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String password = request.getParameter("password");

        try {
            int id = Integer.parseInt(idStr);

            try (Connection con = DBConnection.getConnection()) {
                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM students WHERE id = ? AND password = ?");
                ps.setInt(1, id);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("studentId", id);
                    session.setAttribute("studentName", rs.getString("name"));
                    response.sendRedirect("studentDashboard.jsp");
                } else {
                    response.sendRedirect("student_login.jsp?error=invalid");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("student_login.jsp?error=db");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("student_login.jsp?error=invalid");
        }
    }
}
