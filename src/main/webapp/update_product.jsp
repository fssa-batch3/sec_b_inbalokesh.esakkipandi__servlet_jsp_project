<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit product</title>
</head>
<body>

<div>
	<%
	Product product = new Product();
	%>
	<%
	product = (Product)request.getAttribute("product");
	%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	%>
		<h1>Edit Product</h1>
		
		<form action="update?id=<%= id %>" method="post">
			
			<label>Image : </label> <input type="url" name="image"
			value = "<%= product.getImage() %>" required /> <br> <br>
				 
			<label>Food Name : </label> <input type="text" name="name"
			value = "<%= product.getName() %>" readonly /> <br> <br>
				
			<label>Food Type : </label> <input type="text" name="type"
			value = "<%= product.getType() %>" required /> <br> <br>

			<label>Price : </label> <input type="number" name="price" min="1"
			value="<%= product.getPrice()%>" required> <br> <br>
				
			<label>Quantity : </label> <input type="number" name="quantity" min="1"
			value = "<%=product.getQuantity()%>" required /> <br> <br>
			
			<label>Quantity Type : </label> <input type="text" name="quantity_type"
			value = "<%= product.getQuantityType()%>" required /> <br> <br>
				 
			<button type="submit">Submit</button>
		
		</form>
	
	</div>

</body>
</html>