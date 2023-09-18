const root = window.location.origin;



const createAddress =
	` 
<div class="new">
<div class="addressBox">
    <a href="home">
        <img src="${root}/onlyhomefoodWeb/assets/Images/LOGO.png" alt="logo">
    </a>
    <h1>Address</h1>
    <form action="create" role="form" name="address" id="address-form" method="post" autocomplete="off">

        <label for="name">Name</label>
        <input type="text" id="name" name="name" placeholder="Jhon" pattern="[a-zA-Z ]+" title="Name must contain only alphabets with a single space in between them"
            minlength="3" required autocomplete="off">
        <label for="mobile_number">Mobile No</label>
        <input type="tel" id="mobile_number" name="mobile_number" placeholder="Mobile No" pattern="[6-9]{1}[0-9]{9}" maxlength="10"
            title="Write your 10-digit mobile number." required>
        <label for="addressSearch">Location</label>
        <input type="text" id="addressSearch" name="addressSearch" placeholder="Search your location" required autocomplete="off">
        <label for="house_number">House no, Flat no, Street name</label>
        <input type="text" class="houseNumber" name="house_number" id="house_number" placeholder="No.7, C.L.V nagar" required />
        <label for="town_name">Town or Village Name</label>
        <input type="text" id="town_name" name="town_name" placeholder="Kanathur" required>
        <label for="city">City</label>
        <input type="text" id="city" name="city" placeholder="Chennai" required>
        <label for="pinCode">Pin Code</label>
        <input type="number" id="pinCode" name="pincode" min="600001" max="643253"
            pattern="[6]{1}[0-4]{2}[0-9]{4}" maxlength="6" placeholder="603112"
            title="Sorry! We are currently available only in Tamil Nadu" required />
        <label for="state">State</label>
        <input type="text" id="state" name="state" placeholder="TN" pattern="TN"
            title="Sorry! We are currently available only in Tamil Nadu" required />

        <p class="address-note">Note: Some fields may give improper inputs while autocomplete. Kindly check and
            fill the address properly.</p>
        <div class="default">
        	
            <input type="checkbox" id="checkBox">
            <label for="checkBox">Set as default address</label>
			<input type="hidden" id="hiddenBox" name="default_status" value="false">
        </div>

        <button type="submit" class="btn-secondary">Add address
        </button>
    </form>
</div>
</div>
`

const editAddress =
	`
<div class="new">
<div class="addressBoxEdit">
    <a href="home">
        <img src="${root}/onlyhomefoodWeb/assets/Images/LOGO.png" alt="logo">
    </a>
    <h1>Edit Address</h1>
    <form role="form" action="update?id=${userAddress?.id}" id="address-save" method="post" autocomplete="off">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" placeholder="Jhon" pattern="[a-zA-Z ]+" title="Write your name properly"
            minlength="3" required autocomplete="off">
        <label for="mobile_number">Mobile No</label>
        <input type="tel" id="mobile_number" name="mobile_number" placeholder="Mobile No" pattern="[6-9]{1}[0-9]{9}" maxlength="10"
            title="Write your 10-digit mobile number." required>
        <label for="addressSearch">Location</label>
        <input type="text" id="addressSearch" name="addressSearch" placeholder="Enter a location" required>
        <label for="house_number">House no, Flat no, Street name</label>
        <input type="text" class="houseNumber" name="house_number" id="house_number" placeholder="No.7, C.L.V nagar" required />
        <label for="town_name">Town or Village Name</label>
        <input type="text" id="town_name" name="town_name" placeholder="Kanathur" required>
        <label for="city">City</label>
        <input type="text" id="city" name="city" placeholder="Chennai" required>
        <label for="pinCode">Pin Code</label>
        <input type="number" id="pinCode" name="pincode" min="600001" max="643253"
            pattern="[6]{1}[0-4]{2}[0-9]{4}" maxlength="6" placeholder="603112"
            title="Sorry! We are currently available only in Tamil Nadu" required />
        <label for="state">State</label>
        <input type="text" id="state" name="state" placeholder="TN" pattern="TN"
            title="Sorry! We are currently available only in Tamil Nadu" required/>
            
        <button type="submit" class="btn-secondary">Save address
        </button>
    </form>
</div>
</div>
`

const url = window.location.search;
const urlParams = new URLSearchParams(url);
const addressFrom = urlParams.get("form");
const addressUniqueId = urlParams.get("id")

console.log(addressUniqueId);

if (addressFrom === "CreateAddress") {
	document.body.insertAdjacentHTML("afterbegin", createAddress);


	let checkBox = document.getElementById("checkBox");
	let hiddenBox = document.getElementById("hiddenBox");
	checkBox.addEventListener("click", function() {

		hiddenBox.value = checkBox.checked;

		console.log(hiddenBox.value);

	});


}

if (addressFrom === "EditAddress" && addressUniqueId != null) {
	document.body.insertAdjacentHTML("afterbegin", editAddress);
	
	
	document.getElementById("name").value = userAddress.name
    document.getElementById("mobile_number").value = userAddress.phoneNumber
    document.getElementById("addressSearch").value = userAddress.location
    document.getElementById("house_number").value = userAddress.streetName
    document.getElementById("town_name").value = userAddress.townName
    document.getElementById("city").value = userAddress.city
    document.getElementById("pinCode").value = userAddress.pinCode
    document.getElementById("state").value = userAddress.state
}


// Address auto complete //

let autocomplete;
let address1Field;
let address2Field;
let postalField;

function initAutocomplete() {
	address1Field = document.querySelector("#addressSearch");
	address2Field = document.querySelector("#house_number");
	postalField = document.querySelector("#pinCode");

	autocomplete = new google.maps.places.Autocomplete(address1Field, {
		componentRestrictions: { country: ["in"] },
		fields: ["address_components", "geometry"],
		types: ["address"],
	});
	address1Field.focus();

	autocomplete.addListener("place_changed", fillInAddress);
}

function fillInAddress() {

	const place = autocomplete.getPlace();
	console.log(place)
	let address1 = "";
	let postcode = "";
	let localityName;
	let administrativeAreaName;
	let subLocalityName;
	let subLocalityName2;

	for (const component of place.address_components) {
		const componentType = component.types[0];

		switch (componentType) {
			case "street_number": {
				address1 = `${component.long_name} ${address1}`;
				break;
			}
			case "route": {
				address1 += component.short_name;
				break;
			}
			case "postal_code": {
				postcode = `${component.long_name}${postcode}`;
				break;
			}
			case "postal_code_suffix": {
				postcode = `${postcode}-${component.long_name}`;
				break;
			}
			case "locality": {
				localityName = component.long_name;
				break;
			}
			case "sublocality_level_3": {
				subLocalityName2 = component.long_name;
				break;
			}
			case "sublocality_level_1": {
				subLocalityName = component.long_name;
				break;
			}
			case "administrative_area_level_3":
				administrativeAreaName = component.long_name;
				document.querySelector("#city").value = component.long_name;
				break;
			case "administrative_area_level_1": {
				document.querySelector("#state").value = component.short_name;
				break;
			}

		}
	}
	if (localityName === administrativeAreaName) {
		document.querySelector("#town_name").value = subLocalityName;
	}
	else {
		document.querySelector("#town_name").value = localityName;
	}
	address1Field.value = address1;
	postalField.value = postcode;

	if (subLocalityName2 !== undefined) {
		address2Field.value = address1Field.value + ", " + subLocalityName2
	}
	else if (subLocalityName !== undefined) {
		address2Field.value = address1Field.value + ", " + subLocalityName
	}
	else if (address1Field.value === subLocalityName) {
		address2Field.value = address1Field.value
	}
	else {
		address2Field.value = address1Field.value
	}
	address2Field.focus();

}

window.initAutocomplete = initAutocomplete;

