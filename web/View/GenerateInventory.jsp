<%@page import="Model.Supplier"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Database.DB"%>

<!DOCTYPE html>
<form action="InventoryReport" method="post" >
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Inventory Report</title>
               <link href="/css/Inventory.css" rel="stylesheet" type="text/css"/> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Annie+Use+Your+Telescope&family=Merriweather&family=Playfair+Display&family=Roboto&display=swap"
            rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
        rel="stylesheet">
               
       <style>  
        
        body {
  background-color: white;
}


button {
    
  background-color: lightblue; 
  border: none;
  color: black;
  padding: 10px 19px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 15px;
}
    
.invent {
        text-align: center;

       
}

.center {
  margin-left: auto;
  margin-right: auto;
  border: 1px solid black;
    width: 100%;

  
}


th{
    
     border: 1px solid black;
         width: 16%;
     

}
td {
    
     border: 1px solid black;
         width: 16%;
         margin-left: auto;
  margin-right: auto;

}

        
        
        </style>

    </head>

           
               
               
               <!-- producttbl 
               get id
               get prodname
               get description
               get price
               get manufacturer
               get image URL
             
               -->
    
             
    </head>
    
    
    <body>
        <jsp:include page="header.jsp"/>
      
      <h1 style=" 
         text-align: center; 
         background-color: lightblue; 
         color: black;
         padding: 10px 19px;
           border-radius: 15px;
           
         ">
 
            Inventory Report</h1>

    
                    <%

                            for (Product rs : (ArrayList<Product>)request.getAttribute("prods")) {
 
                    %>    

                    
                    <table class="center">
                        <tr>
                       <th>ID</th>
                           <th>Product Name</th>
                           <th>  Description  </th>
                           <th>  Price  </th>
                           <th>  Manufacturer  </th>
                        </tr>
                        
                    <tr>
                        <th><%= rs.getId() %></th>
                        <th><%= rs.getProductName()%></th>
                        <th><%= rs.getDescription() %></th>
                        <th><%= rs.getPrice() %></th>
                         <th><%= rs.getManufacturer() %></th>
                   
                    </tr>
                    </table>
                    <%
                            
                        }


                    %>

 
        <div class="invent">
        <button onclick="window.print()">Print Inventory Report</button>
</div>
   
    </body>
</html>
</form>