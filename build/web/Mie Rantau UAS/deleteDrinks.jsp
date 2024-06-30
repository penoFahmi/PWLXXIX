<%-- 
    Document   : deleteDrinks
    Created on : 1 Jul 2024, 02.40.42
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Drinks</title>
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
            int i = statement.executeUpdate("DELETE FROM drinks WHERE ID=" + id +
        "");
            response.sendRedirect("ReadDrinks.jsp");
        } catch (Exception e) {
            response.sendRedirect("ReadDrinks.jsp");
        }
        %>
    </body>
</html>