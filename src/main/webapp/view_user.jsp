<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>
<style>
body {
	font-family: 'Helvetica Neue', Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.profile-container {
	width: 400px;
	padding: 30px;
	background-color: #fff;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.profile-field {
	margin-bottom: 20px;
}

.profile-label {
	font-weight: bold;
	color: #333;
	font-size: 14px;
	margin-bottom: 5px;
}

.profile-value {
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 100%;
	box-sizing: border-box;
	font-size: 14px;
	color: #555;
	transition: border-color 0.3s ease;
}

.profile-value:focus {
	outline: none;
	border-color: #007bff;
}

.profile-button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s ease;
}

.profile-button:hover {
	background-color: #0056b3;
}

.profile-button:focus {
	outline: none;
}

.profile-button:active {
	transform: scale(0.98);
}
</style>

</head>
<body>
	<%
	User user = new User();
	%>
	<%
	user = (User) request.getAttribute("users");
	%>

	<div class="profile-container">
		<center>
			<h1>Profile</h1>
		</center>
		<div class="profile-field">
			<label class="profile-label" for="name">Name:</label> <input
				class="profile-value" type="text" id="name" value="<%= user.getName() %>"
				readonly>
		</div>
		<div class="profile-field">
			<label class="profile-label" for="email">Email:</label> <input
				class="profile-value" type="email" id="email"
				value="<%= user.getEmail()%>" readonly>
		</div>
		<div class="profile-field">
			<label class="profile-label" for="phone">Phone Number:</label> <input
				class="profile-value" type="tel" id="phone" value="<%= user.getMobNumber()%>"
				readonly>
		</div>
	</div>

</body>
</html>
