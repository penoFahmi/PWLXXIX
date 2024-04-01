<%-- 
    Document   : TebakAngka
    Created on : 1 Apr 2024, 19.48.37
    Author     : peno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Output Tebak Angka</title>
    </head>
    <body>
        <h1>Output Tebak Angka</h1>
        <% String angkaString = request.getParameter("angka"); %>
        <% int angkaInt = Integer.valueOf(angkaString); %>
        
        <% if (angkaInt == 7 ) { %>
        <p>Tebakan Anda Benar</p>
        <%} else if (angkaInt < 1 || angkaInt > 9) {%>
        <p>Angka anda diluar jangkauan</p>
        <% }else { %>
        <p>Maaf, tebakannya salah! <a href="tebak-angka.html"> Coba lagi</a></p>
        <% } %>
    </body> 
</html>
