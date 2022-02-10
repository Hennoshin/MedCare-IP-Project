<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.ViewProduction"%>
<%@page import="Model.Product"%>


<%

String id = request.getParameter("id");
String productName = request.getParameter("prodame");
String description = request.getParameter("description");
Float price = Float.parseFloat(request.getParameter("price"));
String manufacturer = request.getParameter("manufacturer");
String imageUrl = request.getParameter("imageUrl");
    
try{
    DB db = DB.getConnect();
    PreparedStatement ps=db.prepareStatement("insert into producttbl values(?,?,?,?,?,?)");
    ps.setString(1, id);
    ps.setString(2, productName);
    ps.setString(3, description);
    ps.setFloat(4, price);
    ps.setString(5, manufacturer);
    ps.setString(6, imageUrl);
    ps.executeUpdate();
    response.sendRedirect("addProduct.jsp?msg=done");
}
catch(Exception e){
    response.sendRedirect("addProduct.jsp?msg=wrong");
}

%>
<!--Product product = new Product(id,productName,description,price,manufacturer,imageUrl);

int status = ViewProduction.addProduct(product);
if(status == 1)
{
	response.sendRedirect("viewProduct.jsp"); 
}
else
{
	 System.out.println("Error!!");
         response.sendRedirect("viewProduct.jsp");
}

%>