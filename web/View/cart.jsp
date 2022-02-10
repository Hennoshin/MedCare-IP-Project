<%-- 
    Document   : cart
    Created on : Jan 18, 2022, 3:33:07 PM
    Author     : Asus
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Your Cart</title>
        
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
        />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Annie+Use+Your+Telescope&family=Merriweather&family=Playfair+Display&family=Roboto&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
        rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        
        <script>
            function editCart() {
                $("form").attr("action", "");
                $("form")[0].submit();
            }
            
            function removeProduct(index) {
                $("input[name=\"id[]\"]").eq(index).remove();
                editCart();
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center m-4">
                    <h2 class="heading-section">Your Cart</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <form method="POST" action="checkout">
                        <div class="table-wrap border border-dark">
                            <table class="table">
                                <thead class="thead-primary">
                                    <tr style="background-color: aquamarine">
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th style="width: 10%;">Quantity</th>
                                        <th>total</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                    <tbody>
                                        <%  int counter = 0;
                                            ArrayList<Integer> qty = (ArrayList<Integer>)request.getAttribute("quantity");
                                            for (Product p : (ArrayList<Product>)request.getAttribute("products")) {
                                            request.setAttribute("p", p); %>
                                        <tr>
                                            <td>
                                                <label class="checkbox-wrap checkbox-primary">
                                                <input type="checkbox" name="check[]" checked="">
                                                <span class="checkmark"></span>
                                                </label>
                                            </td>
                                            <td>
                                                <div class="img" style="background-image:url(images/${p.imageUrl})"></div>
                                            </td>
                                            <td>
                                                <div class="email">
                                                    <span>${p.productName}</span>
                                                </div>
                                            </td>                                            
                                            <input type="text" value="${p.id}" name="id[]" hidden>
                                            <td>RM${p.price}</td>
                                            <td class="quantity">
                                                <div class="input-group">
                                                    <input type="text" name="quantity[]" class="quantity form-control input-number" min="1" max="100" onchange="editCart()" value=<%= qty.get(counter) %>>
                                                </div>
                                            </td>
                                            <td>RM<%= qty.get(counter) * p.getPrice() %></td>
                                            <td>
                                                <button type="button" class="btn btn-outline-danger btn-sm" onclick="removeProduct(<%= counter %>)">
                                                    <i class="fa fa-close material-icons" style="color: red; font-size: 25px">remove</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <% counter++; } %>
                                    </tbody>
                            </table>
                        </div>
                                    <input class="col-md-2 m-4 btn btn-info" type="submit" value="Checkout">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
