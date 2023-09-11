<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style>
body {
	margin: 0;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

::-webkit-scrollbar {
	display: none;
}

.hord h1 {
	text-align: center;
	margin: 50px 0;
	background-color: #5cb748;
	color: white;
	border-radius: 5px;
	padding-bottom: 3px;
}

.list {
	display: flex;
	justify-content: space-evenly;
	margin-top: 100px;
	margin-bottom: 72px;
}

.obox {
	display: flex;
	height: 15rem;
	margin-bottom: 20px;
}

.obox img {
	height: 100%;
	width: 100%;
	object-fit: cover;
}

.obox img.food {
	border-radius: 10px;
	box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px,
		rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
}

.olist {
	margin-left: 40px;
	width: 100%;
}

.olist h2 {
	margin-top: 0;
}

.plist {
	display: flex;
	justify-content: space-between;
	height: 50%;
	width: 110%;
}

.plist p {
	font-size: 16.5px;
}

.plist p:nth-last-child(1) {
	margin-top: 25px;
}

.plist h4 {
	margin: 16.5px 10px;
}

.select {
	padding: 8px 10px;
	color: #333333;
	background-color: #eee;
	border: 1px solid #dddddd;
	cursor: pointer;
	border-radius: 5px;
}

.select option {
	background-color: white;
}

.slist {
	display: flex;
}

.add {
	display: flex;
	justify-content: space-between;
	margin-top: 25px;
	border-radius: 5px;
	padding: 10px 7px 4px;
	width: 80px;
	background-color: ghostwhite;
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
}

input[type=number]:focus {
	outline: none;
}

input[type="number"] {
	font-weight: bold;
	font-size: 17px;
	margin-left: 32px;
	width: 50px;
	border: 0px solid;
	background-color: ghostwhite;
}

.slist img {
	height: 13px;
	width: 13px;
}

.slist h3 {
	margin: -2px;
}

.slist button {
	height: 36px;
	width: 90px;
	margin-top: 25px;
	margin-left: 20px;
	background-color: #FF7223;
	border-color: transparent;
	border-radius: 5px;
	color: white;
	box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px
		2px;
}

.slist button:hover {
	transform: scale(1.02);
}

.address-box {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	height: 100%;
	width: 300px;
	padding: 10px 20px;
	border-radius: 10px;
	box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em,
		rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px
		0px 0px 1px inset;
}

textarea {
	height: 100px;
	width: 285px;
	resize: none;
	margin-top: 10px;
	font-family: Arial, Helvetica, sans-serif;
}

.sumlist button.place_order {
	height: 45px;
	width: 100%;
	margin-top: 30px;
	margin-bottom: 20px;
	background-color: #FF7223;
	box-shadow: #FF7223 0px 25px 20px -20px;
	color: white;
	border-color: transparent;
	font-size: 20px;
	border-radius: 30px;
	font-weight: bold;
	letter-spacing: 1px;
	cursor: pointer;
}

.sumlist button.place_order:hover {
	transform: scale(1.03);
}

.content{
    height: 100vh;
    display: flex;
    z-index: 1;
    justify-content: center;
    flex-wrap: wrap;
    align-content: center;
    position: fixed;
    left:50%;
    top:100%;
    transform:translate(-50%, -100%);
}

.placed{
    display:none;
    background-color:white;
    height:260px;
    width:400px;
    border:solid 2px #32c671;
    border-radius: 10px;
    text-align: center;
    padding: 0 20px 20px;
    color:#333;
    box-shadow: -2px 4px 37px -16px rgba(115,201,96,1);
}

.placed img{
    height:60px;
    width:60px;
    position:relative;
    bottom:18px;   
}

.placed h2{
    font-size: 30px;
}

.placed a button{
    margin-top: 15px;
    height:40px;
    width:120px;
    background-color:#32c671;
    color:white;
    cursor: pointer;
    font-size: 17px;
    letter-spacing: 0.3px;
    border-color: transparent;
    border-radius: 30px;   
}

.placed a button:hover{
    transform: scale(1.05);
}
</style>
</head>
<body>
	<%
	Product product = (Product) request.getAttribute("product");
	%>

	<%
	User user = (User) request.getAttribute("user");
	%>
	
	<%
	String status = request.getParameter("order");
	System.out.println(status);
	%>


	<jsp:include page="header.jsp"></jsp:include>


	<div class="hord">
		<h1>My Cart</h1>
	</div>
	
	<div class="content">
    	<div class="placed">
	        <img src="https://iili.io/J90pzF4.th.png" alt="tick image">
	        <h2>Thank you!</h2>
	        <p>Your order has been placed sucessfully.</p>
	        <a href="menu">
	            <button>Back</button>
	        </a>
    	</div>
  	</div>
  
	<section class="order-container">
		<div class="list">
			<div class="lorder">
				<div class="obox">
					<img src="<%=product.getImage()%>"
						alt="<%=product.getName()%> image" class="food">
					<div class="olist">
						<h2><%=product.getName()%></h2>
						<div class="plist">
							<div class="linfo">
								<p>Quantity:</p>
								<p>Price:</p>
								<p>Delivery time:</p>
							</div>
							<div class="rinfo">
								<h4><%=product.getQuantity()%>
									<%=product.getQuantityType()%>
								</h4>
								<h4 class="food_price">
									Rs.<%=product.getPrice()%></h4>
								<div class="dropbox">
									<select class="select" name="time">
										<option class="selected_option" value="Breakfast">Breakfast
											(7:30 AM to 9:00 AM)</option>
										<option class="selected_option" value="Lunch">Lunch
											(12:30 AM to 2:00 PM)</option>
										<option class="selected_option" value="Dinner">Dinner
											(7:00 PM to 8:30 PM)</option>
									</select>
								</div>
							</div>
						</div>
						<div class="slist">
							<div class="add">
								<input id="order-quantity" type="number" min="1" max="10"
									value="1">
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="address-box">
				<h2>Address</h2>
				<div class="sumlist">
					<div>
						<label>Enter Your Shipping address</label><br>
						<textarea name="textarea" class="Shipping-address"></textarea>

					</div>
					<button class="place_order">Place Order</button>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		document.querySelector(".place_order").addEventListener("click",
				placeOrder);

		function placeOrder() {
			let address = document.querySelector(".Shipping-address").value;
			let order_quantity = document.getElementById("order-quantity").value;
			let product_id = ${product.getId()};
			let price = ${product.getPrice()};
			let delivery_time = document.querySelector(".select").value;
			let status = "Not_delivered";
			let created_by = ${user.getId()};
			let total_price = (price * order_quantity);

			if (address == "") {
				alert("Please fill in the address");
			} else {
				// Construct the URL with query parameters using JavaScript
				const url = "order/create?" + "address="
						+ encodeURIComponent(address) + "&delivery_time="
						+ encodeURIComponent(delivery_time) + "&status="
						+ encodeURIComponent(status) + "&created_by="
						+ encodeURIComponent(created_by) + "&product_id="
						+ encodeURIComponent(product_id) + "&order_quantity="
						+ encodeURIComponent(order_quantity) + "&total_price="
						+ encodeURIComponent(total_price);

				// Navigate to the URL with the query parameters
				window.location.href = url;
			}
		}
		
		let result = <%=status%>;
		if(result){
            document.querySelector(".placed").setAttribute("style", "display:inline-block");
            document.querySelector(".order-container").setAttribute("style","opacity:0");

		}
	</script>


</body>
</html>