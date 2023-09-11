<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About us</title>
<style>
body{
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin:0;
}

.ahead h1{
    text-align: center;
    margin:50px 0 0 0;
    background-color: #5cb748;
    color:white;
}

::-webkit-scrollbar{
    display: none;
}

.lpara{
    margin:50px;
    font-size: 25px;
    width:50%;
    text-align: justify;   
}

.apara{
    display:flex;
    flex-direction: row;
    justify-content: space-between;
    margin-bottom:40px;
}

.i{
    display: flex;
}

.i img{
    height:500px;
    width:100%;
}

</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="about">
            <div class="ahead">
                <h1 class="about us">About Us</h1>
            </div>
            <div class="i">
                <img src="" alt="food on bannana leaf image">   
            </div>
            <div class="apara">
                <div class="lpara">
                    <h1>Why Us?</h1>
                    <ul>
                        <li>
                            <p>We actually take care of your health and make tasty food inside home. Food is prepared by mothers and you can feel their taste.</p>
                        </li>
                        <li>
                            <p>This is really helpful for students and working professionals and for even people who stay outside their home and in need of healthy and home food.</p> 
                        </li>
        
                        <li>
                            <p>We ensure that we will be pocket friendly and provide quality foods.</p> 
                        </li>
                    </ul>
                </div>
                <img src="https://iili.io/J9FRuHJ.th.png" alt="food image">
            </div>
        </div>

</body>
</html>