<%@page import="in.fssa.onlyhomefood.model.Address"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address List</title>
<link href="<%=request.getContextPath()%>/assets/css/my address.css"
	rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%
	Object userAddressList = (Object) request.getAttribute("addressList");
	%>

	<h1 class="add">Address Book</h1>
	<section class="address-total">
		<p class="selectHead">Select Delivery Address</p>
		<div class="div-address">
			<button class="addAddress" id="addressForm">Add address</button>
		</div>
		<div class="addressContainer"></div>

	</section>

	<div class="done-box">
		<div class="selected-container">
			<div class="selected-gif">
				<img src="<%=request.getContextPath()%>/assets/Images/Location.gif"
					alt="location gif">
			</div>
			<h2>Address has been selected sucessfully!</h2>
			<div class="done-button">
				<button type="button" class="btn-done">Done</button>
			</div>

		</div>
	</div>

	<script>

        let userAddress = <%=userAddressList%>
        

        for (let i = 0; i < userAddress.length; i++) {
            // Create the main container element
            const addressBox = document.createElement("div");
            addressBox.classList.add("addressBox");
            addressBox.setAttribute("data-address", userAddress[i].id);

            const details = document.createElement("div");
            details.classList.add("details");
            addressBox.appendChild(details);

            // Create the tick_image container element
            const tickImageContainer = document.createElement("div");
            tickImageContainer.classList.add("tick_image");
            details.appendChild(tickImageContainer);

            // Create the tick image element
            const greenTickImage = document.createElement("img");
            greenTickImage.classList.add("green_tick");
            tickImageContainer.appendChild(greenTickImage);

            // Create the h3 element for "Address 1"
            const addressHeading = document.createElement("h3");
            addressHeading.classList.add("no-address");
            addressHeading.textContent = "Address " + [i + 1];
            details.appendChild(addressHeading);

            // Create the name paragraph element
            const nameParagraph = document.createElement("p");
            nameParagraph.classList.add("name");
            nameParagraph.textContent = userAddress[i].name;
            details.appendChild(nameParagraph);

            // Create the street paragraph element
            const streetParagraph = document.createElement("p");
            streetParagraph.classList.add("street");
            streetParagraph.textContent = userAddress[i].streetName + ",";
            details.appendChild(streetParagraph);

            // Create the locality paragraph element
            const localityParagraph = document.createElement("p");
            localityParagraph.classList.add("locality");
            localityParagraph.textContent = userAddress[i].townName + ",";
            details.appendChild(localityParagraph);

            // Create the city paragraph element
            const cityParagraph = document.createElement("p");
            cityParagraph.classList.add("city");
            cityParagraph.textContent = userAddress[i].city + " - " + userAddress[i].pinCode;
            details.appendChild(cityParagraph);

            // Create the mobile number paragraph element
            const mobNumberParagraph = document.createElement("p");
            mobNumberParagraph.classList.add("mobNumber");
            mobNumberParagraph.textContent = "MOBILE : " + userAddress[i].phoneNumber;
            details.appendChild(mobNumberParagraph);

            // Create the "div_buttons"
            const divButtons = document.createElement("div");
            divButtons.classList.add("buttons");
            addressBox.appendChild(divButtons);

            if (userAddress[i].defaultStatus !== true) {
                // Create the "Set as default" button
                const setDefaultButton = document.createElement("button");
                setDefaultButton.classList.add("btn-set");
                setDefaultButton.type = "button";
                setDefaultButton.innerText = "Set as default";
                divButtons.appendChild(setDefaultButton);
            }
            else {
            	console.log("Inba");
                addressBox.classList.add("selectedBox");
                addressHeading.textContent = "Address " + [i + 1] + " (Default)";
                greenTickImage.setAttribute("src", "/onlyhomefoodWeb/assets/Images/green_tick-removebg-preview.png");
                greenTickImage.setAttribute("alt", "tickImage");
            }

            // Create the "Edit address" button
            const editAddressButton = document.createElement("button");
            editAddressButton.classList.add("btn-edit");
            editAddressButton.innerText = "Edit";
            divButtons.appendChild(editAddressButton);

            // Create the "Remove" button
            const removeButton = document.createElement("button");
            removeButton.classList.add("btn-remove");
            removeButton.innerText = "Remove";
            divButtons.appendChild(removeButton);

            // Append the addressBox to the document body or any desired parent element
            document.querySelector("div.addressContainer").append(addressBox);
        }

        document.getElementById("addressForm").addEventListener("click", function formLocation() {
            window.location.href = "new?form=CreateAddress";
        })

        // For selecting the address after the cart process //
        const url = window.location.search;
        const urlParams = new URLSearchParams(url);
        const addressStatus = urlParams.get("type");
        console.log(addressStatus);

        if (addressStatus === "SelectAddress") {

            document.querySelector(".btn-done").addEventListener("click", function goCart() {
                window.location.href = '/onlyhomefoodWeb/cart';
            })

            let selectedBox = null;

            let Box = document.querySelectorAll(".details");

            let defaultSelectedBox = document.querySelector(".selectedBox");
            let defaultSelectedTick = defaultSelectedBox.querySelector(".green_tick");
            defaultSelectedTick.setAttribute("src", "/onlyhomefoodWeb/assets/Images/green_tick-removebg-preview.png");
            defaultSelectedTick.setAttribute("alt", "tickImage");
            selectedBox = defaultSelectedBox;

            Box.forEach(function (findDiv) {
                findDiv.addEventListener("click", function () {

                    if (selectedBox === this) {
                        this.classList.remove("selectedBox");
                        let select = this.querySelector(".green_tick");
                        select.removeAttribute("src", "/onlyhomefoodWeb/assets/Images/green_tick-removebg-preview.png");
                        select.removeAttribute("alt", "tickImage");
                        selectedBox = null;
                    }
                    else {
                        if (selectedBox !== null) {
                            selectedBox.classList.remove("selectedBox");
                            let select = selectedBox.querySelector(".green_tick");
                            select.removeAttribute("src", "/onlyhomefoodWeb/assets/Images/green_tick-removebg-preview.png");
                            select.removeAttribute("alt", "tickImage");
                        }

                        let parentBox = this.closest(".addressBox");
                        let address_id = parentBox.dataset.address
                        parentBox.classList.add("selectedBox");
                        let select = parentBox.querySelector(".green_tick");
                        select.setAttribute("src", "/onlyhomefoodWeb/assets/Images/green_tick-removebg-preview.png");
                        select.setAttribute("alt", "tickImage");
                        localStorage.setItem("addressId", JSON.stringify(address_id));
                        selectedBox = parentBox;

                        // For the popup
                        function popUp() {
                            document.querySelector(".selected-container").style.display = "inline-block";
                            document.querySelector(".address-total").setAttribute("style", "display:none");
                        }

                        setTimeout(popUp, 180)

                    }
                });
            });
        }

        // Function for set the default address //
        let setDefault = document.querySelectorAll(".btn-set");
        setDefault.forEach(function addressSet(set) {
            set.addEventListener("click", function setEach() {

                let parentDiv = this.closest(".addressBox");
                let address_id = parentDiv.dataset.address;
           		
                console.log(address_id);
                const url = '/onlyhomefoodWeb/address/status';  // Replace with your actual API endpoint
                
                const formdata = new FormData();
                formdata.append("address_id",address_id);
                
                const requestOptions = {
                  method: 'POST',
                  headers: {
                	  "Content-Type": "application/x-www-form-urlencoded"
                  },
                  body: new URLSearchParams(formdata).toString(),
                };

                fetch(url, requestOptions)
                  .then(response => {
                    if (!response.ok) {
                      throw new Error('Network response was not ok');
                    }
                    
                    location.reload();
                  })
                  .then(data => {
                    console.log('Data:', data);
                  })
                  .catch(error => {
                    console.error('Error:', error);
                  });

                
                
            });
        });

        // Function to remove the address //
        let removeAddress = document.querySelectorAll(".btn-remove");
        removeAddress.forEach(function addressRemove(remove) {
            remove.addEventListener("click", function removeEach() {
                let parentDiv = this.closest(".addressBox");
                let address_id = parentDiv.dataset.address;

				const url = '/onlyhomefoodWeb/address/delete';  // Replace with your actual API endpoint
                
                const formdata = new FormData();
                formdata.append("address_id",address_id);
                
                const requestOptions = {
                  method: 'POST',
                  headers: {
                	  "Content-Type": "application/x-www-form-urlencoded"
                  },
                  body: new URLSearchParams(formdata).toString(),
                };

                fetch(url, requestOptions)
                  .then(response => {
                    if (!response.ok) {
                      throw new Error('Network response was not ok');
                    }
                    
                    location.reload();
                  })
                  .then(data => {
                    console.log('Data:', data);
                  })
                  .catch(error => {
                    console.error('Error:', error);
                  });

                
            })
        })

        // Function to edit address //
        let editAddress = document.querySelectorAll(".btn-edit");
        editAddress.forEach(function addressEdit(edit) {
            edit.addEventListener("click", function editEach() {
                let parentDiv = this.closest(".addressBox");
                let address_id = parentDiv.dataset.address;
                window.location.href = "edit?form=EditAddress&id=" + address_id;

            })
        })
    </script>
</body>
</html>