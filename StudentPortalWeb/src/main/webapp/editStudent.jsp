<%@ page import="java.sql.*, com.portal.web.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String id = request.getParameter("id");
    String name = "", course = "";
    int marks = 0, attendance = 0;

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE id = ?")) {

        ps.setInt(1, Integer.parseInt(id));
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            course = rs.getString("course");
            marks = rs.getInt("marks");
            attendance = rs.getInt("attendance");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        input { margin-bottom: 10px; padding: 8px; width: 250px; }
        input[type=submit] {
            background-color: #28a745; color: white; border: none; padding: 10px;
        }
        input[type=submit]:hover { background-color: #218838; cursor: pointer; }
        a { text-decoration: none; color: #007bff; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <h2>✏️ Edit Student</h2>

    <form action="updateStudent" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        Name: <input type="text" name="name" value="<%= name %>" required><br>
        Course: <input type="text" name="course" value="<%= course %>" required><br>
        Marks: <input type="number" name="marks" value="<%= marks %>" required><br>
        Attendance: <input type="number" name="attendance" value="<%= attendance %>" required><br>
        <input type="submit" value="Update">
    </form>

    <p><a href="viewStudents">⬅ Back to Student List</a></p>

</body>
</html>
