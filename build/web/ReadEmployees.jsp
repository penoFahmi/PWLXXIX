<%-- 
    Document   : ReadEmpolyees
    Created on : 6 May 2024, 17.59.54
    Author     : peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> // Import package
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Employee</title>
    </head>
    <body>
        <h1>Employees</h1>
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
            
            String query = "SELECT * FROM employees"; // Mempersiapkan query
            resultSet = statement.executeQuery(query); // Mengirim query ke Server
            
            while(resultSet.next()) {
            %>
            
            <% out.println(resultSet.getString("Name")); %>
            <% out.println(resultSet.getString("Position")); %>
            <% out.println(resultSet.getString("Office")); %>
            <% out.println(resultSet.getString("Age")); %>
            <% out.println(resultSet.getString("Start_date")); %>
            <% out.println(resultSet.getString("Salary")); %>
            
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
