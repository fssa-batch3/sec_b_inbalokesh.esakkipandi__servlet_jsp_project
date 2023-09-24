<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<style>
img {
	width: 150px;
	position: relative;
	left: 28%;
}

.log {
	display: flex;
	position: relative;
	top: 150px;
	flex-direction: column;
	align-items: center;
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


.error-notice {
	margin: 5px; /* Make sure to keep some distance from all sides */
}

.oaerror {
	width: 320px;
	height : auto;
	background-color: #ffffff;
	padding: 7px;
	border: 1px solid #eee;
	border-left-width: 5px;
	border-radius: 5px;
	margin: 10px auto;
	font-family: 'Open Sans', sans-serif;
	font-size: 14px;
}

.danger {
	border-left-color: #ed114e; /* Left side border color */
	background-color: rgb(255 234 234);;
	/*Same color as the left border with reduced alpha to 0.1*/
}

.danger strong {
	color: #ed114e;
}
</style>
</head>
<body>

	<% String errorMessage = request.getParameter("errorMessage");%>
	
	<% Long number = (Long) request.getAttribute("number");%>
	
	<div class="log">


		<div class="loginbox">
			<img src="<%=request.getContextPath()%>/assets/Images/LOGO.png"
				alt="logo">

			<h1>Login</h1>

			<form action="login" method="post">
				<label>Mobile No</label> <input type="tel"
					pattern="[6-9]{1}[0-9]{9}" title="+91 format number only"
					maxlength="10" name="phone_number" placeholder="" value="<%=number == null ? "" : number %>" required /> <br>
				<br> <label>Password</label> <input type="password"
					name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
					placeholder="" required /> <br> <br>

				<button type="submit">Login</button>
				<p>
					Don't have an account ? <a href="user/new">Sign Up Here</a>
				</p>
			</form>

		</div>
		<% if(errorMessage != null){%>
		<div class="error-notice">
			<div class="oaerror danger">
				 <p> <strong>Error </strong>- <%=errorMessage%>.Please try again.
				</p>
			</div>
		</div>
		<% }%>
	</div>
</body>
</html>