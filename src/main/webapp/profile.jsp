<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile</title>
<link href="<%=request.getContextPath()%>/assets/css/profile.css"
	rel="stylesheet" type="text/css">
</head>
<body>

	<%
	User user = (User) request.getAttribute("user");
	%>

	<%
	Object addressList = (Object) request.getSession().getAttribute("addressList");
	%>

	<%
	Object orderItems = (Object) request.getSession().getAttribute("orderItems");
	%>

	<%
	Object orders = (Object) request.getSession().getAttribute("orders");
	%>


	<%
	Object products = (Object) request.getSession().getAttribute("productList");
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<section>
		<div class="side">

			<div class="pro">
				<h1>Profile</h1>
				<div class="pbox">
					<div class="imgb">
						<img src="https://iili.io/J9z9WMu.th.jpg" alt="Profile image"
							height="250px" width="250px">
						<div class="button_row">
							<a
								href="<%=request.getContextPath()%>/user/edit?id=<%=user.getId()%>"><button
									type="button" id="edit-btn">Edit profile</button></a> <a
								href="<%=request.getContextPath()%>/address/book"><button
									type="button" id="address-btn">Address Book</button></a> <a
								href="<%=request.getContextPath()%>/user/delete?id=<%=user.getId()%>"><button
									type="button" id="delete-btn">Delete</button></a> <a
								href="#"><button
									type="button" onclick="logOut()" id="logout_user">Logout</button></a>
						</div>

					</div>
					<div>
						<div class="sep">
							<label>Name</label> <input type="text" id="user_name"
								value="${user.getName()}" disabled>
						</div>
						<div class="sep">
							<label>Mobile No</label> <input type="tel" id="user_phonenumber"
								value="${user.getMobNumber()}" disabled>
						</div>
						<div class="sep">
							<label>Email</label> <input type="email" id="user_email"
								value="${user.getEmail()}" disabled>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="history">
			<h2>My Orders</h2>
			<div class="overflowbox"></div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">
	
	const addressList = <%=addressList%> || [];
	
	const orderList = <%=orders%> || [];
	console.log(orderList);
	
	const orderedItems = <%=orderItems%> || [];

	const product_list = <%=products%>;
	    
	if (orderList.length === 0 || orderedItems.length === 0) {
	      document.querySelector(".history").setAttribute("style", "display:none");
	    } else {
	      // Order history loop//
	      let div_obox;
	      let div_item;
	      let div_ihead;
	      let h3;
	      let h4;
	      let p;
	      let div_order;
	      let div_item_list;
	      let div_total;
	      let div_ordered_by;
	      let div_view_button;
	      let a_view;
	      let button;

	      for (let i = 0; i < orderList.length; i++) {
	        // <div class="obox">
	        div_obox = document.createElement("div");
	        div_obox.setAttribute("class", "obox");
	        // console.log(div_obox);

	        // <div class="item">
	        div_item = document.createElement("div");
	        div_item.setAttribute("class", "item");
	        div_obox.append(div_item);

	        // <div class="ihead">
	        div_ihead = document.createElement("div");
	        div_ihead.setAttribute("class", "ihead");
	        div_item.append(div_ihead);

	        // <h3>
	        h3 = document.createElement("h3");
	        h3.innerText = "Order:#" + (i + 1);
	        div_ihead.append(h3);
	        
	        const itemsCart = orderedItems.filter((e) => e.orderId === orderList[i].id);

	        // <h3>
	        h3 = document.createElement("h3");
	        h3.innerText = "Items(" + itemsCart.length + ")";
	        div_item.append(h3);

	        // Weekday 
	        
	        const d = new Date(orderList[i].createdAt);
        	const weekday = new Array("Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat");
        	const dayOfWeek = weekday[d.getDay()];
        	
	        // <p>
	        p = document.createElement("p");
	        p.innerText = (dayOfWeek) + ", " + orderList[i].createdAt  ;
	        div_item.append(p);

	        // <div class="order">
	        div_order = document.createElement("div");
	        div_order.setAttribute("class", "order");
	        div_obox.append(div_order);

	        // <div class="item_list">
	        div_item_list = document.createElement("div");
	        div_item_list.setAttribute("class", "item_list");
	        div_order.append(div_item_list);

	        const items = itemsCart;

	        // Loop for food
	        for (const item of items) {
	          // function for filtering products
	          const foodItems = product_list.filter(
	            (product) => item.productId === product.id
	          );

	          // create <h4> element for food list
	          const h4 = document.createElement("h4");
	          h4.innerText = foodItems[0].name + "(" + item.quantityOrdered +")";
	          div_item_list.append(h4);
	        }

	        // <div class="total">
	        div_total = document.createElement("div");
	        div_total.setAttribute("class", "total");
	        div_order.append(div_total);

	        // <h3> Total//
	        h3 = document.createElement("h3");
	        h3.innerText = "Total";
	        div_total.append(h3);

	        // <h4> price//
	        h4 = document.createElement("h4");
	        h4.innerText = "Rs. " + orderList[i].totalPrice;
	        div_total.append(h4);

	        // <div class="ordered_by">
	        div_ordered_by = document.createElement("div");
	        div_ordered_by.setAttribute("class", "order_by");
	        div_order.append(div_ordered_by);

	        // Find the person who ordered //
	        const orderPerson = addressList.filter((e)=> e.id === orderList[i].deliveryAddressId);
	        console.log(orderPerson);

	        // <h4> email//
	        h4 = document.createElement("h4");
	        h4.innerText = "Ordered by: " + orderPerson[0].name;
	        div_ordered_by.append(h4);

	        // <div class="view_button">
	        div_view_button = document.createElement("div");
	        div_view_button.setAttribute("class", "view_button");
	        div_order.append(div_view_button);

	        // <a class = view>
	        a_view = document.createElement("a");
	        a_view.setAttribute("class", "view");
	        a_view.setAttribute("href","/onlyhomefoodWeb/order/view?orderId=" + orderList[i].id);
	        div_view_button.append(a_view);

	        // <button>
	        button = document.createElement("button");
	        button.setAttribute("type", "button");
	        button.innerText = "View details";
	        a_view.append(button);

	        document.querySelector("div.overflowbox").prepend(div_obox);
	      }
	    }
	
	function logOut(){
		localStorage.removeItem("addressId");
		window.location.href = "/onlyhomefoodWeb/logout"
	}
	</script>

</body>
</html>