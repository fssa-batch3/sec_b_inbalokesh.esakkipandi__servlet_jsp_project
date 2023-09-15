
export default function increase() { 

const cartProducts = JSON.parse(localStorage.getItem("cart_product")) || [];
const count = document.querySelector("span.count");


if (cartProducts) {
	const find_user_products = cartProducts.filter((e) => e.user_id === user);
	if (find_user_products) {
		count.textContent = find_user_products.length;
	}
}

if (count.textContent === "0" || count.textContent === "") {
	count.setAttribute("style", "display:none");
}

}

increase();

