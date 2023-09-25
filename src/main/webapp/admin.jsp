<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home Page</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
}

::-webkit-scrollbar {
	display: none;
}

.btn {
	color: white;
	background-color: #5cb748;
	border-color: transparent;
	cursor: pointer;
	height: 50px;
	width: 170px;
	font-weight: bold;
	border-radius: 50px;
	letter-spacing: 1px;
}

.btn:hover {
	color: white;
	background-color: #5cb748;
	transform: scale(1.1);
	border-color: transparent;
	height: 50px;
	width: 170px;
	font-weight: bold;
	border-radius: 50px;
	letter-spacing: 1px;
}

section {
	margin: 140px 140px;
}

.intro {
	display: flex;
	justify-content: space-around;
}

.intro img {
	height: 65%;
	width: 50%;
	border-radius: 50px;
}

.intpara h1 {
	font-size: 4.375rem;
	color: #408531;
}

.intpara p {
	font-size: 30px;
	width: 80%;
	margin-bottom: 50px;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<section class="int">
		<div class="intro">
			<div class="intpara">
				<h1>Welcome Admin</h1>
				<p>Where flavors tell stories and every meal is a journey back to the heart.</p>
			</div>
			<img
				src="./assets/Images/our aim.webp"
				alt="food image">
		</div>
	</section>
</body>
</html>