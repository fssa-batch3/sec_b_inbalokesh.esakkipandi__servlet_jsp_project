<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration form</title>
</head>
<body>

	<div class="signupbox">
		<h1>Sign Up</h1>
		<form action="create" method="post">

			<label>Name : </label> <input type="text" name="user_name"
				placeholder="Ex : Inba lokesh" required /> <br> <br>
				
			<label>Mobile No : </label> <input type="tel" name="phone_number"
				placeholder="Ex : 9988776655" required /> <br> <br>

			<label>Email : </label> <input type="email" name="email"
				placeholder="Ex : abc@gmail.com" required> <br> <br>
				
			<label>Password : </label> <input type="password" name="password"
				placeholder="Inba1234" required />

			<h4 class="password_note">(Password must contain at least one
				number and one uppercase and lowercase letter, and at least 8 or
				more characters)</h4>

			<br>
			<button type="submit">Submit</button>
		</form>
	</div>
</body>
</html>