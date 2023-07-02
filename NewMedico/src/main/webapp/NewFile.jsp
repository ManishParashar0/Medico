<%@page import="com.manish.madico.controller.Chatbox"%>
<%@page import="java.util.List"%>
<%@page import="com.manish.madico.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
p {
	margin: 0;
}

.chat-box {
	border: 1px solid #ccc;
	width: 350px;
	margin: auto;
	margin-top: 50px;
	background: white;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
	position: relative;
	border-radius: 10px;
	overflow: hidden;
}

.chat-messages {
	background: #f0f0f0;
	padding: 15px 10px;
	overflow-y: auto;
	height: 500px;
}

.message {
	border-radius: 5px;
	padding: 8px 10px;
	font-size: 18px;
	font-weight: 500;
	color: white;
	width: fit-content;
	max-width: 220px;
	margin-bottom: 15px;
}

.user {
	background: blue;
	margin-left: auto;
}

.bot {
	background: white;
	color: black;
}

.submit {
	background: #f9f9f9;
	position: absolute;
	width: 100%;
	left: 0;
	bottom: 0;
	padding: 10px;
	box-sizing: border-box;
}

.submit input {
	border: none;
	outline: none;
	background: transparent;
	color: black;
	font-size: 16px;
	width: 75%;
	height: 30px;
}

.submit button {
	background: blue;
	color: white;
	width: 22%;
	box-sizing: border-box;
	border: none;
	outline: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	height: 100%;
	display: inline-block;
	padding: 10px 5px;
}


/* DEMO-SPECIFIC STYLES */
.typewriter{
 
/*   margin: 0 auto; /* Gives that scrolling effect as the typing happens */
  l */etter-spacing: .15em; /* Adjust as needed */
  animation: 
    typing 3.5s steps(30, end),
    blink-caret .5s step-end infinite;
}

/* The typing effect */
@keyframes typing {
  from { width: 0 }
  to { width: 100% }
}

/* The typewriter cursor effect */
@keyframes blink-caret {
  from, to { border-color: transparent }
  50% { border-color: orange }
}




</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="chat" method="post">
		<div class="chat-box">
			<div class="chat-messages">
				<div class="message user">
					<%
					HttpSession session2 = request.getSession();
					Chatbox attribute = (Chatbox) session2.getAttribute("history");
					%>
					<p >User : ${usermassage}</p>

				</div>
				<div class="message bot">
					<p class="typewriter">Bot : ${responce}</p>
				</div>
			</div>
			<div class="submit">
				<input type="text" placeholder="Type your message here..."
					name="message">
				<button type="submit">Send</button>
			</div>
		</div>
	</form>
</body>
</html>