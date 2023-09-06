<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.foot{
    display:flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-content:center;
    align-items:center;
    background-color:rgb(237, 236, 236);
}

.footer img{
    height:30px;
    width:30px;  
}

.footer{
    margin-top:10px;
}

.phone{
    display:flex;
    flex-direction:row;
}

.phone img{
    margin-top:6px;
    margin-right:10px;
}

</style>
</head>
<body>
	<footer>
		<div class="foot">
			<div class="footer">
				<img src="${origin}/assets/Images/logo-facebook.svg"
					alt="facebook link"> <img
					src="${origin}/assets/Images/logo-instagram.svg"
					alt="instagram link"> <img
					src="${origin}/assets/Images/logo-twitter.svg" alt="twitter link">
				<img src="${origin}/assets/Images/logo-whatsapp.svg"
					alt="whatsapp link">
			</div>
			<p>No.123, Rk Road, CLV Nagar, Uthandi, Chennai - 600 119.</p>
			<div class="phone">
				<div>
					<div>
						<img src="https://iili.io/J9IbLCu.th.png"
							alt="call image" height="30px" width="30px">
					</div>
					<img src="${origin}/assets/Images/mail-outline.svg"
						alt="mail image" height="30px" width="30px">
				</div>
				<div>
					<p>+918888888889</p>
					<p>ohfood@gmail.com</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>