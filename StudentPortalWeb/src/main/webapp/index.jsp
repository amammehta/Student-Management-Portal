<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Portal | Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url("images/MUJ.jpg") no-repeat center center fixed; /* 🏫 background image */
            background-size: cover; /* make image cover entire screen */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "Segoe UI", sans-serif;
            position: relative;
            margin: 0;
        }

        /* Overlay for readability */
        body::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.45); /* dark overlay */
            z-index: 0;
        }

        .container-box {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.92);
            border-radius: 15px;
            padding: 40px 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 380px;
            color: #333;
        }

        .title {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            font-size: 30px;
            color: #007bff;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .title span {
            font-size: 34px;
        }

        p {
            font-size: 16px;
            color: #444;
        }

        .btn-box {
            margin-top: 25px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .btn {
            width: 130px;
            font-weight: 500;
            padding: 12px;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .student {
            background-color: #00bcd4;
            color: white;
        }
        .student:hover {
            background-color: #0097a7;
        }

        .admin {
            background-color: #007bff;
            color: white;
        }
        .admin:hover {
            background-color: #0056b3;
        }

        footer {
            margin-top: 25px;
            font-size: 13px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container-box">
        <div class="title">
            <span>🎓</span> Student Portal
        </div>
        <p>Welcome! Please select your role to continue.</p>

        <div class="btn-box">
            <a href="student_login.jsp" class="btn student">Student Login</a>
            <a href="login.jsp" class="btn admin">Admin Login</a>
        </div>

        <footer>
           
        </footer>
    </div>
</body>
</html>
