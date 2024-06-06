<%-- 
    Document   : Read_users
    Created on : 6 May 2024, 16.51.44
    Author     : peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read Users</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h1 class="my-4">Users</h1>
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

                String query = "SELECT * FROM users"; // Mempersiapkan query
                resultSet = statement.executeQuery(query); // Mengirim query ke Server
            %>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    while(resultSet.next()) {
                    %>
                    <tr>
                        <td><% out.println(resultSet.getString("username")); %></td>
                        <td><% out.println(resultSet.getString("password")); %></td>
                        <td><button type="button" class="btn btn-danger"><a href="deleteUser.jsp?ID=<%out.println(resultSet.getString("ID"));%>">Delete</button>
                            <button type="button" class="btn btn-primary"><a href="updateUser.jsp?ID=<%out.println(resultSet.getString("ID"));%>">Update</button>    
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
            <%
                // Menutup koneksi ke DB
                resultSet.close();
                statement.close();
                connection.close();
            } catch(Exception e) {
                out.println(e.getMessage());
            }       
            %>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
