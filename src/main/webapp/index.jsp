<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Only Home Food</title>
<link href="assets/css/Style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<section class="int">
		<div class="intro">
			<div class="intpara">
				<h1>Welcome to Only Home Food</h1>
				<p>We bring the taste of mothers food in a healthy way to your
					doorstep.</p>
				<a href="menu">
					<button class="btn">ORDER NOW</button>
				</a>
			</div>
			<img src="https://iili.io/J9Hpv72.md.webp" alt="food image">
		</div>
	</section>

	<!-- section aim starts -->
	<section>
		<div class="works">
			<div>
				<img src="./assets/Images/our aim.webp" alt="Mother cooking image">
			</div>
			<div class="tpara">
				<h2>Our Aim</h2>
				<h3>One Solution for Everyone</h3>
				<p>Bachelors/Students: Only home food aims to help bachelors and
					students who are tired of eating outside food which tastes the same
					every time and is heavy on pocket. Only home food is a perfect
					pocket friendly solution since we care for your health as well as
					your taste. We are sure that you can feel your mother in the taste.
				</p>
				<p>Professionals: Only home food ensures good food for busy and
					hard-working professionals. Professionals today hardly have time to
					cook their own meals. They either end up eating unhealthy, packed
					food or junk. Only home food saves both health and time the
					professionals spend to eat out.</p>
			</div>
		</div>
	</section>
	<!-- section aim ends -->

	<!-- section how it works starts -->
	<section class="h">
		<div class="how">
			<h2>How it Works</h2>
			<div class="hiw">
				<div class="hbox">
					<img src="./assets/Images/Order food-pana (1).svg"
						alt="Order your food image" height="50%" width="50%">
					<div class="hpara">
						<h3>Order your food</h3>
						<p>Order your food a day before.</p>
					</div>
				</div>
				<div class="hbox">
					<img src="./assets/Images/Cooking-pana.svg"
						alt="Mother preparing food image" height="54%" width="50%">
					<div class="fpara">
						<h3>Freshly Prepared</h3>
						<p>Food is prepared by group of mothers and served with love.</p>
					</div>
				</div>
				<div class="hbox">
					<img src="./assets/Images/Delivery-amico.svg"
						alt="Delivery on time image" height="65%" width="65%">
					<div class="hpara">
						<h3>Delivered on time</h3>
						<p>We deliver healthy food within specified timings and the
							payment is collected after the delivery.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- section how it works ends -->
	<jsp:include page="footer.jsp"></jsp:include>
	

</body>
</html>
