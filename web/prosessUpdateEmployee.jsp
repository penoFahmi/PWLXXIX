<%-- 
    Document   : prosessUpdateEmployee
    Created on : 7 Jun 2024, 21.26.15
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
            String name = request.getParameter("Name");
            String position = request.getParameter("Position");
            String office = request.getParameter("Office");
            String age = request.getParameter("Age");
            String startDate = request.getParameter("Start_date");
            String salary = request.getParameter("Salary");

            if (ID != null && name != null && position != null && office != null && age != null && startDate != null && salary != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");    
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/29_db", "root","");
                    String query = "UPDATE employees SET Name = ?, Position = ?, Office = ?, Age = ?, Start_date = ?, Salary = ? WHERE ID = ?";
                    PreparedStatement statement = connection.prepareStatement(query);
                    statement.setString(1, name);
                    statement.setString(2, position);
                    statement.setString(3, office);
                    statement.setString(4, age);
                    statement.setString(5, startDate);
                    statement.setString(6, salary);
                    statement.setString(7, ID);

                    int i = statement.executeUpdate();
                    if (i > 0) {
                        response.sendRedirect("ReadEmployees.jsp");
                    } else {
                        out.println("Failed to update employee.");
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
