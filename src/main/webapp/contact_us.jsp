<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us</title>
<link href="assets/css/contactus.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<h1 class="con">Contact Us</h1>


	<div class="message_gif" style="display: none"></div>
	<div class="box">
		<form id="feedback_form">
			<label>Name</label> <input type="text" id="name" name="name"
				pattern="[a-zA-Z0-9]+" placeholder="Name" required> <br>
			<label>Mobile No</label> <input type="tel" id="number"
				name="Mobile No" pattern="[6-9]{1}[0-9]{9}" placeholder="Mobile No"
				required> <label>Email</label> <input type="email"
				id="email" name="Email"
				pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Email"
				required> <br> <label>Message</label>
			<textarea id="message" name="sub" placeholder="Message" required></textarea>
			<button type="submit" id="message_submit" value="Submit">Submit</button>
		</form>
		<img src="assets/Images/mother-removebg-preview.png"
			alt="mother cooking image">
	</div>

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>