<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address form</title>
<link href="<%=request.getContextPath()%>/assets/css/login.css"
	rel="stylesheet" type="text/css">

</head>
<body>

	<%
	Object address = (Object) request.getAttribute("address");
	%>
	
	<script type="text/javascript">
		const userAddress = <%=address%>;
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGhGk3DTCkjF1EUxpMm5ypFoQ-ecrS2gY&callback=initAutocomplete&libraries=places&v=weekly"
		defer></script>

	<script 
	
		src="<%=request.getContextPath()%>/assets/javascript/address.js">
		
	</script>

</body>
</html>