<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
    HttpSession s = request.getSession(false);
    if (s == null || s.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    @SuppressWarnings("unchecked")
    List<String[]> students = (List<String[]>) request.getAttribute("students");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f5f7fa;
            font-family: "Segoe UI", sans-serif;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: center;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9fbff;
        }

        tr:nth-child(odd) {
            background-color: #eef4ff;
        }

        a {
            text-decoration: none;
        }

        .edit {
            color: green;
            font-weight: 500;
        }

        .delete {
            color: red;
            font-weight: 500;
        }

        .search-container {
            text-align: center;
            margin-bottom: 25px;
        }

        .search-container input {
            width: 50%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 25px;
            font-weight: 500;
            color: #007bff;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function searchTable() {
            let input = document.getElementById("searchInput");
            let filter = input.value.toLowerCase();
            let rows = document.getElementById("studentTable").getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) {
                let rowText = rows[i].innerText.toLowerCase();
                rows[i].style.display = rowText.includes(filter) ? "" : "none";
            }
        }
    </script>
</head>
<body>

    <h2>📋 <b>Student List</b></h2>

    <!-- 🔍 Search Bar -->
    <div class="search-container">
        <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="🔍 Search by ID, name, or course...">
    </div>

    <% if (students == null || students.isEmpty()) { %>
        <p class="text-center mt-4 text-danger">No student records found.</p>
    <% } else { %>
        <table id="studentTable">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Course</th>
                <th>Marks</th>
                <th>Attendance</th>
                <th>Action</th>
            </tr>
            <% for (String[] sRow : students) { %>
                <tr>
                    <td><%= sRow[0] %></td>
                    <td><%= sRow[1] %></td>
                    <td><%= sRow[2] %></td>
                    <td><%= sRow[3] %></td>
                    <td><%= sRow[4] %></td>
                    <td>
                        ✏️ <a href="editStudent.jsp?id=<%= sRow[0] %>" class="edit">Edit</a> |
                        🗑️ <a href="deleteStudent?id=<%= sRow[0] %>" class="delete"
                             onclick="return confirm('Are you sure you want to delete this record?');">Delete</a>
                    </td>
                </tr>
            <% } %>
        </table>
    <% } %>

    <a href="dashboard" class="back-link">⬅ Back to Dashboard</a>

</body>
</html>
