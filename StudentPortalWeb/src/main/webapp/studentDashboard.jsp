<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession, java.sql.*" %>
<%
    HttpSession s = request.getSession(false);
    if (s == null || s.getAttribute("studentId") == null) {
        response.sendRedirect("student_login.jsp");
        return;
    }

    int id = (Integer) s.getAttribute("studentId");
    String name = (String) s.getAttribute("studentName");

    String course = "";
    int marks = 0, attendance = 0;

    try (Connection con = com.portal.web.DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE id = ?")) {
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            course = rs.getString("course");
            marks = rs.getInt("marks");
            attendance = rs.getInt("attendance");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #00bcd4, #80deea);
            font-family: "Segoe UI", sans-serif;
            text-align: center;
            padding: 50px;
            color: #333;
        }

        .dashboard {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            display: inline-block;
            padding: 30px 50px;
            margin-top: 40px;
            transition: 0.3s ease;
        }

        .dashboard:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }

        h2 {
            color: #007bff;
            font-size: 28px;
            margin-bottom: 25px;
        }

        .info {
            text-align: left;
            font-size: 20px;
            line-height: 1.8;
        }

        .info span {
            font-weight: bold;
            color: #007bff;
        }

        .logout {
            display: inline-block;
            background: #dc3545;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            margin-top: 25px;
            transition: background 0.3s;
        }

        .logout:hover {
            background: #b02a37;
        }
    </style>
</head>
<body>

    <h2>🎓 Welcome, <%= name %></h2>

    <div class="dashboard">
        <div class="info">
            <span>Name:</span> <%= name %><br>
            <span>Course:</span> <%= course %><br>
            <span>Marks:</span> <%= marks %><br>
            <span>Attendance:</span> <%= attendance %> %
        </div>
    </div>

    <br>
    <a href="logout.jsp" class="logout">🚪 Logout</a>

</body>
</html>
