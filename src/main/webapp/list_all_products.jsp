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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<style>
/* Center-align the heading */
body {
	margin: 0;
}

::-webkit-scrollbar {
	display: none;
}

.div-table{
	width:80%;
	margin:auto;
	margin-bottom:50px;
}

.heading {
	text-align: center;
	font-size: 28px;
	color: #333;
	margin-top: 20px;
}

/* Style the table container */
#table-box {
	/*box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
	padding-top:20px;
}

/* Style the table */
table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	color: #333;
}

/* Style the table header */
th {
	background-color: #23407d;
	color: #fff;
	padding: 15px;
}

/* Style the table rows */
tr:nth-child(even) {
	background-color: #f2f2f2;
}

/* Style the table cells */
td {
	padding: 10px;
	text-align: center;
}

/* Style the Edit and Delete buttons */
.button-container {
	display: flex;
	justify-content: center;
	gap: 10px;
}

button {
	padding: 8px 16px;
	background-color: #4CAF50; /* Green color */
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #45a049; /* Slightly darker green on hover */
}

/* Style the image */
img.product_image {
	max-height: 70px;
	display: block;
	margin: 0 auto;
	object-fit: cover;
    width: 110px;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%
	Set<Product> listOfProducts = (Set<Product>) request.getAttribute("products");
	%>

	<h1 class="heading">PRODUCTS</h1>
	<div class="div-table">
		<table id="table-box">
			<thead>
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Type</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Quantity Type</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<%
			for (Product product : listOfProducts) {
			%>
			<tr>
				<td><img class="product_image" src="<%=product.getImage()%>"
					alt="<%=product.getImage()%> Image" height="70px"></td>
				<td><%=product.getName()%></td>
				<td><%=product.getType()%></td>
				<td><%=product.getPrice()%></td>
				<td><%=product.getQuantity()%></td>
				<td><%=product.getQuantityType()%></td>
				<td><a href="product/edit?id=<%=product.getId()%>"><button>Edit</button></a></td>
				<td><a href="product/delete?id=<%=product.getId()%>"><button>Delete</button></a></td>
			</tr>
			<%
			}
			%>
			
		</table>

	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#table-box').DataTable();
		});
	</script>

</body>
</html>