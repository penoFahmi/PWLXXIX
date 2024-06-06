<%-- 
    Document   : CreateUsers
    Created on : 27 May 2024, 16.36.00
    Author     : Peno
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>Create User</h1>
        <form action="">
            <label>Username
                <input type="text" name="userName"> 
            </label>
            <label>Password
                <input type="password" name="passWord">
            </label>
            <input type="submit" name="Create User">
        </form>
    </body>
    <%@page import = "java.sql.*" %>
    <%@page import = "java.swing.*" %>
    
    <%
    String userName = request.getParameter("userName");
    String passWord = request.getParameter("passWord");
    
    String connectionURL = "jdbc:mysql://localhost/29_db";
    String usernameDB = "root";
    String passwordDB = "";
    Connection connection = null;
    PreparedStatement statement = null;
    Class.forName("com.mysql.jdbc.Driver");
    int updatedQuery = 0;
    
    if(userName != null && passWord != null ) {
    try {
        connection = DriverManager.getConnection(connectionURL, usernameDB, passwordDB );
        String query = "INSERT INTO users (userName, passWord) VALUES (?,?)";
        statement = connection.prepareStatement(query);
        
        //int randomID = (int) Math.random() * 99 + 1;
        
        //statement.setInt(1, randomID);
        statement.setString(1, userName);
        statement.setString(2, passWord);
        
        updatedQuery = statement.executeUpdate();
        
        if(updatedQuery != 0) { response.sendRedirect("ReadUsers.jsp"); }
        } catch(Exception e) {
        response.sendRedirect("ReadUsers.jsp");
    } finally { statement.close(); connection.close(); }
        }
    %>
    
</html>