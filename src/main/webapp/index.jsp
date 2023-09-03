<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Website</title>
<style>
/* Add your CSS styles here */
/* Reset some default styles */
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin:0;
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
	height: 60%;
	width: 60%;
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
				<h1>Welcome to Only Home Food</h1>
				<p>We bring the taste of mothers food in a healthy way to your
					doorstep.</p>
				<a href="menu">
					<button class="btn">ORDER NOW</button>
				</a>
			</div>
			<img src="https://iili.io/J9Hpv72.md.webp" alt="food image">
		</div>
	</section>
	
</body>
</html>
