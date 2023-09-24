<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration form</title>
<style>
/* Style for the entire signup box */
img {
	width: 220px;
	position: relative;
	left: 27%;
}

.signupbox {
	width: 450px;
	height: auto;
	margin: auto;
	border-radius: 3px;
	background-color: rgb(246, 246, 246);
	box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
		rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
	padding:10px;
}

h1 {
	text-align: center;
}

h4 {
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
	width: 132%;
	padding: 7px;
	border: none;
	border: 1px solid #ccc;
	border-radius: 3px;
}

form input.inp {
	width: 95%;
}

button {
	width: 410px;
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

h4.password_note {
	width: 400px;
	margin-bottom: 0;
}

.error-notice {
	margin: 5px; /* Make sure to keep some distance from all sides */
}

.oaerror {
	width: 388px;
	height: auto;
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
	background-color: rgb(255, 234, 234);;
	/*Same color as the left border with reduced alpha to 0.1*/
}

.danger strong {
	color: #ed114e;
}
</style>
</head>
<body>


	<%
	String errorMessage = request.getParameter("errorMessage");
	%>

	<%
	User user = (User) request.getAttribute("user");
	%>

	<div class="signupbox">
		<img src="<%=request.getContextPath()%>/assets/Images/LOGO.png"
			alt="logo">
		<h1>Sign Up</h1>
		<form action="create" method="post">
			<%
			if (errorMessage != null) {
			%>
			<div class="error-notice">
				<div class="oaerror danger">
					<p>
						<strong>Error </strong>-
						<%=errorMessage%>.
					</p>
				</div>
			</div>
			<%
			}
			%>
			<label>Name</label> <input type="text" minlength="3"
				pattern="[a-zA-Z ]+" name="user_name"
				value="<%=user == null ? "" : user.getName()%>" placeholder=""
				required /> <br> <br> <label>Mobile No</label> <input
				type="tel" pattern="[6-9]{1}[0-9]{9}" title="+91 format number only"
				maxlength="10" name="phone_number" placeholder="" required
				value="<%=user == null ? "" : user.getMobNumber()%>" /> <br> <br>
			<label>Email</label> <input type="email" name="email" placeholder=""
				value="<%=user == null ? "" : user.getEmail()%>" required> <br>
			<br> <label>Password</label> <input type="password"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
				name="password" placeholder="" required />

			<h4 class="password_note">(Password must contain at least one
				number and one uppercase and lowercase letter, and at least 8 or
				more characters)</h4>

			<button type="submit">Submit</button>
			<p>
				Already have an account! <a
					href="<%=request.getContextPath()%>/login">Sign In Here</a>
			</p>
		</form>
	</div>

</body>
</html>