<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Order</title>
<link href="<%=request.getContextPath()%>/assets/css/order history.css"
	rel="stylesheet" type="text/css">
</head>
<body>


	<%
	Object addressList = (Object) request.getSession().getAttribute("addressList");
	%>

	<%
	Object orderItems = (Object) request.getSession().getAttribute("orderItems");
	%>

	<%
	Object orders = (Object) request.getSession().getAttribute("orders");
	%>


	<%
	Object products = (Object) request.getSession().getAttribute("productList");
	%>


	<%
	Long userNumber = (Long) request.getSession().getAttribute("loggedNumber");
	%>



	<jsp:include page="header.jsp"></jsp:include>


	<section class="order_details"></section>

	<script type="text/javascript">
		const addressList =
	<%=addressList%>
		|| [];

		const order_history =
	<%=orders%>
		|| [];

		const orderItem =
	<%=orderItems%>
		|| [];

		const product_list =
	<%=products%>
		|| [];

		const userNumber =
	<%=userNumber%>
		;
	</script>
	<script
		src="<%=request.getContextPath()%>/assets/javascript/view_order.js">
		
	</script>


</body>
</html>