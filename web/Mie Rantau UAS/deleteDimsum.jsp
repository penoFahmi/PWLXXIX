<%-- 
    Document   : deleteDimsum
    Created on : 30 Jun 2024, 23.12.45
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Dimsum</title>
    </head>
    <body>
        <%
        String id = request.getParameter("ID");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost/mie_rantau";
            Connection connection = DriverManager.getConnection(connectionURL,
        "root", "");
            Statement statement = connection.createStatement();
            int i = statement.executeUpdate("DELETE FROM users WHERE ID=" + id +
        "");
            response.sendRedirect("ReadDimsum.jsp");
        } catch (Exception e) {
            response.sendRedirect("ReadDimsum.jsp");
        }
        %>
    </body>
</html>
