<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form action="SalesReport" method="post">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Sales Report</title>
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
    
.sales {
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
         width: 20%;
     

}
td {
    
     border: 1px solid black;
         width: 20%;
         margin-left: auto;
  margin-right: auto;

}

        
        
        </style>
       
        <!-- order_history 
        get orderID
        get userID
        get orderDate
        get address
        
        
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
         
         Sales Report</h1>
     
       <%
                        String driver = "com.mysql.jdbc.Driver";
                        String url = "jdbc:mysql://localhost:3306/";
                        String database = "projectdb";
                        String userid = "root";
                        String password = "";

                        try {
                            Class.forName(driver);
                            Connection conn = DriverManager.getConnection(url + database, userid, password);
//                            Statement stmt = conn.createStatement();
                            String sqlselect = "select * from order_history";
                            PreparedStatement ps = conn.prepareStatement(sqlselect);
//                            ps.setInt(1, 50);

                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %>    

                    
                    
                    <table class="center">
                        <tr>
                       <th>  Order ID  </th>
                           <th>  User ID  </th>
                           <th>  Date  </th>
                        </tr>
                       
                        
                        <div style="text-align:center;">  
                        <th>  <%= rs.getString("orderID")%> </th>
                            
                            
                        <th> <%= rs.getString("userID")%> </th>
       
       
                        <th> <%= rs.getString("orderDate")%>   </th> 
                        </div>  
                   </table>
             

                    <%
                            }

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
     
     
    <h1> </h1>
    <h1> </h1>
    <h1> </h1>
     <div class="sales">
                 <button onclick="window.print()">Print Sales Report</button>
</div>
    </body>
</html>
</form>