<%-- 
    Document   : deleteFoods
    Created on : 1 Jul 2024, 02.41.27
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Foods</title>
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
            int i = statement.executeUpdate("DELETE FROM foods WHERE ID=" + id +
        "");
            response.sendRedirect("ReadFoods.jsp");
        } catch (Exception e) {
            response.sendRedirect("ReadFoods.jsp");
        }
        %>
    </body>
</html>
