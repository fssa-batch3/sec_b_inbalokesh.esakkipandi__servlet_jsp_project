<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration form</title>
<style>
/* Style for the entire signup box */

img{
    width:220px;
    position:relative;
    left:27%;
}

.signupbox{
    width: 450px;
    height: 800px;
    margin: auto;
    border-radius: 3px;
    background-color: rgb(246, 246, 246);
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
}

h1{
    text-align: center;
}
  
h4{
    text-align: center;
}
  
form{
    width: 300px;
    margin-left: 20px;
}
  
form label{
    display: flex;
    margin-top: 20px;
    font-size: 17px;
}
  
form input{
    width: 132%;
    padding: 7px;
    border: none;
    border: 1px solid #ccc;
    border-radius: 3px;
}

form input.inp{
    width:95%;
}

button{
    width: 410px;
    height: 35px;
    margin-top: 20px;
    border: none;
    background-color: #49c15f;
    color: white;
    font-size: 18px;
}

.btn-secondary{
    width:412px;
}

form input.but{
    width:100%;
}

button:hover{
    transform: scale(1.02);
}

h4.password_note{

	width: 400px;
	margin-bottom:0;
}

</style>
</head>
<body>

	<div class="signupbox">
		<img src="https://iili.io/J9Fiktn.md.png" alt="logo">
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

			<a href="/onlyhomefoodWeb/home"><button type="button">Home</button></a>
			<button type="submit">Submit</button>
		</form>
	</div>
</body>
</html>