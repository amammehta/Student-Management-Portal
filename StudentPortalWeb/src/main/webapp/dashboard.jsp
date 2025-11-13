<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    HttpSession s = request.getSession(false);
    if (s == null || s.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) s.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-top: 30px;
        }

        .container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 40px;
        }

        .card {
            border-radius: 15px;
            width: 220px;
            height: 120px;
            color: white;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0,0,0,0.25);
        }

        .blue { background: #006aff; }
        .green { background: #009e60; }
        .yellow { background: #ffb300; color: #222; }
        .cyan { background: #00bcd4; }

        .card h2 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 26px;
            margin: 0;
        }

        .actions {
            text-align: center;
            margin-top: 40px;
        }

        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 25px;
            margin: 5px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.2s ease;
        }

        .btn:hover { background-color: #0056b3; }

        .add { background-color: #28a745; }
        .add:hover { background-color: #218838; }

        .logout { background-color: #dc3545; }
        .logout:hover { background-color: #b02a37; }
    </style>
</head>

<body>
    <h1>Welcome, <%= username %> 👋</h1>

    <div class="container">
        <div class="card blue">
            <h2>Total Students</h2>
            <p><%= request.getAttribute("totalStudents") != null ? request.getAttribute("totalStudents") : "0" %></p>
        </div>

        <div class="card green">
            <h2>Average Marks</h2>
            <p><%= request.getAttribute("avgMarks") != null ? String.format("%.2f", request.getAttribute("avgMarks")) : "0" %></p>
        </div>

        <div class="card yellow">
            <h2>Highest Marks</h2>
            <p><%= request.getAttribute("maxMarks") != null ? request.getAttribute("maxMarks") : "0" %></p>
        </div>

        <div class="card cyan">
            <h2>Avg Attendance (%)</h2>
            <p><%= request.getAttribute("avgAttendance") != null ? String.format("%.2f", request.getAttribute("avgAttendance")) : "0" %></p>
        </div>
    </div>

    <div class="actions">
        <a href="addStudent.jsp" class="btn add">➕ Add Student</a>
        <a href="viewStudents" class="btn">📋 View All Students</a>
        <a href="logout.jsp" class="btn logout">🚪 Logout</a>
    </div>
</body>
</html>
