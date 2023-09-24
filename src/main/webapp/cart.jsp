<%@page import="in.fssa.onlyhomefood.model.Address"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart</title>
<link href="assets/css/cart.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
	Object products = (Object) request.getSession().getAttribute("productList");
	%>

	<%
	User user = (User) request.getAttribute("user");
	%>

	<%
	Object defaultAddress = (Object) request.getAttribute("defaultAddress");
	%>

	<%
	Long loggedNumber = (Long) request.getSession().getAttribute("loggedNumber");
	%>



	<jsp:include page="header.jsp"></jsp:include>

	<div class="hord">
		<h1>My Cart</h1>
	</div>

	<div class="content">
		<div class="placed">
			<img src="assets/Images/tick-removebg-preview.png" alt="tick image">
			<h2>Thank you!</h2>
			<p>Your order has been placed sucessfully.</p>
			<a href="profile">
				<button>View order</button>
			</a>
		</div>
	</div>

	<section id="content">

		<div class="list">
			<div class="lorder">
				<img class="emptyCart" src="assets/Images/empty cart.jpg"
					alt="empty_cart" style="display: none;">
				<h2 class="noItems" style="display: none;">No Items in your
					cart!!</h2>
				<div class="add-items">
					<a href="menu"> <input type="button" value="+ Add items"
						id="addItems">
					</a>
				</div>
			</div>

			<div class="summary" style="display: none;">
				<h2>SUMMARY</h2>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">
	let div_obox;
    let img;
    let div_olist;
    let h2;
    let div_plist;
    let div_linfo;
    let div_rinfo;
    let p;
    let h4;
    let div_dropbox;
    let select;
    let option;
    let div_slist;
    let div_add;
    let img_minus;
    let img_plus;
    let h3;
    let button;

    // For summary//

    let div_food_items;
    let h4_name;
    let p_rate;
    let h4_lsum;
    let p_rsum;
    let div_sum3;
    let div_dtime;
    let p_time;

    //********Order food list********//

    // Read Products function //
    
    
    let cartProducts = JSON.parse(localStorage.getItem("cart_product")) || [];

    const userProducts = cartProducts.filter((e) => e.user_id === <%=loggedNumber%>);
	
    let productsList = <%=products%>;

   	const cart_list = productsList.filter((e) =>
    	userProducts.some((p) => e.id === p.product_id)
  	);
    
    if (userProducts === [] || userProducts.length === 0) {
      document.querySelector(".emptyCart").style.display = "";
      document.querySelector(".noItems").style.display = "";
      document.getElementById("addItems").style = "width: 27rem";
    }
    else {

      for (let i = 0; i < cart_list.length; i++) {
        document.querySelector(".summary").style.display = "";
        // <div class="obox">
        div_obox = document.createElement("div");
        div_obox.setAttribute("class", "obox");
        console.log(div_obox);

        // <img class="food">
        img = document.createElement("img");
        img.setAttribute("src", cart_list[i].image);
        img.setAttribute("alt", cart_list[i].name + " image");
        img.setAttribute("class", "food");
        div_obox.append(img);

        // <div class="olsit">
        div_olist = document.createElement("div");
        div_olist.setAttribute("class", "olist");
        div_obox.append(div_olist);

        // <h2>
        h2 = document.createElement("h2");
        h2.innerText = cart_list[i].name;
        div_olist.append(h2);

        // <div class="plist">
        div_plist = document.createElement("div");
        div_plist.setAttribute("class", "plist");
        div_olist.append(div_plist);

        // <div class="linfo">
        div_linfo = document.createElement("div");
        div_linfo.setAttribute("class", "linfo");
        div_plist.append(div_linfo);

        // <p>
        p = document.createElement("p");
        p.innerText = "Quantity:";
        div_linfo.append(p);

        p = document.createElement("p");
        p.innerText = "Price:";
        div_linfo.append(p);

        p = document.createElement("p");
        p.innerText = "Delivery time:";
        div_linfo.append(p);

        // <div class="rinfo">
        div_rinfo = document.createElement("div");
        div_rinfo.setAttribute("class", "rinfo");
        div_plist.append(div_rinfo);

        // <h4>
        h4 = document.createElement("h4");
        h4.innerText = cart_list[i].quantity + " "  + cart_list[i].quantityType;
        div_rinfo.append(h4);

        h4 = document.createElement("h4");
        h4.setAttribute("class", "food_price");
        h4.innerText = "Rs." + cart_list[i].price;
        div_rinfo.append(h4);

        // <div class="dropbox">
        div_dropbox = document.createElement("div");
        div_dropbox.setAttribute("class", "dropbox");
        div_rinfo.append(div_dropbox);

        // find from product id

        const find = userProducts.find((e) => e.product_id === cart_list[i].id);

        // <select class="select">
        select = document.createElement("select");
        select.setAttribute("class", "select");
        select.setAttribute("required", "required");
        select.setAttribute("name", "time");
        div_dropbox.append(select);

        // <option>
        option = document.createElement("option");
        if (find.delivery_time === "") {
          option.innerText = "-- Select the delivery time --";
        } else {
        	if(find.delivery_time === "Breakfast"){	
        		option.innerText = "Breakfast (7:30 AM to 9:00 AM)";
        	}
        	else if(find.delivery_time === "Lunch"){	
        		option.innerText = "Lunch (12:30 AM to 2:00 PM)";
        	}
        	else if(find.delivery_time === "Dinner"){
        		option.innerText = "Dinner (7:00 PM to 8:30 PM)";
        	}
        }
        
        select.append(option);

        option = document.createElement("option");
        option.setAttribute("class", "selected_option");
        option.setAttribute("id", "option_1");
        option.setAttribute("value", "Breakfast");
        option.innerText = "Breakfast (7:30 AM to 9:00 AM)";
        select.append(option);

        option = document.createElement("option");
        option.setAttribute("class", "selected_option");
        option.setAttribute("id", "option_2");
        option.setAttribute("value", "Lunch");
        option.innerText = "Lunch (12:30 AM to 2:00 PM)";
        select.append(option);

        option = document.createElement("option");
        option.setAttribute("class", "selected_option");
        option.setAttribute("id", "option_3");
        option.setAttribute("value", "Dinner");
        option.innerText = "Dinner (7:00 PM to 8:30 PM)";
        select.append(option);

        // <div class="slist">
        div_slist = document.createElement("div");
        div_slist.setAttribute("class", "slist");
        div_olist.append(div_slist);

        // <div class="add">
        div_add = document.createElement("div");
        div_add.setAttribute("class", "add");
        div_slist.append(div_add);

        // <img class=minus>
        img_minus = document.createElement("img");
        img_minus.setAttribute("src", "assets/Images/icon-minus.svg");
        img_minus.setAttribute("class", "minus");
        img_minus.setAttribute("alt", "icon minus");
        div_add.append(img_minus);

        // <h3>
        h3 = document.createElement("h3");
        h3.setAttribute("class", "num");
        h3.innerText = find.quantity_ordered;
        div_add.append(h3);

        // <img class=minus>
        img_plus = document.createElement("img");
        img_plus.setAttribute("src", "assets/Images/icon-plus.svg");
        img_plus.setAttribute("class", "plus");
        img_plus.setAttribute("id", "plus_quantity");
        img_plus.setAttribute("alt", "icon plus");
        div_add.append(img_plus);

        // <button>
        button = document.createElement("button");
        button.setAttribute("type", "button");
        button.setAttribute("class", "remove_cart");
        button.setAttribute("data-product_id", cart_list[i].id);
        button.innerText = "Remove";
        div_slist.append(button);

        document.querySelector("div.lorder").prepend(div_obox);
      }

      // Function for the remove duplicate option //
      document.querySelectorAll("select").forEach((selectOption) => {
        const options = [];
        selectOption.querySelectorAll("option").forEach((eachOption) => {
          if (options.includes(eachOption.innerText)) eachOption.remove();
          else options.push(eachOption.innerText);
        });
      });

      // ********Summary********//
      // <div class="sumlist">
      const div_sumlist = document.createElement("div");
      div_sumlist.setAttribute("class", "sumlist");

      for (let j = 0; j < cart_list.length; j++) {
        const productSummary = userProducts.find((e) => e.product_id === cart_list[j].id);
        
        // <div class="sum">
        div_sum3 = document.createElement("div");
        div_sum3.setAttribute("class", "sum");
        div_sumlist.prepend(div_sum3);

        // <div class="dtime">
        div_dtime = document.createElement("div");
        div_dtime.setAttribute("class", "dtime");
        div_sum3.append(div_dtime);

        // <p class="time">
        p_time = document.createElement("p");
        p_time.setAttribute("class", "time");
        p_time.innerText = "(Tomorrow) " + productSummary.delivery_time;
        div_dtime.append(p_time);
        // <div class="food_items">
        div_food_items = document.createElement("div");
        div_food_items.setAttribute("class", "food_items");
        div_sumlist.prepend(div_food_items);

        // <h4 class="name">
        h4_name = document.createElement("p");
        h4_name.setAttribute("class", "name");
        h4_name.innerText = cart_list[j].name +" ("+ productSummary.quantity_ordered+")";
        div_food_items.append(h4_name);

        // <p class="rate">
        p_rate = document.createElement("p");
        p_rate.setAttribute("class", "rate");
        p_rate.innerText = "Rs. " + (cart_list[j].price * productSummary.quantity_ordered);
        div_food_items.append(p_rate);
      }

      // <div class="sum">
      const div_sum4 = document.createElement("div");
      div_sum4.setAttribute("class", "sum");
      div_sumlist.append(div_sum4);

      // <h4 class="lsum">
      h4_lsum = document.createElement("h4");
      h4_lsum.setAttribute("class", "lsum");
      h4_lsum.innerText = "Delivery charge";
      div_sum4.append(h4_lsum);

      // <p class="rsum">
      p_rsum = document.createElement("p");
      p_rsum.setAttribute("class", "rsum");
      p_rsum.innerText = "Free";
      div_sum4.append(p_rsum);
      

      // <div class="sum">
      const div_sum5 = document.createElement("div");
      div_sum5.setAttribute("id", "sum_total");
      div_sum5.setAttribute("class", "sum");
      div_sumlist.append(div_sum5);

      const div_total = document.createElement("div");
      div_total.setAttribute("class", "total");
      div_sum5.append(div_total);

      // <h4 class="lsum">
      h4_lsum = document.createElement("h4");
      h4_lsum.setAttribute("class", "lsum");
      h4_lsum.innerText = "Total";
      div_total.append(h4_lsum);

      // Cart total function //

      const totalPrice = cart_list;
      let price = 0;
      for (let i = 0; i < totalPrice.length; i++) {
        const find = userProducts.find((e) => e.product_id === cart_list[i].id);
        price += parseInt(totalPrice[i].price * find.quantity_ordered);
      }

      // <p class="rsum">
      p_rsum = document.createElement("p");
      p_rsum.setAttribute("id", "total_cost");
      p_rsum.setAttribute("class", "rsum");
      p_rsum.innerText = "Rs. " + price;
      div_total.append(p_rsum);

      // To get the default address //

      function addressCard(defaultAddress){
          if (defaultAddress === null || defaultAddress === undefined ) {
            // Create the <div> element
            const divElement = document.createElement('div');
            divElement.setAttribute('class', 'empty-address');

            // Create the <h3> element
            const h3Element = document.createElement('h3');
            h3Element.textContent = 'No address found!';

            // Create the <button> element
            const buttonElement = document.createElement('button');
            buttonElement.setAttribute('class', 'btn-add');
            buttonElement.textContent = 'Add address';

            // Append the <h3> and <button> elements to the <div> element
            divElement.appendChild(h3Element);
            divElement.appendChild(buttonElement);
            div_sumlist.append(divElement);

            // Add address location //
            buttonElement.addEventListener("click", function addAddress() {
              window.location.href = "address/book";
            })
            
          }
          else {
            // Address //

            // Create the selected-address container element
            const selectedAddressContainer = document.createElement('div');
            selectedAddressContainer.classList.add('selected-address');
            selectedAddressContainer.setAttribute("data-addressId", defaultAddress.id);
            div_sumlist.append(selectedAddressContainer);

            // Create the top-tittle element
            const topTitle = document.createElement('div');
            topTitle.classList.add('top-tittle');

            // Create the shippment-address heading
            const shipmentAddressHeading = document.createElement('h3');
            shipmentAddressHeading.classList.add('shippment-address');
            shipmentAddressHeading.textContent = 'Delivery Address';

            // Create the change address button
            const changeAddressButton = document.createElement('button');
            changeAddressButton.classList.add('btn-change');
            changeAddressButton.textContent = 'Change Address';

            // Append the heading and button to the top-tittle element
            topTitle.appendChild(shipmentAddressHeading);
            topTitle.appendChild(changeAddressButton);

            // Create the detailsBox element
            const detailsBox = document.createElement('div');
            detailsBox.classList.add('detailsBox');

            // Create the location-image element
            const locationImage = document.createElement('div');
            locationImage.classList.add('location-image');

            // Create the image element
            const image = document.createElement('img');
            image.src = 'assets/Images/locator.png';
            image.alt = 'locator image';
            locationImage.appendChild(image);

            // Create the user-details element
            const userDetails = document.createElement('div');
            userDetails.classList.add('user-details');

            // Create the name paragraph
            const nameParagraph = document.createElement('p');
            nameParagraph.classList.add('dname');
            nameParagraph.textContent = defaultAddress.name;

            // Create the mobile number paragraph
            const mobileNumberParagraph = document.createElement('p');
            mobileNumberParagraph.classList.add('dmobNumber');
            mobileNumberParagraph.textContent = defaultAddress.phoneNumber;

            // Create the street paragraph
            const streetParagraph = document.createElement('p');
            streetParagraph.classList.add('dstreet');
            streetParagraph.textContent = defaultAddress.streetName;

            // Create the locality paragraph
            const localityParagraph = document.createElement('p');
            localityParagraph.classList.add('dlocality');
            localityParagraph.textContent = defaultAddress.townName;

            // Create the city paragraph
            const cityParagraph = document.createElement('p');
            cityParagraph.classList.add('dcity');
            cityParagraph.textContent = defaultAddress.city + " - " + defaultAddress.pinCode;

            // Append the paragraphs to the user-details element
            userDetails.appendChild(nameParagraph);
            userDetails.appendChild(mobileNumberParagraph);
            userDetails.appendChild(streetParagraph);
            userDetails.appendChild(localityParagraph);
            userDetails.appendChild(cityParagraph);

            // Append the location-image and user-details elements to the detailsBox element
            detailsBox.appendChild(locationImage);
            detailsBox.appendChild(userDetails);

            // Append the top-tittle and detailsBox elements to the selected-address container element
            selectedAddressContainer.appendChild(topTitle);
            selectedAddressContainer.appendChild(detailsBox);

            // Change address location //
            changeAddressButton.addEventListener("click", function changeAddress() {
              window.location.href = "address/book?type=SelectAddress";
            })
            
            
          }
          
          // <button class="place_order">
          const button_place_order = document.createElement("button");
          button_place_order.setAttribute("class", "place_order");
          button_place_order.setAttribute("onclick", "placeOrder()");
          button_place_order.innerText = "Place Order";
          div_sumlist.append(button_place_order);
   


        }
		
      
		let addressId = JSON.parse(localStorage.getItem("addressId")) || [];
		
		let defaultAddress = [];  // Initialize defaultAddress as an empty array
		const selectedAddress = []; 
		let root = window.location.origin + "/onlyhomefoodWeb";
		let globalDefaultAddress;  // Define a global variable to store defaultAddress
		
		const addresId = JSON.parse(localStorage.getItem("addressId")) || [];
		
		if (addressId > 0) {
			async function getAddress() {
			    const response = await fetch(root + "/address/get?addressId=" + addresId);
			    try {
			        if (response.ok) {
			            const data = await response.json();
			            if (data.status === 200) {
			                selectedAddress.push(data.data);
			            }
			        }
			    } catch (error) {
			        console.error(error);
			        alert(error);
			    }
			}
			 getAddress().then(() => {
			        defaultAddress = selectedAddress[0];
			        console.log(defaultAddress);// Assign the array directly
			        addressCard(defaultAddress);
			        
			    });
		   
		} else {
		    defaultAddress = <%=defaultAddress%>; // Assign defaultAddress based on your logic
		    addressCard(defaultAddress);
		    
		}

      document.querySelector("div.summary").append(div_sumlist);

      
      // Remove products button function//
      const removeFood = document.querySelectorAll("button.remove_cart");
      removeFood.forEach(function removeItem(removeId) {
    	  removeId.addEventListener("click", function () {

          const productId = parseInt(this.dataset.product_id); //Getting product id from the button
          console.log(productId);

          const removeFood = userProducts.find((e) => e.product_id === productId); // Finding the product that matches the id

          const indexOfItem = cartProducts.indexOf(removeFood); // Finding the Index of the Project
          
          cartProducts.splice(indexOfItem, 1); // Removeing the product
			
          localStorage.setItem("cart_product", JSON.stringify(cartProducts)); // Updating the cart in localStorage
          
          window.location.reload();
        });
      });

      // plus quantity function//

      const plus = document.querySelectorAll(".plus");
      plus.forEach(function addQuantity(find_quantity) {
        find_quantity.addEventListener("click", function () {
          const parent = this.parentNode;
          const num = parent.querySelector(".num");
          let n = parseInt(num.textContent);
          if (n < 10) {
            n += 1;
          }
          num.textContent = n;
          const parentBox = this.closest(".slist");
          const idButton = parentBox
            .querySelector(".remove_cart")
            .getAttribute("data-product_id");
          
          const cart_quantity = userProducts.find((e) => e.product_id === parseInt(idButton));
          console.log(userProducts);
          if (cart_quantity) {
            cart_quantity.quantity_ordered = n.toString();
            localStorage.setItem("cart_product", JSON.stringify(cartProducts));
            window.location.reload();
          }
        });
      });

      
      const minus = document.querySelectorAll(".minus");
      minus.forEach(function minusQuantity(find_quantity) {
        find_quantity.addEventListener("click", function () {
          const parent = this.parentNode;
          const num = parent.querySelector(".num");
          let n = parseInt(num.textContent);
          if (n > 1) {
            n -= 1;
          }
          num.textContent = n;
		  	
          // getting the ID
          const parentBox = this.closest(".slist");
          const idButton = parentBox
            .querySelector(".remove_cart")
            .getAttribute("data-product_id");
          
          const cart_quantity = userProducts.find((e) => e.product_id === parseInt(idButton));
          
          if (cart_quantity) {
            cart_quantity.quantity_ordered = n.toString();
            localStorage.setItem("cart_product", JSON.stringify(cartProducts));
            window.location.reload();
          }
        });
      });

      // Funtion to get the delivery time
      const selected_time = document.querySelectorAll(".select");
      selected_time.forEach(function selectTime(find_time) {
        find_time.addEventListener("change", function () {
          const parent_Box = this.closest(".olist");

          const id_button = parent_Box
            .querySelector(".remove_cart")
            .getAttribute("data-product_id");
          const value_time = parent_Box.querySelector(".select").value;
		console.log(value_time);
          const ordered_time = userProducts.find((e) => e.product_id === parseInt(id_button));
          if (ordered_time) {
            ordered_time.delivery_time = value_time;
            localStorage.setItem("cart_product", JSON.stringify(cartProducts));
            window.location.reload();
          }
        });
      });

     
    }
    
    // Place order function
    function placeOrder(){
        // Order product function //
  		let cartProducts = JSON.parse(localStorage.getItem("cart_product")) || [];
	          	
	    let userProducts = cartProducts.filter((e) => e.user_id === <%=loggedNumber%>)
	          	
	    const total_price = document.querySelector("#total_cost").innerText.replace("Rs. ", "");
	    
	    let id = null;
	    if(<%=defaultAddress%> !== null){
			id = document.querySelector(".selected-address").getAttribute("data-AddressId");
	    }

		console.log(id);
	    
	    		
	    let delTime = "";
      for (const user of userProducts) {
      	if (user.delivery_time !== "") {
          	delTime += 1;
        	} else {
          	delTime = "";
          	alert("Please select the delivery time and quantity");
          	break;
        	}
      }         
	              
	    let totalPrice = total_price;
	    let createdBy = <%=user.getId()%>  
	    console.log(createdBy);
	    let addressId = id;

		if (id !== null) {
	    	if(delTime !== ""){
	        	if (userProducts.length > 0) {
	            	if (confirm("Confirm your order")) {
	            		
	            		let root = window.location.origin + "/onlyhomefoodWeb";

	                	const url = root + '/order/create';
	            	    console.log(userProducts);

	                  	const data = {
		                  		  "totalPrice" : totalPrice,
		                  		  "createdBy" : createdBy,
		                  		  "addressId" : addressId,
		                  		  "orderedItems" : userProducts
		                 }
	                  		                  	  
	              	  axios.post(url, data)
	              	    .then(function (response) {
	              	      const serverMsg = response.data.message;
	              	      if (serverMsg == 'success') {

	              	    	cartProducts = cartProducts.filter((e) => e.user_id != <%=loggedNumber%>)
	  	                    localStorage.setItem("cart_product", JSON.stringify(cartProducts));
	  	                    localStorage.removeItem("addressId");
	  	                      
	  	                    document.querySelector(".placed").setAttribute("style", "display:inline-block");
	  	                    document.querySelector("#content").setAttribute("style","opacity:0;");
	  	                    
	              	      } else {
	              	        console.log("server msg " + serverMsg);
	              	      }
	              	    })
	              	    .catch(function (error) {
	              	      console.log("error " + error);
	              	    });	                    


	            	}
	            } else {
	            	alert("You have not added any products to the cart");
	                window.location.href = "onlyhomefoodWeb/menu";
	            }
	        }
		}else {
	    	alert("Add your address")
	    }
	}
    
    
	</script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</body>
</html>