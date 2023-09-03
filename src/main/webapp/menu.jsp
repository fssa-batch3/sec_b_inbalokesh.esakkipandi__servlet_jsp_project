<%@page import="in.fssa.onlyhomefood.model.Product"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
    overflow-x: hidden;
    margin:0;
}

::-webkit-scrollbar{
    display: none;
}

h1.he{
    text-align: center;
    margin:50px;  
    background-color: #5cb748;
    color: white;
    width:100%;
    position: relative;
    right:50px;  
}

.menu{
    background-color: rgb(244, 244, 244);
    display:flex;
    justify-content: center;
    border-radius: 50px;
}

.menu a{
    text-decoration: none;
    color: Black;
    margin: 5px 20px; 
    padding: 10px;
}

.menu a:hover{
    border-bottom:2px solid #FF7223;
    color: black;
}

.menu a.all{
    border-bottom:2px solid #FF7223;
    color: black;
}

.top{
    display:flex;
    justify-content: center;
    margin-bottom:50px;
}

.details{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    grid-gap: 100px;
    grid-auto-flow: dense;
    margin:10px 80px 60px 80px;
    place-items: center;  
}

.box{
    box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
    border-radius: 20px;
    height: 400px;
    width: 250px;
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor:pointer;
}

.box:hover{
    box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
    border-radius: 20px;
    transform: scale(1.05);
}

.box img{
    width: 100%;
    height: 50%;
    object-fit: cover;
    border-radius: 10px 10px 0 0;
}

.border{
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    height: 200px;
    width: 200px;
}

.border h4{
    margin: 0;
    text-align: center;
}

.info_box{
    height: 70px;
    display: flex;
    flex-direction: column;
    border-bottom: 1px solid grey;    
}

.info{
    height: 30px;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between; 
}

.info p{
    font-size: 13.5px; 
}

.price{
    padding-top: 10px;
    height: 30px;
    display:flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}

.price button{
    background-color:orange;
    border-color: transparent;
    cursor:pointer;
    border-radius: 20px;
    font-size: 13px;
    height:30px;
    width:90px;
}

.price button:hover{
    background-color:orange;
    color: white;
    transform: scale(1.05);
}
</style>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<%Set<Product> listOfProducts = (Set<Product>)request.getAttribute("allProducts");%>
	
	<h1 class="he">Menu</h1>

	<div class="top">
		<div class="menu">
			<a href="menu" class="all">All</a>
		</div>
	</div>
	
	<section class="details">

	<%for(Product product : listOfProducts){%>
	
		<div class="box">
			<img src="<%= product.getImage()%>" alt="<%= product.getImage()%> image">
			<div class="border">
				<h4><%= product.getName()%></h4>
				<div class="info_box">
					<div class="info">
						<h5>Type</h5>
						<p><%= product.getType() %></p>
					</div>
					<div class="info">
						<h5>Quantity</h5>
						<p><%= product.getQuantity()%> <%= product.getQuantityType() %></p>
					</div>
				</div>
				<div class="price">
					<p class="food_price">Rs. <%= product.getPrice() %> </p>
					<button type="button" class="addCart">Buy Now</button>
				</div>
			</div>
		</div>
	<%} %>
	</section>

</body>
</html>