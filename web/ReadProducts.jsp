<%-- 
    Document   : ReadProducts
    Created on : 13 May 2024, 16.50.49
    Author     : peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Products</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <h1 class="text-info-emphasis text-center mb-4 mt-4">Products</h1>
            <table class="table shadow-lg table-striped">
                <thead class="table-primary">
                    <tr>
                        <th>Product</th>
                        <th>Category</th>
                        <th>Size</th>
                        <th>Color</th>
                        <th>Brand</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody class="">
                    <% Connection connection = null; // Informasi tentang status koneksi ke DB
                    Statement statement = null; // Query yang akan dikirim ke DB
                    ResultSet resultSet = null; // Data yang Di hasilkan dari query
                    
                    try {
                        String connectionURL = "jdbc:mysql://localhost/uts29_db";
                        String usernameDB = "root"; // Username untuk mengakses DB
                        String passwordDB = ""; // Password untuk mengakses DB
                        
                        Class.forName("com.mysql.jdbc.Driver"); //Gunakan library JDBC
                        // memulai keneksi ke DB 
                        connection = DriverManager.getConnection(connectionURL, usernameDB, passwordDB);
                        statement = connection.createStatement(); // Mempersiapkan statement untuk query
                        
                        String query = "SELECT * FROM products"; // Mempersiapkan query
                        resultSet = statement.executeQuery(query); // Mengirim query ke Server
                        
                        while(resultSet.next()) {
                    %>
                            <tr>
                                <td><%= resultSet.getString("Product") %></td>
                                <td><%= resultSet.getString("Category") %></td>
                                <td><%= resultSet.getString("Size") %></td>
                                <td><%= resultSet.getString("Color") %></td>
                                <td><%= resultSet.getString("Brand") %></td>
                                <td> $ <%= resultSet.getString("Price") %></td>
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
