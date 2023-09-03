<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create new Product</title>
</head>
<body>

	<div>
		<h1>Create New Product</h1>
		<form action="create" method="post">
			<label>Image : </label> <input type="url" name="image"
				 required /> <br> <br>
				 
			<label>Food Name : </label> <input type="text" name="name"
				 required /> <br> <br>
				
			<label>Food Type : </label> <input type="text" name="type"
				 required /> <br> <br>

			<label>Price : </label> <input type="number" name="price"
				 required> <br> <br>
				
			<label>Quantity : </label> <input type="number" name="quantity"
				 required /> <br> <br>
			
			<label>Quantity Type : </label> <input type="text" name="quantity_type"
				 required /> <br> <br>
				 
			<button type="submit">Submit</button>
		
		</form>
	
	</div>

</body>
</html>