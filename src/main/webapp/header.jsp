<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.header {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	align-content: center;
	height: 80px;
	box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px 0px;
	background-color: white;
	position: sticky;
	top: 0px;
	z-index: 1;
}

.shead {
	display: flex;
}

.head {
	display: flex;
}

.navbar {
	display: flex;
	justify-content: space-evenly;
	width: 420px;
	align-items: center;
}

.navbar a {
	text-decoration: none;
	color: black;
}

.Profile button {
	padding: 5px 10px;
	color: white;
	height: 35px;
	width: 80px;
	border-radius: 40px;
	cursor: pointer;
	border-color: transparent;
	background-color: #FF7223;
}

.Profile {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100px;
	margin-left: 40px;
}
</style>
</head>
<body>

	<%
	Long loggedUser = (Long) request.getSession().getAttribute("loggedNumber");
	%>

	<%
	if (loggedUser == null) {
	%>

	<header class="header">
		<div class="shead">
			<a href="home"><img src="https://iili.io/J9Fiktn.md.png"
				alt="Logo" height="80px" width="100px"></a>

			<h1>ONLY HOME FOOD</h1>
		</div>
		<div class="head">
			<nav class="navbar">
				<a class="navigation__link" href="home">Home</a> <a
					class="navigation__link" href="menu">Menu</a>
			</nav>
			<div class="Profile">
				<a href="login">
					<button>Login</button>
				</a>
			</div>
		</div>
	</header>
	<%
	} else {
	%>
	<header class="header">
		<div class="shead">
			<a href="home"><img src="https://iili.io/J9Fiktn.md.png"
				alt="Logo" height="80px" width="100px"></a>
			<h1>ONLY HOME FOOD</h1>
		</div>
		<div class="head">
			<nav class="navbar">
				<a class="navigation__link" href="home">Home</a> <a
					class="navigation__link" href="menu">Menu</a> <a
					class="navigation__link" href="order?id=26">My Order</a> <a
					class="navigation__link" href="profile">Profile</a>
			</nav>
		</div>
	</header>

	<%
	}
	%>
</body>
</html>