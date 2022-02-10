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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
        href="https://fonts.googleapis.com/css2?family=Annie+Use+Your+Telescope&family=Merriweather&family=Playfair+Display&family=Roboto&display=swap"
        rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

        
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
        <jsp:include page="header.jsp"/>
        <div class="container">
            <form method="GET">
                <input type="text" class="form-control" placeholder="Search Product" name="search">
            </form>
            <%
            for (Product p : (ArrayList<Product>)request.getAttribute("products")) {
                request.setAttribute("p", p);
                 %>
            <h5>${p.id}, ${p.price}</h5>
            <button onclick="addCart('${p.id}')">Add to cart</button>
            <% } %>
        </div>
    </body>
</html>
