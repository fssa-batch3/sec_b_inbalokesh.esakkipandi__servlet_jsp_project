<%@page import="java.util.HashSet"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.TreeSet"%>
<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu</title>
<link href="assets/css/menu.css" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%
	Set<Product> list = (Set<Product>) request.getAttribute("allProducts");
	
	List<Product> listOfProducts = new ArrayList<>(list);

    Collections.sort(listOfProducts, Comparator.comparingInt(Product::getId));
	%>

	<%
	Long loggedNumber = (Long) request.getSession().getAttribute("loggedNumber");
	%>

	<h1 class="he">Menu</h1>

	<div class="search_box">
		<input type="text" class="search" placeholder="Search"
			id="search_food">
		<div>
			<a href="#"> <img class="search_image"
				src="assets/Images/Search image.png" alt="">
			</a>
		</div>
	</div>



	<div class="top">
		<div class="menu">
			<a href="menu" class="all">All</a>
		</div>
	</div>

	<div class="res">
		<div class="no_result" style="display: none">
			<img class="result_img" src="assets/Images/no-result.png"
				alt="No result image">
		</div>
	</div>

	<section class="details">

		<%
		for (Product product : listOfProducts) {
		%>

		<div class="box">
			<img src="<%=product.getImage()%>"
				alt="<%=product.getImage()%> image">
			<div class="border">
				<h4><%=product.getName()%></h4>
				<div class="info_box">
					<div class="info">
						<h5>Type</h5>
						<p><%=product.getType()%></p>
					</div>
					<div class="info">
						<h5>Quantity</h5>
						<p><%=product.getQuantity()%>
							<%=product.getQuantityType()%></p>
					</div>
				</div>
				<div class="price">
					<p class="food_price">
						Rs.
						<%=product.getPrice()%>
					</p>
					<%
					if (loggedNumber == null) {
					%>
					<a href="login"><button type="button" class="btn">Add
							to cart</button></a>

					<%
					} else {
					%>
					<button data-id="<%=product.getId()%>" type="button"
						class="addCart">Add to cart</button>
					<%
					}
					%>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</section>

	<!-- scooty gif -->
	<div class="gif">
		<img src="assets/Images/scooty.gif" alt="scooty img" height="150px"
			width="150px">
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

	<script>
		const addToCarts = document.querySelectorAll("button.addCart");
		addToCarts.forEach(function addCarts(add_foods) {
			add_foods.addEventListener("click", function clickToAdd() {
				
				const cartProducts = JSON.parse(localStorage.getItem("cart_product")) || [];
				const count = document.querySelector("span.count");
				

				const product_id = this.dataset.id;
				const userId = ${loggedNumber};
		
				console.log(cartProducts);
				
				const exist = cartProducts.length && JSON.parse(localStorage.getItem("cart_product")).some(
			            (data) => data.product_id === parseInt(product_id) && data.user_id === userId);
				
				if(!exist){
					cartProducts.push({
				    	user_id: userId,
				        product_id: parseInt(product_id),
				        quantity_ordered: 1,
				        delivery_time: "",
					});
				    localStorage.setItem("cart_product", JSON.stringify(cartProducts));
				    if(cartProducts.length == 1){
				    	window.location.reload();
				    }
					if (cartProducts) {
				   		const find_user_products = cartProducts.filter((e) => e.user_id === <%=loggedNumber%>);
						if (find_user_products) {
							count.textContent = find_user_products.length;
						}
					}
				}else {
			          alert("This product is already added to your cart");
		        }
				 
			});
		});
	</script>
</body>
</html>