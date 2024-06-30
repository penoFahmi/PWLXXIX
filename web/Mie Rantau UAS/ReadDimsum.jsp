<%-- 
    Document   : ReadDimsum
    Created on : 30 Jun 2024, 21.06.05
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Dimsum</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
    <body>
        <div class="container">
            <h1 class="my-4">Dimsum</h1>
                    <% Connection connection = null; // Informasi tentang status koneksi ke DB
                    Statement statement = null; // Query yang akan dikirim ke DB
                    ResultSet resultSet = null; // Data yang Di hasilkan dari query
                    
                    try {
                        String connectionURL = "jdbc:mysql://localhost/mie_rantau";
                        String usernameDB = "root"; // Username untuk mengakses DB
                        String passwordDB = ""; // Password untuk mengakses DB
                        
                        Class.forName("com.mysql.jdbc.Driver"); //Gunakan library JDBC
                        // memulai keneksi ke DB 
                        connection = DriverManager.getConnection(connectionURL, usernameDB, passwordDB);
                        statement = connection.createStatement(); // Mempersiapkan statement untuk query
                        
                        String query = "SELECT * FROM dimsum"; // Mempersiapkan query
                        resultSet = statement.executeQuery(query); // Mengirim query ke Server
                                         
                    %>
            <table class="table table-striped">
                <thead>
                    <tr class="table-primary">
                        <th scope="col">Nama</th>
                        <th scope="col">Dikripsi</th>
                        <th scope="col">Harga</th>
                        <th scope="col">Photo</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        while(resultSet.next()) {
                    %>

                            <tr>
                                <td><%= resultSet.getString("name") %></td>
                                <td><%= resultSet.getString("description") %></td>
                                <td> RP <%= resultSet.getString("price") %></td>
                                <td><%= resultSet.getString("photo_url") %></td>
                                <td d-flex>
                                    <div class="d-inline">
                                        <a href="deleteDimsum.jsp?ID=<%= resultSet.getString("ID") %>" class="btn btn-danger">Delete</a>
                                    </div>
                                    <div class="d-inline">
                                        <a href="updateDimsum.jsp?ID=<%= resultSet.getString("ID") %>" class="btn btn-warning">Update</a>
                                    </div>
                                </td>
                            </tr>
                    <%    }
                        // Menutup koneksi ke DB
                        resultSet.close(); statement.close(); connection.close();
                    } catch(Exception e) {
                        out.println(e.getMessage());
                    }       
                    %>
                </tbody>
            </table>
        </div>        
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
