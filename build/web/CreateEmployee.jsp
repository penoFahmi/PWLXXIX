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
                <input type ="date" name="Start_date">
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
        String Name = request.getParameter("Name");
        String Position = request.getParameter("Position");
        String Office = request.getParameter("Office");
        String Age = request.getParameter("Age");
        String Start_date = request.getParameter("Start_date");
        String Salary = request.getParameter("Salary");
        
        String connectionURL = "jdbc:mysql://localhost/29_db";
        Connection connection = null;
        String usernameDB = "root";
        String passwordDB = "";
        PreparedStatement statement = null;
        Class.forName("com.mysql.jdbc.Driver");
        int updatedQuery = 0;
        
        if (Name != null && Position != null) {
            try {
                connection = DriverManager.getConnection(connectionURL, usernameDB, passwordDB);
                String query = "INSERT INTO employees (Name, Position, Office, Age, Start_date, Salary) values (?,?,?,?,?,?)";
                statement = connection.prepareStatement(query);

                //int randomID = (int) Math.random() * 99 + 1; tidak jadi kare pakai auto increment di db

                //statement.setInt(1, randomID);
                statement.setString(1, Name);
                statement.setString(2, Position);
                statement.setString(3, Office);
                statement.setString(4, Age);
                statement.setString(5, Start_date);
                statement.setString(6, Salary);

        updatedQuery = statement.executeUpdate();
        
        if(updatedQuery != 0) { response.sendRedirect("ReadEmployees.jsp"); }
        } catch(Exception e) {
        response.sendRedirect("ReadEmployees.jsp");
    } finally { statement.close(); connection.close(); }
        }
    %>
    </html>
