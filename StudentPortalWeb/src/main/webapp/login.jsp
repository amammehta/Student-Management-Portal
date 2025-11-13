<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: linear-gradient(135deg, #007bff, #00bcd4);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: "Segoe UI", sans-serif;
        color: #333;
    }
    .login-box {
        background: #fff;
        padding: 40px 30px;
        border-radius: 15px;
        width: 350px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        text-align: center;
    }
    h2 {
        color: #007bff;
        margin-bottom: 25px;
    }
    input {
        width: 100%;
        margin-bottom: 15px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }
    .btn {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 6px;
        color: #fff;
        font-weight: 500;
        font-size: 15px;
    }
    .login-btn {
        background-color: #007bff;
    }
    .login-btn:hover {
        background-color: #0056b3;
    }
    .home-btn {
        background-color: #6c757d;
        margin-top: 10px;
    }
    .home-btn:hover {
        background-color: #565e64;
    }
</style>
</head>
<body>

<div class="login-box">
    <h2>👨‍💼 Admin Login</h2>
    <form action="login" method="post">
        <input type="text" name="username" placeholder="Enter Username" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <input type="submit" class="btn login-btn" value="Login">
    </form>
    <a href="index.jsp" class="btn home-btn">🏠 Back to Home</a>
</div>

</body>
</html>
