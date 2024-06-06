<%-- 
    Document   : CreateEmployee
    Created on : 27 May 2024, 17.35.43
    Author     : Peno
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Employee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>Add Employee</h1>
        <form class="shadow-lg" action="">
            <label>Name
                <input type ="text" name="Name">
            </label>
            <label>Position
                <input type ="text" name="Position">
            </label>
            <label>Office
                <input type ="text" name="Office">
            </label>
            <label>Age
                <input type ="text" name="Age">
            </label>
            <label>Start Date
                <input type ="date" name="Startdate">
            </label>
            <label>salary
                <input type ="text" name="Salary">
            </label>
            <input type ="submit" name="Create Empleyee">
        </form>
    </body>
    <%@page import = "java.sql.*" %>
    <%@page import = "javax.swing.*" %>
    
    <%
        String name = request.getParameter("Name");
        String position = request.getParameter("Position");
        String office = request.getParameter("Office");
        String age = request.getParameter("Age");
        String startdate = request.getParameter("Startdate");
        String salary = request.getParameter("Salary");
        
        String connectionURL = "jdbc:mysql://localhost/29_db";
        Connection connection = null;
        String usernameDB = "root";
        String passwordDB = "";
        PreparedStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        int updateQuery = 0;
        
        if (name != null && position != null) {
            try {
                connection = DriverManager.getConnection(connectionURL, usernameDB, passwordDB);
                String query = "INSERT INTO employees values (?,?,?,?,?,?,?)";
                statement = connection.prepareStatement(query);

                int randomID = (int) Math.random() * 99 + 1;

                statement.setInt(1, randomID);
                statement.setString(2, name);
                statement.setString(3, position);
                statement.setString(4, office);
                statement.setString(5, age);
                statement.setString(6, startdate);
                statement.setString(7, salary);

                updateQuery = statement.executeUpdate();

                if(updateQuery != 0) { response.sendRedirect("ReadEmployees.jsp");}
            
            }catch(Exception e) {
                response.sendRedirect("ReadEmployees.jsp");
            } finally { 
               if(statement != null) {
                        statement.close();
                    }
                    if(connection != null) {
                        connection.close();
                    }
            }
        }
     %>