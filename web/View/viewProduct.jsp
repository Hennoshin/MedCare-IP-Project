<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@page import="Controller.ViewProduction"%>
<%@page import="Model.Product" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>View Products</title>
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

			.actionBtn:hover {
				background-color: #3d74d2;
			}

		</style>
	</head>
	<body>
		<div class="container">
			<table align="center" class="productTable">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Description</th>
						<th>Manufacture</th>
						<th>Price</th>
						<th colspan="2">Actions</th>
					</tr> 
				</thead>
				<tbody>
                                    <%
                                       
                                        for (Product p : (ArrayList<Product>)request.getAttribute("products")) {
                                                request.setAttribute("p", p);
                                    %>
							<tr>
                                                                <td><%=p.getId()%></td>
								<td><%=p.getProductName()%></td>
								<td><%=p.getDescription()%></td>
								<td><%=p.getManufacturer()%></td>
								<td>RM <%=p.getPrice()%></td>
								<td><button class="actionBtn" onclick="location.href = 'editProduct.jsp?id=${p.getId}';">Edit</button></td>
								<td><button class="actionBtn" onclick="location.href = 'processDeleteProduct.jsp?id=${p.getId}';">Delete</button></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</body>
</html>