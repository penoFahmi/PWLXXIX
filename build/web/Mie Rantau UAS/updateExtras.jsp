<%-- 
    Document   : updateExtras
    Created on : 1 Jul 2024, 08.08.07
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

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
                    <h1 class="text-center mb-4">Update Dimsum</h1>
                    <%
                        String ID = request.getParameter("ID");
                        if (ID != null) {
                             Connection connection = null;
                             PreparedStatement preparedStatement = null;
                             ResultSet resultSet = null;
                             try {
                                Class.forName("com.mysql.jdbc.Driver");
                                connection = DriverManager.getConnection("jdbc:mysql://localhost/mie_rantau", "root", "");
                    
                                String query = "SELECT * FROM extras WHERE ID = ?";
                                preparedStatement = connection.prepareStatement(query);
                                preparedStatement.setString(1, ID);
                                resultSet = preparedStatement.executeQuery();

                                if (resultSet.next()) {
                    %>
                    <form method="post" action="prosesUpdateExtras.jsp">
                        <input type="hidden" name="ID" value="<%= resultSet.getString("ID") %>">
                        <div class="mb-3">
                            <label for="nama" class="form-label">Nama Extra Tambahan</label>
                            <input type="text" class="form-control" id="nama" name="nama" value="<%= resultSet.getString("name") %>">
                        </div>
                        <div class="mb-3">
                            <label for="deskripsi" class="form-label">Deskripsi</label>
                            <textarea class="form-control" id="deskripsi" name="deskripsi" rows="3"><%= resultSet.getString("description") %></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="harga" class="form-label">Harga</label>
                            <input type="text" class="form-control" id="harga" name="harga" value="<%= resultSet.getString("price") %>">
                        </div>
                        <div class="mb-3">
                            <label for="photo_url" class="form-label">Upload Foto</label>
                            <input type="file" class="form-control" id="photo_url" name="photo_url">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                    <%
                    } else {
                        out.println("Extras not found.");
                        }
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("Error: " + e.getMessage());
                            } finally {
                                if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
                                if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException ignore) {}
                                if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
                                }
                                } else {
                                    out.println("No Extras ID provided.");
                                    }
                    %>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
