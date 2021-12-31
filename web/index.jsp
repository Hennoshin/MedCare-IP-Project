<%-- 
    Document   : index
    Created on : Dec 17, 2021, 3:35:18 PM
    Author     : Asus
--%>

<%@page import="Database.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% DB.getConnect(); %>
        <h1>Hello World!</h1>
    </body>
</html>
