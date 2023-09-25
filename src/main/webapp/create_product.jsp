<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Product</title>
<style>
/* Center-align the form container */
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

input[type="text"], input[type="number"], input[type="url"] {
	width: 95%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 15px;
	transition: border-color 0.3s;
}

input[type="text"]:focus, input[type="number"]:focus, input[type="url"]:focus
	{
	border-color: #007bff;
}

/* Style the form button */
button {
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

.buttons {
	display: flex;
	justify-content: space-between;
}

.error-notice {
	margin: 5px; /* Make sure to keep some distance from all sides */
}

.oaerror {
	width: 96%;
	height: auto;
	background-color: #ffffff;
	padding: 7px;
	border: 1px solid #fba5a5;
	border-left-width: 5px;
	border-radius: 5px;
	margin: 10px auto;
	font-family: 'Open Sans', sans-serif;
	font-size: 14px;
}

.danger {
	border-left-color: #ed114e; /* Left side border color */
}

.danger strong {
	color: #ed114e;
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
	String errorMessage = request.getParameter("errorMessage");
	%>

	<%
	Long number = (Long) request.getAttribute("number");
	%>
	<div class="container">
		<h1>Create New Product</h1>
		<%
		if (errorMessage != null) {
		%>
		<div class="error-notice">
			<div class="oaerror danger">
				<p>
					<strong>Error </strong>-
					<%=errorMessage%>.Please try again.
				</p>
			</div>
		</div>
		<%
		}
		%>
		<form action="create" method="post">
			<label for="image">Image URL:</label> <input type="url" id="image"
				name="image" pattern="https://.*" required /><br> <label
				for="name">Food Name:</label> <input type="text" id="name"
				name="name" minlength="3" pattern="[a-zA-Z ]+" required /><br>

			<label for="type">Type</label> <select id="product_type" name="type" required>
				<option value="Veg">Veg</option>
				<option value="Non-veg" selected>Non-veg</option>
			</select> <label for="price">Price:</label> <input type="number" id="price"
				name="price" min="1" max="999" required /><br> <label
				for="quantity">Quantity:</label> <input type="number" min="1"
				max="999" id="quantity" name="quantity" required /><br> <label
				for="quantity_type">Quantity Type:</label> <input type="text"
				id="quantity_type" name="quantity_type" required
				pattern="[a-zA-Z ]+" /><br>

			<div class="buttons">
				<a href="<%=request.getContextPath()%>/admin"><button
						type="button">Back</button></a>
				<button type="submit">Submit</button>
			</div>
		</form>
	</div>

</body>
</html>
