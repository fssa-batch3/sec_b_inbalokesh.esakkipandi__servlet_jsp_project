<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit product</title>
<style>

.container {
  text-align: center;
  margin: 80px auto;
  max-width: 400px;
  padding: 20px;
  border-radius: 10px;
  background-color: #ffffff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Style the form heading */
h1 {
  font-size: 28px;
  color: #333;
  margin-bottom: 20px;
}

/* Style the form labels and input fields */
label {
  display: block;
  font-size: 18px;
  margin-bottom: 10px;
  color: #555;
  text-align: left;
}

input[type="text"],
input[type="number"],
input[type="url"] {
  width: 95%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin-bottom: 15px;
  transition: border-color 0.3s;
}

input[type="text"]:focus,
input[type="number"]:focus,
input[type="url"]:focus {
  border-color: #007bff;
}

/* Style the form button */
button{
  background-color: #828481;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 12px 24px;
  font-size: 18px;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #5cb748;
}
.buttons{
	display:flex;
	justify-content : space-between;
}

#product_type {
	padding: 12px 8px;
	width: 100%;
	color: #555;
	background-color: rgb(255, 255, 255);
	cursor: pointer;
	border-radius: 5px;
	margin-bottom:11px;
	border: 1px solid #ccc;
}

option {
	color: #555;
	background-color: transparent;
}

</style>
</head>
<body>

	<%
	Product product = new Product();
	%>
	<%
	product = (Product)request.getAttribute("product");
	%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	%>
	
	<div class="container">
		<h1>Edit Product</h1>
		
		<form action="update?id=<%= id %>" method="post">
			
			<label>Image : </label> <input type="url" name="image"
			value = "<%= product.getImage() %>" pattern="https://.*" required /> <br> <br>
				 
			<label>Food Name : </label> <input type="text" name="name" minlength="3" pattern="[a-zA-Z ]+"
			value = "<%= product.getName() %>" readonly /> <br> <br>
			
			<label for="type">Food Type</label> <select id="product_type" value="<%= product.getType() %>" name="type" required>
				<option value="Veg">Veg</option>
				<option value="Non-veg">Non-veg</option>
			</select>

			<label>Price : </label> <input type="number" name="price" min="1"
			value="<%= product.getPrice()%>" min="1" max="999" required> <br> <br>
				
			<label>Quantity : </label> <input type="number" name="quantity" min="1"
			value = "<%=product.getQuantity()%>" min="1" max="999" required /> <br> <br>
			
			<label>Quantity Type : </label> <input type="text" name="quantity_type"
			value = "<%= product.getQuantityType()%>" pattern="[a-zA-Z ]+" required /> <br> <br>
				 
			<div class="buttons">
				<a href="<%= request.getContextPath()%>/products"><button type="button">Back</button></a>
    			<button type="submit">Submit</button>
    		</div>
		
		</form>
	
	</div>

</body>
</html>