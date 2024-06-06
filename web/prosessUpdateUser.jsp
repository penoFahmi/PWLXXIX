<%-- 
    Document   : processUpdateUser
    Created on : 3 Jun 2024, 18.05.18
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
<%@page import = "java.sql.*" %>
        
<%
String ID = request.getParameter("ID");
String userName = request.getParameter("username");
String passWord = request.getParameter("password");

if(ID != null) {
try {
 Class.forName("com.mysql.jdbc.Driver");    
 Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/29_db", "root","");
 String query = "UPDATE users SET ID = ?, username = ?, password = ? WHERE ID = " + ID;
 PreparedStatement statement = connection.prepareStatement(query);
 statement.setString(1, ID);
 statement.setString(2, userName);
 statement.setString(3, passWord);
 int i = statement.executeUpdate();
 response.sendRedirect("ReadUsers.jsp");
 }catch(Exception e) { response.sendRedirect("ReadUsers.jsp"); }
    }
 %>
    </body>
</html>
