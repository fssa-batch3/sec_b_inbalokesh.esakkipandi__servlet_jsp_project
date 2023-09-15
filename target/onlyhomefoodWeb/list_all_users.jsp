<%@page import="in.fssa.onlyhomefood.model.User"%>
<%@page import="in.fssa.onlyhomefood.service.UserService"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List All Users</title>
<style>
table{
	width: 100%;

}
table, th, td {
	border: 1px solid black;
	text-align: center;
	
}

th, td {
	padding: 10px;
}
</style>
</head>
<body>

	<h1>User List</h1>
	<%Set<User> users = (Set<User>)request.getAttribute("list_users");%>

	<table>
		<tr>
			<th>Name</th>
			<th>Mobile Number</th>
			<th>Email</th>
			<th>Delete</th>
			<th>Edit</th>
			<th>View</th>
		</tr>
		
		<%for(User user : users){%>
		<tr>
			<td><%= user.getName() %></td>
			<td><%= user.getMobNumber() %></td>
			<td><%= user.getEmail() %></td>
			<td><a href="user/delete?id=<%= user.getId()%>"><button>Delete</button></a></td>
			<td><a href="user/edit?id=<%= user.getId()%>"><button>Edit</button></a></td>
			<td><a href="user/profile?id=<%= user.getId()%>"><button>View</button></a></td>
		</tr>

		<%
		}
		%>

	</table>

</body>
</html>