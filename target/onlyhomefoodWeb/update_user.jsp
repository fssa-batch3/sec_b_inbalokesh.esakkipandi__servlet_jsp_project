<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User Details</title>
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
	User user = new User();
	%>
	<%
	user = (User) request.getAttribute("user");
	%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	%>
	<div class="edituser">
		<form action="update?id=<%=id%>" method="post">

			<section>
				<div class="pro">
					<h1>Edit Profile</h1>
					<div class="pbox">
						<div class="imgb">
							<img src="https://iili.io/J9z9WMu.th.jpg" alt="Profile image"
								height="250px" width="250px">
							<div class="button_row">
								<button type="submit" id="edit-btn">Save</button>
								<a href="<%=request.getContextPath()%>/profile"><button type="button" id="back">Back</button></a>
							</div>

						</div>
						<div>
							<div class="sep">
								<label>Name</label> <input type="text" id="user_name" 
									value="${user.getName()}" name="user_name" required>
							</div>
							<div class="sep">
								<label>Mobile No</label> <input type="tel" id="user_phonenumber"
									value="${user.getMobNumber()}" name="phone_number" readonly>
							</div>
							<div class="sep">
								<label>Email</label> <input type="email" id="user_email"
									value="${user.getEmail()}" name="email" readonly>
							</div>
							<div class="sep">
								<label>Password</label> <input type="text" id="user_id"
									value="${user.getPassword()}" name = "password" required>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>
	</div>

</body>
</html>