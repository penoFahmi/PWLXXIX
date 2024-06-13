<%-- 
    Document   : ReadEmployees
    Created on : 6 May 2024, 17.59.54
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Employees</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <h1 class="my-4">Employees</h1>
            <%
            Connection connection = null; // Informasi tentang status koneksi ke DB
            Statement statement = null; // Query yang akan dikirim ke DB
            ResultSet resultSet = null; // Data yang dihasilkan dari query
            
            try {
                String connectionURL = "jdbc:mysql://localhost/29_db";
                String usernameDB = "root"; // Username untuk mengakses DB
                String passwordDB = ""; // Password untuk mengakses DB
                
                Class.forName("com.mysql.jdbc.Driver"); // Gunakan library JDBC
                // Memulai koneksi ke DB 
                connection = DriverManager.getConnection(connectionURL, usernameDB, passwordDB);
                statement = connection.createStatement(); // Mempersiapkan statement untuk query
                
                String query = "SELECT * FROM employees"; // Mempersiapkan query
                resultSet = statement.executeQuery(query); // Mengirim query ke Server
            %>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start Date</th>
                        <th>Salary</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    while(resultSet.next()) {
                    %>
                    <tr>
                        <td><%= resultSet.getString("Name") %></td>
                        <td><%= resultSet.getString("Position") %></td>
                        <td><%= resultSet.getString("Office") %></td>
                        <td><%= resultSet.getString("Age") %></td>
                        <td><%= resultSet.getString("Start_date") %></td>
                        <td><%= resultSet.getString("Salary") %></td>
                        <td>
                            <a href="deleteEmployee.jsp?ID=<%= resultSet.getString("ID") %>" class="btn btn-danger">Delete</a>
                            <a href="updateEmployee.jsp?ID=<%= resultSet.getString("ID") %>" class="btn btn-warning">Update</a>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
            <%
                // Menutup koneksi ke DB
                if (resultSet != null) resultSet.close(); 
                if (statement != null) statement.close(); 
                if (connection != null) connection.close();
            } catch(Exception e) {
                out.println(e.getMessage());
            }       
            %>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
