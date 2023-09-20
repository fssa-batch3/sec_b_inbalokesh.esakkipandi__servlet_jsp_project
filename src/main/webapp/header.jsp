<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>header</title>
<style>

.navbar-admin {
    display: flex;
    justify-content: space-evenly;
    width: 420px;
    align-items: center;
}

.navbar-admin a{
    text-decoration: none;
    color:black;
}

.logout-admin{

	display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100px;
}

.logout-admin button {
    padding: 5px 10px;
    color: white;
    height: 35px;
    width: 100px;
    border-radius: 40px;
    cursor: pointer;
    border-color: transparent;
    background-color: #FF7223;
}


</style>
<link href="<%= request.getContextPath()%>/assets/css/header.css" rel="stylesheet" type="text/css">
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
			<a href="home"><img src="<%=request.getContextPath()%>/assets/Images/LOGO.png"
				alt="Logo" height="80px" width="100px"></a>

			<h1>ONLY HOME FOOD</h1>
			<a href="#" class="toggle-button"> <span class="bar"></span> <span
				class="bar"></span> <span class="bar"></span>
			</a>
		</div>
		<div class="head">
			<nav class="navbar">
				<a class="navigation__link" href="<%= request.getContextPath()%>/home">Home</a> <a
					class="navigation__link" href="<%=request.getContextPath()%>/menu">Menu</a> <a
					class="navigation__link" href="<%= request.getContextPath()%>/aboutUs">About Us</a> <a
					class="navigation__link" href="<%= request.getContextPath()%>/contactUs">Contact Us</a>
			</nav>
			<div class="Profile">
				<a href="<%= request.getContextPath()%>/login">
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
			<a href="admin"><img src="<%=request.getContextPath()%>/assets/Images/LOGO.png"
				alt="Logo" height="80px" width="100px"></a>
			<h1>ONLY HOME FOOD</h1>
		</div>
		<div class="head">
			<nav class="navbar-admin">
				<a class="navigation__link"
					href="<%=request.getContextPath()%>/admin">Home</a>
				<a class="navigation__link"
					href="<%=request.getContextPath()%>/product/new">Create Product</a>
				<a class="navigation__link"
					href="<%=request.getContextPath()%>/products">Product List</a>
			</nav>
			<div class="logout-admin">
				<a href="<%= request.getContextPath()%>/logout">
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
			<a href="<%= request.getContextPath()%>/home"><img src="<%=request.getContextPath()%>/assets/Images/LOGO.png"
				alt="Logo" height="80px" width="100px"></a>
			<h1>ONLY HOME FOOD</h1>
			<a href="#" class="toggle-button"> <span class="bar"></span> <span
				class="bar"></span> <span class="bar"></span>
			</a>
		</div>
		<div class="head">
			<nav class="navbar">
				<a class="navigation__link" href="<%= request.getContextPath()%>/home">Home</a> <a
					class="navigation__link" href="<%= request.getContextPath()%>/menu">Menu</a> <a
					class="navigation__link" href="<%= request.getContextPath()%>/aboutUs">About Us</a> <a
					class="navigation__link" href="<%= request.getContextPath()%>/contactUs">Contact Us</a>
			</nav>
			<div class="Profile">
				<a href="<%=request.getContextPath()%>/cart"><img
					src="<%=request.getContextPath()%>/assets/Images/cart-outline.svg"
					alt="Cart icon" height="30px" width="30px"></a> <span
					class="count">0</span> <a href="<%= request.getContextPath()%>/profile"><img
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