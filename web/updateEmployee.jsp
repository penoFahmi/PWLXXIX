<%-- 
    Document   : updateEmployee
    Created on : 7 Jun 2024, 21.24.46
    Author     : Peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee</title>
    </head>
    <body>
        <h1>Update Employee</h1>
        <%@page import = "java.sql.*" %>
        
        <%
            String ID = request.getParameter("ID");
            if (ID != null) {
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost/29_db", "root", "");

                    String query = "SELECT * FROM employees WHERE ID = ?";
                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setString(1, ID);
                    resultSet = preparedStatement.executeQuery();

                    if (resultSet.next()) {
        %>
                        <form action="prosessUpdateEmployee.jsp" method="post">
                            <input type="hidden" name="ID" value="<%= resultSet.getString("ID") %>">
                            <label>Name
                                <input type="text" name="Name" value="<%= resultSet.getString("Name") %>">
                            </label><br>
                            <label>Position
                                <input type="text" name="Position" value="<%= resultSet.getString("Position") %>">
                            </label><br>
                            <label>Office
                                <input type="text" name="Office" value="<%= resultSet.getString("Office") %>">
                            </label><br>
                            <label>Age
                                <input type="text" name="Age" value="<%= resultSet.getString("Age") %>">
                            </label><br>
                            <label>Start Date
                                <input type="text" name="Start_date" value="<%= resultSet.getString("Start_date") %>">
                            </label><br>
                            <label>Salary
                                <input type="text" name="Salary" value="<%= resultSet.getString("Salary") %>">
                            </label><br>
                            <input type="submit" name="Update" value="Update">
                        </form>
        <%
                    } else {
                        out.println("Employee not found.");
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
                out.println("No employee ID provided.");
            }
        %>
    </body>
</html>
