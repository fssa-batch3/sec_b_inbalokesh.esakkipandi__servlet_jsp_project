<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<style>
img{
    width:150px;
    position : relative;
    left:28%;
}

.log {
	display: flex;
	justify-content: center;
	position: relative;
	top: 150px;
}

.loginbox {
	width: 340px;
	height: 490px;
	border-radius: 10px;
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
	background-color: rgb(246, 246, 246);
}

h1 {
	text-align: center;
}

form {
	width: 300px;
	margin-left: 20px;
}

form label {
	display: flex;
	margin-top: 20px;
	font-size: 17px;
}

form input {
	width: 95%;
	padding: 7px;
	border: none;
	border: 1px solid #ccc;
	border-radius: 3px;
}

form input.inp {
	width: 95%;
}

button {
	width: 300px;
	height: 35px;
	margin-top: 20px;
	border: none;
	background-color: #49c15f;
	color: white;
	font-size: 18px;
}

.btn-secondary {
	width: 412px;
}

form input.but {
	width: 100%;
}

button:hover {
	transform: scale(1.02);
}

textarea {
    height: 100px;
    width: 405px;
    resize: none;
    font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>
<body>
	<div class="log">
	
		<div class="loginbox">
			<img src="https://iili.io/J9Fiktn.md.png" alt="logo">

			<h1>Login</h1>
			<form action="login" method="post">
				<label>Mobile No : </label> <input type="tel" name="phone_number"
					placeholder="Ex : 9988776600" required/> <br> <br> <label>Password
					: </label> <input type="password" name="password" placeholder="Inba1234"
					required/> <br> <br>
				<button type="submit">Login</button>
				<p>Don't have an account ? <a href="user/new">Sign Up Here</a></p>
			</form>
		</div>
	</div>
</body>
</html>