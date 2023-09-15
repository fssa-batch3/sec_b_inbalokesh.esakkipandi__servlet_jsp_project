<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>header</title>
<link href="assets/css/header.css" rel="stylesheet" type="text/css">

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
			<a href="#" class="toggle-button"> <span class="bar"></span> <span
				class="bar"></span> <span class="bar"></span>
			</a>
		</div>
		<div class="head">
			<nav class="navbar">
				<a class="navigation__link" href="home">Home</a> <a
					class="navigation__link" href="menu">Menu</a> <a
					class="navigation__link" href="about_us.jsp">About Us</a> <a
					class="navigation__link" href="contact_us.jsp">Contact Us</a>
			</nav>
			<div class="Profile">
				<a href="login">
					<button>Login</button>
				</a>
			</div>
		</div>
	</header>
	<%
	} else if (loggedUser == 9876543218l) {
	%>
	<header class="header">
		<div class="shead">
			<a href="admin"><img src="https://iili.io/J9Fiktn.md.png"
				alt="Logo" height="80px" width="100px"></a>
			<h1>ONLY HOME FOOD</h1>
		</div>
		<div class="head">
			<nav class="navbar">
				<a class="navigation__link"
					href="<%=request.getContextPath()%>/product/new">Create Product</a>
				<a class="navigation__link"
					href="<%=request.getContextPath()%>/products">Product List</a>
			</nav>
			<div class="Profile">
				<a href="logout">
					<button>Log Out</button>
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
			<a href="#" class="toggle-button"> <span class="bar"></span> <span
				class="bar"></span> <span class="bar"></span>
			</a>
		</div>
		<div class="head">
			<nav class="navbar">
				<a class="navigation__link" href="home">Home</a> <a
					class="navigation__link" href="menu">Menu</a> <a
					class="navigation__link" href="about_us.jsp">About Us</a> <a
					class="navigation__link" href="contact_us.jsp">Contact Us</a>
			</nav>
			<div class="Profile">
				<a href="<%=request.getContextPath()%>/cart"><img
					src="<%=request.getContextPath()%>/assets/Images/cart-outline.svg"
					alt="Cart icon" height="30px" width="30px"></a> <span
					class="count">0</span> <a href="profile"><img
					src="<%=request.getContextPath()%>/assets/Images/person-circle-outline.svg"
					alt="Profile icon" height="30px" width="30px"></a>
			</div>
		</div>
	</header>

	<%
	}
	%>

	<script>
	if(<%=loggedUser%> != null){

		const cartProducts = JSON.parse(localStorage.getItem("cart_product")) || [];
		const count = document.querySelector("span.count");

		console.log(count);

		if (cartProducts) {
			const find_user_products = cartProducts.filter((e) => e.user_id === <%=loggedUser%> );
			if (find_user_products) {
				count.textContent = find_user_products.length;
			}
		}

		if (count.textContent === "0" || count.textContent === "") {
			count.setAttribute("style", "display:none");
		}

		}
	 
	const toggleButton = document.querySelectorAll(".toggle-button");
	const navbarLinks = document.querySelector(".head");

	toggleButton.forEach((open) => {
		 open.addEventListener("click", () => {
		    navbarLinks.classList.toggle("active");
		 });
	});
	</script>
</body>
</html>