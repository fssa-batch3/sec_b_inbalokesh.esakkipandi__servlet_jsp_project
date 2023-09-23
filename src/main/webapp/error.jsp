<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error page</title>
<style>
/* colors */
:root {
  --blue: #293b49;
  --pink: #fdabaf;
  --pink-light: #ffe0e6;
  --green: #04cba0;
  --green-dark: #01ac88;
  --white: white;
}

html,
body {
  height: 100%;
  margin: 0;
}

html {
  font-size: 62.5%;
}

body {
  font-family: "Lato", sans-serif;
  font-size: 1.5rem;
  color: var(--blue);
}

a {
  text-decoration: none;
}

.center {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.error {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-content: center;
}

.number {
  font-weight: 900;
  font-size: 15rem;
  line-height: 1;
}

.illustration {
  position: relative;
  width: 12.2rem;
  margin: 0 2.1rem;
}

.circle {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 12.2rem;
  height: 11.4rem;
  border-radius: 50%;
  background-color: var(--blue);
}

.clip {
  position: absolute;
  bottom: 0.3rem;
  left: 50%;
  transform: translateX(-50%);
  overflow: hidden;
  width: 12.5rem;
  height: 13rem;
  border-radius: 0 0 50% 50%;
}

.paper {
  position: absolute;
  bottom: -0.3rem;
  left: 50%;
  transform: translateX(-50%);
  width: 9.2rem;
  height: 12.4rem;
  border: 0.3rem solid var(--blue);
  background-color: var(--white);
  border-radius: 0.8rem;
}

.paper::before {
  content: "";
  position: absolute;
  top: -0.7rem;
  right: -0.7rem;
  width: 1.4rem;
  height: 1rem;
  background-color: var(--white);
  border-bottom: 0.3rem solid var(--blue);
  transform: rotate(45deg);
}

.face {
  position: relative;
  margin-top: 2.3rem;
}

.eyes {
  position: absolute;
  top: 0;
  left: 2.4rem;
  width: 4.6rem;
  height: 0.8rem;
}

.eye {
  position: absolute;
  bottom: 0;
  width: 0.8rem;
  height: 0.8rem;
  border-radius: 50%;
  background-color: var(--blue);
  animation-name: eye;
  animation-duration: 4s;
  animation-iteration-count: infinite;
  animation-timing-function: ease-in-out;
}

.eye-left {
  left: 0;
}

.eye-right {
  right: 0;
}

@keyframes eye {
  0%, 100% {
    height: 0.2rem; /* Closed */
  }
  10%, 90% {
    height: 0.8rem; /* Open for 7 seconds */
  }
}


.rosyCheeks {
  position: absolute;
  top: 1.6rem;
  width: 1rem;
  height: 0.2rem;
  border-radius: 50%;
  background-color: var(--pink);
}

.rosyCheeks-left {
  left: 1.4rem;
}

.rosyCheeks-right {
  right: 1.4rem;
}

.mouth {
  position: absolute;
  top: 3.1rem;
  left: 50%;
  width: 1.6rem;
  height: 0.2rem;
  border-radius: 0.1rem;
  transform: translateX(-50%);
  background-color: var(--blue);
}

.text {
  margin-top: 5rem;
  font-weight: 300;
  color: var(--blue);
}

.button {
  margin-top: 4rem;
  padding: 1.2rem 3rem;
  color: var(--white);
  background-color: var(--green);
}

.button:hover {
  background-color: var(--green-dark);
}

.by {
  position: absolute;
  bottom: 0.5rem;
  left: 0.5rem;
  text-transform: uppercase;
  color: var(--blue);
}

.byLink {
  color: var(--green);
}

</style>

</head>


<body>
	<div class="center">
		<div class="error">
			<div class="number">4</div>
			<div class="illustration">
				<div class="circle"></div>
				<div class="clip">
					<div class="paper">
						<div class="face">
							<div class="eyes">
								<div class="eye eye-left"></div>
								<div class="eye eye-right"></div>
							</div>
							<div class="rosyCheeks rosyCheeks-left"></div>
							<div class="rosyCheeks rosyCheeks-right"></div>
							<div class="mouth"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="number">4</div>
		</div>

		<div class="text">Oops. The page you're looking for doesn't
			exist.</div>
		<a class="button" href="<%=request.getContextPath()%>/home">Back Home</a>
	</div>
</body>
</html>