<%-- 
    Document   : product
    Created on : Jan 19, 2022, 7:17:12 PM
    Author     : Asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <title>JSP Page</title>
        
        <script>
            function addCart(id) {
                $.ajax({
                        method: "POST",
                        data: ("id=" + id)
                });
            }
        </script>
    </head>
    <body>
        <%
        for (Product p : (ArrayList<Product>)request.getAttribute("products")) {
            request.setAttribute("p", p);
             %>
        <h5>${p.id}, ${p.price}</h5>
        <button onclick="addCart('${p.id}')">Add to cart</button>
        <% } %>
    </body>
</html>
