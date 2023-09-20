<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
}

section {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	margin-top: 100px;
	height: 85vh;
}

.pro {
	height: 32rem;
	width: 32rem;
	color: black;
	background-color: #fafafa;
	border-radius: 10px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3)
		0px 3px 7px -3px;
}

.pro h1 {
	background-color: #5cb748;
	border-radius: 10px 10px 0 0;
	margin: 0;
	color: white;
	text-align: center;
}

.pbox {
	display: flex;
	justify-content: space-evenly;
	margin-top: 50px;
}

.pbox img {
	margin-top: 15px;
}

.pbox button {
	height: 30px;
	margin-top: 30px;
	margin-left: 20px;
	color: white;
	border-color: transparent;
	border-radius: 5px;
	background-color: #FF7223;
	cursor: pointer;
}

input {
	height: 20px;
	border-color: transparent;
}

textarea {
	height: 90px;
	border-color: transparent;
	resize: none;
}

.sep {
	display: flex;
	flex-direction: column;
	margin-top: 20px;
	width: 90%;
}

::-webkit-scrollbar {
	display: none;
}
</style>
</head>
<body>

	<%
	User user = (User) request.getAttribute("user");
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
								href="<%=request.getContextPath()%>/logout"><button
									type="submit" id="logout_user">Logout</button></a>
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

     for (let i = 0; i < 4; i++) {
       // <div class="obox">
       div_obox = document.createElement("div");
       div_obox.setAttribute("class", "obox");
       console.log(div_obox);

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
       h3.innerText = `Order:#${i + 1}`;
       div_ihead.append(h3);

       //const itemsCart = orderItem.filter((e) => orderedItems[i].order_id === e.order_id);
       //console.log(itemsCart)

       // <h3>
       h3 = document.createElement("h3");
      // h3.innerText = `Items` + `(${itemsCart.length})`;
       h3.innerText = "Items (1)";
       div_item.append(h3);

       
       // Date format to show //
       const d = new Date(orderedItems[i].ordered_time);
       const weekday = new Array("Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat");
       const dayOfWeek = weekday[d.getDay()];
       const domEnder = (function () {
         let a = d;
         if (/1/.test(parseInt(`${a}`.charAt(0)))) return "th";
         a = parseInt(`${a}`.charAt(1));
         return a === 1 ? "st" : a === 2 ? "nd" : a === 3 ? "rd" : "th";
       })();
       const dayOfMonth = (d.getDate() < 10 ? "0" : "") + d.getDate() + domEnder;
       const months = new Array(
         "January",
         "February",
         "March",
         "April",
         "May",
         "June",
         "July",
         "August",
         "September",
         "October",
         "November",
         "December"
       );
       const curMonth = months[d.getMonth()];
       const curYear = d.getFullYear();
       const curHour =
         d.getHours() > 12
           ? d.getHours() - 12
           : d.getHours() < 10
             ? `0${d.getHours()}`
             : d.getHours();
       const curMinute =
         d.getMinutes() < 10 ? `0${d.getMinutes()}` : d.getMinutes();
       const curSeconds =
         d.getSeconds() < 10 ? `0${d.getSeconds()}` : d.getSeconds();
       const curMeridiem = d.getHours() >= 12 ? "PM" : "AM";
       const orderTime = `${dayOfMonth} ${curMonth} ${curYear},${dayOfWeek} ${curHour}:${curMinute}:${curSeconds} ${curMeridiem}`;

       // <p>
       p = document.createElement("p");
       p.innerText = orderTime;
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
           (product) => item.product_id === product.product_id
         );

         // create <h4> element for food list
         const h4 = document.createElement("h4");
         //h4.innerText = `${foodItems[0].product_name} (${item.quantity_ordered})`;
         h4.innerText = "Chapathi(2)";
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
       //h4.innerText = `Rs. ${orderedItems[i].total_price}`;
       h4.innerText = "Rs. 59";
       div_total.append(h4);

       // <div class="ordered_by">
       div_ordered_by = document.createElement("div");
       div_ordered_by.setAttribute("class", "order_by");
       div_order.append(div_ordered_by);

       // Find the person who ordered //
       const deliveryPersonName = address.filter((e)=> e.address_id === orderedItems[i].delivery_address_Id);
       console.log(deliveryPersonName)

       // <h4> email//
       h4 = document.createElement("h4");
       //h4.innerText = `Ordered by: ${deliveryPersonName[0].name}`;
       h4.innerText = "Ordered by: Inba";
       div_ordered_by.append(h4);

       // <div class="view_button">
       div_view_button = document.createElement("div");
       div_view_button.setAttribute("class", "view_button");
       div_order.append(div_view_button);

       // <a class = view>
       a_view = document.createElement("a");
       a_view.setAttribute("class", "view");
       a_view.setAttribute(
         "href",
         `./orderhistory.html?order_id=${orderedItems[i].order_id}`
       );
       div_view_button.append(a_view);

       // <button>
       button = document.createElement("button");
       button.setAttribute("type", "button");
       button.innerText = "View details";
       a_view.append(button);

       document.querySelector("div.overflowbox").prepend(div_obox);
     }
	</script>

</body>
</html>