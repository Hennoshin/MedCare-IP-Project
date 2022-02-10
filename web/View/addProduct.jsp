<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="Controller.ViewProduction"%>
<%@page import="Model.Product"%>
<%@page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
<style>
    
body {
	font-family: Arial;
	background-color: #f4f4f4;
}

.navbar {
	 background-color: #3b5998;
	 overflow: hidden;
	 height: 63px;
}

.navbar a {
	 float: left;
	 display: block;
	 color: #f2f2f2;
	 text-align: center;
	 padding: 14px 16px;
	 text-decoration: none;
	 font-size: 17px;
}

.navbar ul {
	margin: 8px 0 0 0;
	list-style: none;
}

.navbar a:hover {
	background-color: #ddd;
	color: #000;
}

.productTable {
	padding-top:25px;
	border-spacing: 0px;
}

.productTable thead tr th{
	padding: 15px;
	color: black;
	background-color: #374561;
	font-size:15px;
}

.productTable tbody tr td {
	padding: 13px;
	font-size: 13px
}

.productTable tr:nth-child(even) {
	background-color: #e4e4e4;
}

.productTable tr:nth-child(odd) {
	background-color: red;
}
    .actionBtn {
    background-color: #1c54b5;
    padding: 10px;
    color: white;
    border: none;
    width: 75px;
    border-radius: 5px;
    cursor: pointer;
}

.actionBtn:hover  {
	 background-color: #3d74d2;}

</style>
</head>
<body>
    <jsp:include page="headingSupp.jsp"/>
    <%
        String msg=request.getParameter("msg");
        if("done".equals(msg))
        {
    %>
    <h3 class="alert">Product Added Succesfully</h3>
    <%}%>
    
     <%
        if("wrong".equals(msg))
        {
    %>
    <h3 class="alert">Some thing wrong! Try again</h3>
    <%}%>
    <% 
        DB db = DB.getConnect();
        ResultSet res = db.select("producttbl");
        res.first();
        
        String sindex = res.getString("id");
        while (res.next()) {
            String cur = res.getString("id");
            if (sindex.compareTo(cur) < 0) {
                sindex = cur;
            }
        }
        
        sindex = sindex.substring(3);
        int num = Integer.parseInt(sindex);
        num++;
        sindex = String.valueOf(num);
        int len = sindex.length();
        for (int i = 9; i > len; i--) {
            sindex = "0" + sindex;
        }
        sindex = "AA" + sindex;
        
        //this.id = sindex;
        
    
    %>

	<div align="center">
		<form action="processAddProduct.jsp" method="post">
			<table class="productTable">
				<thead>
					<tr>
						<th colspan="2">
							Product Details
						</th>
					</tr>
				</thead>
				<tr>
					<td>Product Name</td>
					<td><input type="text" name="prodname" size="20"
						class="input-style"/></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><input type="text" name="description" size="20"
						class="productTextField" /></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="price" size="20"
						class="productTextField" /></td>
				</tr>
                                <tr>
					<td>Manufacturer</td>
					<td><input type="text" name="manufacturer" size="20"
						class="productTextField" /></td>
				</tr>
			</table>
			<button class="actionBtn" style="margin-top:10px">Add</button>
		</form>
	</div>
</body>
</html>