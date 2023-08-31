<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@page import="in.fssa.onlyhomefood.service.ProductService"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List All Products</title>
<style>
table{
	width: 100%;

}
table, th, td {
	border: 1px solid black;
	text-align: center;
	
}

th, td {
	padding: 10px;
}
</style>
</head>
<body>

	<h1>MENU</h1>
	
	<%Set<Product> listOfProducts = (Set<Product>)request.getAttribute("products");%>
		
	<table>
		<tr>
			<th>Name</th>
			<th>Type</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Quantity Type</th>
			<th>View</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<%for(Product product : listOfProducts){%>
		<tr>
			<td> <%= product.getName() %> </td>
			<td> <%= product.getType() %> </td>
			<td> <%= product.getPrice() %> </td>
			<td> <%= product.getQuantity() %> </td>
			<td> <%= product.getQuantityType() %> </td>
			<td><a href="product/view?id=<%= product.getId()%>"><button>View</button></a></td>
			<td><a href="product/edit?id=<%= product.getId()%>"><button>Edit</button></a></td>
			<td><a href="product/delete?id=<%= product.getId()%>"><button>Delete</button></a></td>
		</tr>
		<%} %>
		
	</table>

</body>
</html>