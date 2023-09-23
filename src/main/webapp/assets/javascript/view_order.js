let p;
let div_order;
let image;
let div_name;
let p_fname;
let div_cbut;
let button;

const url = window.location.search;
const urlParams = new URLSearchParams(url);
const orderId = urlParams.get("orderId");

const orders = order_history.find((e) => e.id === parseInt(orderId));

const items = orderItem.filter((e) => e.orderId === orders.id);

const foodData = product_list.filter((product) =>
	items.some((id) => id.productId === product.id)
);
// console.log(foodData)

// <div class="popuup">
const div_popup = document.createElement("div");
div_popup.setAttribute("class", "popup");
console.log(div_popup);

// <h3> order_num
const h3_order_num = document.createElement("h3");
h3_order_num.innerText = "Order id: " + (orderId);
div_popup.append(h3_order_num);

// <div class="phead">
const div_phead = document.createElement("div");
div_phead.setAttribute("class", "phead");
div_popup.append(div_phead);

// <p>
p = document.createElement("p");
p.innerText = "Food Name";
div_phead.append(p);

p = document.createElement("p");
p.setAttribute("class", "quan");
p.innerText = "Quantity";
div_phead.append(p);

p = document.createElement("p");
p.innerText = "Price";
div_phead.append(p);

p = document.createElement("p");
p.innerText = "Delivery";
div_phead.append(p);

// Order list //
for (let i = 0; i < foodData.length; i++) {
	// <div class="order">
	div_order = document.createElement("div");
	div_order.setAttribute("class", "orderr");
	div_popup.append(div_order);

	image = document.createElement("img");
	image.setAttribute("src", foodData[i].image);
	image.setAttribute("alt", `${foodData[i].name} image`);
	div_order.append(image);

	div_name = document.createElement("div");
	div_name.setAttribute("class", "name");
	div_order.append(div_name);

	p_fname = document.createElement("p");
	p_fname.setAttribute("class", "fname");
	p_fname.innerText = foodData[i].name;
	div_name.append(p_fname);

	p_fname = document.createElement("p");
	p_fname.setAttribute("class", "fname");
	p_fname.innerText = foodData[i].type;
	div_name.append(p_fname);

	p = document.createElement("p");
	p.setAttribute("class", "quantity");
	p.innerText = items[i].quantityOrdered;
	div_order.append(p);


	p = document.createElement("p");
	p.setAttribute("class", "cost");
	p.innerText = `Rs. ${foodData[i].price * items[i].quantityOrdered}`;
	div_order.append(p);

	p = document.createElement("p");
	p.setAttribute("class", "deliveryStatus");
	if (items[i].orderStatus === "Not_delivered") {
		p.innerText = "(" + items[i].deliveryTime[0] + ") " + "Not Delivered";
	}
	else {
		p.innerText = "(" + items[i].deliveryTime[0] + ") " + items[i].orderStatus;
	}
	div_order.append(p);

}

// To get the address //

let address = JSON.parse(localStorage.getItem("address"));

let deliveryAddress = addressList.filter((e) => e.id === orders.deliveryAddressId);

console.log(deliveryAddress)
// Create the outermost div element with class "delivery-address-box"
const deliveryAddressBox = document.createElement("div");
deliveryAddressBox.classList.add("delivery-address-box");
div_popup.append(deliveryAddressBox);

// Create the div element with class "address-head"
const addressHead = document.createElement("div");
addressHead.classList.add("address-head");

// Create the image element
const houseimage = document.createElement("img");
houseimage.classList.add("greenHouse");
houseimage.src = "../assets/Images/Green house.png";
houseimage.alt = "green house image";

// Create the h2 element with class "side-head"
const heading = document.createElement("h2");
heading.classList.add("side-head");
heading.textContent = "Delivery details";

// Append the image and heading elements to the addressHead div
addressHead.appendChild(houseimage);
addressHead.appendChild(heading);

// Create the div element with class "address-content"
const addressContent = document.createElement("div");
addressContent.classList.add("address-content");

// Create the p elements with the respective content
const nameParagraph = document.createElement("p");
nameParagraph.classList.add("delivery-name");
nameParagraph.textContent = deliveryAddress[0].name;

const addressParagraph = document.createElement("p");
addressParagraph.textContent = deliveryAddress[0].streetName + ", " + deliveryAddress[0].townName;

const locationParagraph = document.createElement("p");
locationParagraph.textContent = deliveryAddress[0].city + " - " + deliveryAddress[0].pinCode;

const mobileParagraph = document.createElement("p");
mobileParagraph.textContent = "Mobile - " + deliveryAddress[0].phoneNumber;

// Append the p elements to the addressContent div
addressContent.appendChild(nameParagraph);
addressContent.appendChild(addressParagraph);
addressContent.appendChild(locationParagraph);
addressContent.appendChild(mobileParagraph);

// Append the addressHead and addressContent divs to the deliveryAddressBox div
deliveryAddressBox.appendChild(addressHead);
deliveryAddressBox.appendChild(addressContent);


// <div class="dpara">
const div_dpara = document.createElement("div");
div_dpara.setAttribute("class", "dpara");
div_popup.append(div_dpara);

// <div class="lpara">
const div_lpara = document.createElement("div");
div_lpara.setAttribute("class", "lpara");
div_dpara.append(div_lpara);

// <p>
p = document.createElement("p");
p.innerText = "Ordered time";
div_lpara.append(p);

p = document.createElement("p");
p.innerText = "Total";
div_lpara.append(p);

p = document.createElement("p");
p.innerText = "Payment";
div_lpara.append(p);

// <div class="spara">
const div_spara = document.createElement("div");
div_spara.setAttribute("class", "spara");
div_dpara.append(div_spara);

// Date format to show //

// Weekday 

const d = new Date(orders.createdAt);
const weekday = new Array("Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat");
const dayOfWeek = weekday[d.getDay()];


// <p>
p = document.createElement("p");
p.innerText = dayOfWeek + ", " + orders.createdAt;
div_spara.append(p);

p = document.createElement("p");
p.innerText = `Rs.${orders.totalPrice}`;
div_spara.append(p);

p = document.createElement("p");
p.innerText = "COD";
div_spara.append(p);

// <p class="impnote">
p = document.createElement("p");
p.setAttribute("class", "impnote");
p.innerText =
	"Note: You can only cancel your order on the same day of the placement.";
div_popup.append(p);

// <div class="cbut">
div_cbut = document.createElement("div");
div_cbut.setAttribute("class", "cbut");
div_popup.append(div_cbut);

// Function for button //
const startTime = d;

const endTime = new Date(
	startTime.getFullYear(),
	startTime.getMonth(),
	startTime.getDate() + 1, 0, 0, 0, 0
);
const now = new Date();

if (endTime > now) {
	// <button>
	if (items[0].orderStatus === "Cancelled") {
		button = document.createElement("button");
		button.setAttribute("class", "cancel_order");
		button.setAttribute("style", "display:none");
		button.innerText = "Cancel order";
		div_cbut.append(button);
	} else {
		button = document.createElement("button");
		button.setAttribute("class", "cancel_order");
		button.setAttribute("onclick", "cancel()");
		button.innerText = "Cancel order";
		div_cbut.append(button);
	}
}

button = document.createElement("button");
button.setAttribute("class", "re_order");
button.setAttribute("onclick", "re_order()");
button.innerText = "Re-order";
div_cbut.append(button);

// <button>
button = document.createElement("button");
button.setAttribute("onclick", "btn()");
button.setAttribute("type", "close");
button.innerText = "Close";
div_cbut.append(button);

document.querySelector("section.order_details").append(div_popup);

function btn() {
	window.location.href = "../profile";
}

function cancel() {
	if (confirm("This order will be cancelled completely")) {
		window.location.href = "/onlyhomefoodWeb/order/cancel?orderId=" + orderId;
	}
}

function re_order() {

	let cartProduct = JSON.parse(localStorage.getItem("cart_product")) || [];
	console.log(cartProduct);
	console.log(userNumber);
	cartProduct = cartProduct.filter((e) => e.user_id != userNumber);
	console.log(cartProduct);
	
	for(let i = 0; i < items.length; i++){
		let reorderItems = {
			"user_id" : userNumber,
			"product_id" : items[i].productId,
			"quantity_ordered" : items[i].quantityOrdered,
			"delivery_time" : items[i].deliveryTime
		}
		
		cartProduct.push(reorderItems);
	}
	localStorage.setItem("cart_product", JSON.stringify(cartProduct));
	alert("Your product is added to the cart");
	window.location.href = "../cart";
}