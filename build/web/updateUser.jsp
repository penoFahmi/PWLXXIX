<%-- 
    Document   : updateUser
    Created on : 3 Jun 2024, 17.45.31
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
    </head>
    <body>
        <h1>Update User</h1>
        
        <%@page import = "java.sql.*" %>
        
        <%
            String ID = request.getParameter("ID");
            try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/29_db", "root","");
             
             Statement statement = connection.createStatement();
             String query = ("SELECT * FROM users WHERE ID = " + ID);
             ResultSet resultSet = statement.executeQuery(query);
             
             while(resultSet.next()) {
             
             %>
                <form action="ProcessUpdateUser.jsp" method="post">
                    <input type="hidden"
                           name="id"
                           value="<%out.println(resultSet.getString("ID"));%>">
                    <label>Username
                        <input type ="text" 
                               name="username" 
                               value="<%out.println(resultSet.getString("username"));%>">
                    </label>
                    <br/>
                    <br/>
                    <label>Password
                        <input type ="password" 
                               name="password" 
                               value="<%out.println(resultSet.getString("password"));%>">
                    </label>
                    <input type ="submit" name="Update">
                </form>
             <%
             }
            }catch(Exception e){
                response.sendRedirect("ReadUsers.jsp");
            }
        %>
    </body>
</html>
