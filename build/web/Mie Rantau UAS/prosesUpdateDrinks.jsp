<%-- 
    Document   : prosesUpdateDrinks
    Created on : 1 Jul 2024, 08.05.49
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proses Update Minuman</title>
    </head>
    <body>
        <%
            String ID = request.getParameter("ID");
            String name = request.getParameter("nama");
            String description = request.getParameter("deskripsi");
            String price = request.getParameter("harga");
            String photo_url = request.getParameter("photo_url");

            if (ID != null && name != null && description != null && price != null && photo_url != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");    
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/mie_rantau", "root", "");
                    String query = "UPDATE drinks SET name = ?, description = ?, price = ?, photo_url = ? WHERE ID = ?";
                    PreparedStatement statement = connection.prepareStatement(query);
                    statement.setString(1, name);
                    statement.setString(2, description);
                    statement.setString(3, price);
                    statement.setString(4, photo_url);
                    statement.setString(5, ID);

                    int i = statement.executeUpdate();
                    if (i > 0) {
                        response.sendRedirect("ReadDriks.jsp");
                    } else {
                        out.println("Failed to update drinks.");
                    }
                } catch(Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            } else {
                out.println("Invalid parameters received.");
            }
        %>
    </body>
</html>
