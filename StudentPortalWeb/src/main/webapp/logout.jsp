<%
    session.invalidate(); // Destroy the session
    response.sendRedirect("login.jsp");
%>
