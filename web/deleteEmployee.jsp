<%-- 
    Document   : deleteEmployee
    Created on : 7 Jun 2024, 21.25.30
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
            int i = statement.executeUpdate("DELETE FROM employees WHERE ID=" + id +
        "");
            response.sendRedirect("ReadEmployees.jsp");
        } catch (Exception e) {
            response.sendRedirect("Reademployess.jsp");
        }
        %>
    </body>
</html>