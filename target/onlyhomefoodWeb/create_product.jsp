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
</style>
</head>
<body>
<div class="container">
  <h1>Create New Product</h1>
  <form action="create" method="post">
    <label for="image">Image URL:</label>
    <input type="url" id="image" name="image" required /><br>

    <label for="name">Food Name:</label>
    <input type="text" id="name" name="name" required /><br>

    <label for="type">Food Type:</label>
    <input type="text" id="type" name="type" required /><br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" required /><br>

    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" required /><br>

    <label for="quantity_type">Quantity Type:</label>
    <input type="text" id="quantity_type" name="quantity_type" required /><br>

	<div class="buttons">
		<a href="<%= request.getContextPath()%>/admin"><button type="button">Back</button></a>
    	<button type="submit">Submit</button>
    </div>
  </form>
</div>
</body>
</html>
