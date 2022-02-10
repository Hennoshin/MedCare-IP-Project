<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DB"%>
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
    Statement st=db.createStatement();
    st.executeUpdate("update product set prodname='"+productName+"', description='"+description+",price='"+price+"' manufacturer='"+imageUrl+"' where id='"+id+"'");
    response.sendRedirect("editProduct.jsp?msg=done");
}
catch(Exception e){
    System.out.println(e);
    response.sendRedirect("editProduct.jsp?msg=wrong");
}

%>
<!--Product product = new Product(id,productName,description,price,manufacturer,imageUrl);

int status = ViewProduction.updateProduct(product);
if(status == 1)
{
	response.sendRedirect("viewProducts.jsp"); 
}
else
{
	response.sendRedirect("error.jsp"); 
}

%>