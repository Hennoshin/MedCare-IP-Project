<%@page import="Controller.ViewProduction"%>
<%@page import="Model.Product"%>

<%

String id = request.getParameter("id");

int status = ViewProduction.deleteProduct(id);
if(status == 1)
{
	response.sendRedirect("viewProduct.jsp"); 
}
else
{
	response.sendRedirect("error.jsp"); 
}

%>
