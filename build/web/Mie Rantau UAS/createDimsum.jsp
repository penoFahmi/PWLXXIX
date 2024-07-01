<%-- 
    Document   : createDimsum
    Created on : 1 Jul 2024, 01.41.54
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "javax.swing.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tambah Dimsum</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="shadow-lg p-5 br-4">
                    <h1 class="text-center mb-4">Tambah Dimsum</h1>
                    <form method="post" action="createDimsum.jsp">
                        <div class="mb-3">
                            <label for="nama" class="form-label">Nama Dimsum</label>
                            <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan nama dimsum">
                        </div>
                        <div class="mb-3">
                            <label for="deskripsi" class="form-label">Deskripsi</label>
                            <textarea class="form-control" id="deskripsi" name="deskripsi" rows="3" placeholder="Masukkan deskripsi dimsum"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="harga" class="form-label">Harga</label>
                            <input type="text" class="form-control" id="harga" name="harga" placeholder="Masukkan harga dimsum">
                        </div>
                        <div class="mb-3">
                            <label for="photo_url" class="form-label">Upload Foto</label>
                            <input type="file" class="form-control" id="photo_url" name="photo_url">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
    <%
        String nama = request.getParameter("nama");
        String deskripsi = request.getParameter("deskripsi");
        String harga = request.getParameter("harga");
        String photo_url = request.getParameter("photo_url");
        
        String connectionURL = "jdbc:mysql://localhost/mie_rantau";
        Connection connection = null;
        String usernameDB = "root";
        String passwordDB = "";
        PreparedStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        int updatedQuery = 0;
        
        if (nama != null && harga != null) {
            try {
                connection = DriverManager.getConnection(connectionURL, usernameDB, passwordDB);
                String query = "INSERT INTO dimsum (name, description, price, photo_url) VALUES (?,?,?,?)";
                statement = connection.prepareStatement(query);

                statement.setString(1, nama);
                statement.setString(2, deskripsi);
                statement.setString(3, harga);
                statement.setString(4, photo_url);

                updatedQuery = statement.executeUpdate();
        
                if (updatedQuery != 0) {
                    response.sendRedirect("ReadDimsum.jsp");
                }
            } catch (Exception e) {
                response.sendRedirect("ReadDimsum.jsp");
            } finally {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            }
        }
    %>
</html>
