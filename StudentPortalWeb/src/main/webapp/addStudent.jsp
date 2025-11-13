<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
HttpSession s = request.getSession(false);
if (s == null || s.getAttribute("username") == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	body {
		font-family: "Segoe UI", Arial, sans-serif;
		background-color: #f5f7fa;
		margin: 0;
		padding: 0;
	}

	/* 🌐 Navbar */
	.navbar {
		background-color: #007bff;
		padding: 15px 0;
		text-align: center;
		box-shadow: 0 2px 6px rgba(0,0,0,0.1);
	}
	.navbar a {
		color: white;
		margin: 0 20px;
		text-decoration: none;
		font-weight: 500;
		transition: color 0.2s ease;
	}
	.navbar a:hover { color: #e2e6ea; }

	/* Page title */
	h2 {
		color: #007bff;
		text-align: center;
		margin-top: 40px;
		font-weight: 600;
	}

	/* Form */
	form {
		background: #fff;
		padding: 25px;
		width: 360px;
		margin: 30px auto;
		border-radius: 12px;
		box-shadow: 0 4px 10px rgba(0,0,0,0.1);
	}
	label {
		font-weight: 500;
		margin-bottom: 6px;
		display: inline-block;
	}
	input {
		margin-bottom: 12px;
		padding: 10px;
		width: 100%;
		border: 1px solid #ccc;
		border-radius: 6px;
		font-size: 15px;
	}
	input:focus {
		border-color: #007bff;
		outline: none;
		box-shadow: 0 0 4px rgba(0,123,255,0.2);
	}
	input[type=submit] {
		background-color: #007bff;
		color: white;
		border: none;
		font-weight: 500;
		font-size: 16px;
		padding: 10px;
		border-radius: 6px;
		width: 100%;
		transition: background-color 0.2s ease;
	}
	input[type=submit]:hover {
		background-color: #0056b3;
		cursor: pointer;
	}

	/* Error message */
	.error {
		color: red;
		text-align: center;
		font-weight: 500;
		margin-top: 10px;
	}
</style>
</head>

<body>

	<!-- 🌐 Navigation -->
	<div class="navbar">
		<a href="dashboard">🏠 Dashboard</a>
		<a href="viewStudents">📋 View Students</a>
		<a href="logout.jsp">🚪 Logout</a>
	</div>

	<h2>➕ Add Student</h2>

	<form action="addStudent" method="post">
		<label>Name:</label>
		<input type="text" name="name" required>

		<label>Course:</label>
		<input type="text" name="course" required>

		<label>Marks:</label>
		<input type="number" name="marks" min="0" max="100" required>

		<label>Attendance (%):</label>
		<input type="number" name="attendance" min="0" max="100" required>

		<input type="submit" value="Save Student">
	</form>

	<%
	if (request.getParameter("error") != null) {
		String err = request.getParameter("error");
		String msg = "";
		switch (err) {
			case "db": msg = "Database Error!"; break;
			case "invalid": msg = "Invalid input — please enter valid numbers."; break;
			case "insert": msg = "Failed to add record."; break;
		}
	%>
		<p class="error"><%= msg %></p>
	<%
	}
	%>

</body>
</html>
