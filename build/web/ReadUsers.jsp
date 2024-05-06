<%-- 
    Document   : Read_users
    Created on : 6 May 2024, 16.51.44
    Author     : peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> // Import package
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Users</title>
    </head>
    <body>
        <h1>Users</h1>
        <%
        Connection connection = null; // Informasi tentang status koneksi ke DB
        Statement statement = null; // Query yang akan dikirim ke DB
        ResultSet resultSet = null; // Data yang Di hasilkan dari query
        
        try {
            String connectionURL = "jdbc:mysql://localhost/29_db";
            String usernameDB = "root"; // Username untuk mengakses DB
            String passwordDB = ""; // Password untuk mengakses DB
            
            Class.forName("com.mysql.jdbc.Driver"); //Gunakan library JDBC
            // memulai keneksi ke DB 
            connection = DriverManager.getConnection(connectionURL, usernameDB, passwordDB);
            statement = connection.createStatement(); // Mempersiapkan statement untuk query
            
            String query = "SELECT * FROM users"; // Mempersiapkan query
            resultSet = statement.executeQuery(query); // Mengirim query ke Server
            
            while(resultSet.next()) {
            %>
            
            <% out.println(resultSet.getString("username")); %>
            <% out.println(resultSet.getString("password")); %>
            
            <%
            }
            // Menutup koneksi ke DB
            resultSet.close(); statement.close(); connection.close();
        } catch(Exception e) {
            out.println(e.getMessage());
        }       
        %>
    </body>
</html>
