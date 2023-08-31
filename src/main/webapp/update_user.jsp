<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User Details</title>
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
		<h1>Edit user</h1>
		<form action="update?id=<%=id%>" method="post">

			<label>Name : </label> <input type="text" name="user_name"
				value="<%=user.getName()%>" required /> <br> <br> <label>Mobile
				No : </label> <input type="tel" name="phone_number"
				value="<%=user.getMobNumber()%>" readonly /> <br> <br> <label>Email:
			</label> <input type="email" name="email" value="<%=user.getEmail()%>"
				readonly /> <br> <br> <label>Password : </label> <input
				type="password" value="<%=user.getPassword()%>" name="password"
				placeholder="Inba1234" required /> <br>
			<button type="submit">Submit</button>
		</form>
	</div>

</body>
</html>