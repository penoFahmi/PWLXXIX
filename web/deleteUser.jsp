<%-- 
    Document   : deleteUser
    Created on : 3 Jun 2024, 16.40.08
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Delete User</h1>
        <%@page import = "java.sql.*" %>
        <%
        String id = request.getParameter("ID");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost/29_db";
            Connection connection = DriverManager.getConnection(connectionURL,
        "root", "");
            Statement statement = connection.createStatement();
            int i = statement.executeUpdate("DELETE FROM users WHERE ID=" + id +
        "");
            response.sendRedirect("ReadUsers.jsp");
        } catch (Exception e) {
            response.sendRedirect("ReadUsers.jsp");
        }
        %>
    </body>
</html>
