<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@page import="java.util.List"%>
<%@page import="com.manish.madico.entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="chatBox.css">
<title>NewMedico</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans:400,600"
	rel="stylesheet">
<link rel="stylesheet" href="dist/css/style.css">
<script src="https://unpkg.com/animejs@3.0.1/lib/anime.min.js"></script>
<script
	src="https://unpkg.com/scrollreveal@4.0.0/dist/scrollreveal.min.js"></script>
<!-- -----------------------------------------------------------------------------
	#CSS CODE
	 ------------------------------------------------------------------------- -->
<style>
:root {
	--mainColor: skyblue;
}

body {
	overflow-x: hidden;
}

h3, h1, p {
	margin-top: 0;
	margin-bottom: 0;
	line-height: initial;
}

.profile-btn {
	border: none;
	background: transparent;
	outline: none;
}

.card-container {
	position: absolute;
	top: 0;
	left: 0;
	height: fit-content;
	z-index: 98;
	padding: 20px;
	box-sizing: border-box;
	display: flex;
	flex-direction: row;
	gap: 20px;
	flex-direction: row;
	z-index: 98;
	padding: 20px;
	box-sizing: border-box;
	display: flex;
	flex-direction: row;
	gap: 20px;
	width: 100vw;
	box-sizing: border-box;
	overflow-x: auto;
	padding-top: 70px;
	box-sizing: border-box;
}

.card-container .card h3 {
	margin: 10px 0 20px 0;
}

.card-container .card .text-1 {
	margin-bottom: 5px;
}

.card {
	margin-top: 5%;
	width: 300px;
	background: white;
	border-radius: 5px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
	position: relative;
	flex-shrink: 0;
	height: fit-content;
}

.card .card-img {
	padding-top: 45px;
	position: relative;
	display: inline-flex;
	justify-content: center;
	text-align: center;
	width: 100%;
	z-index: 1;
}

.card .card-img img {
	height: 120px;
	width: 120px;
	border-radius: 50%;
	object-fit: cover;
	border: 7px solid white;
	z-index: 1;
}

.card .card-img:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	width: 100%;
	height: 60%;
	background: var(--mainColor);
	border-radius: 7px 7px 0 0;
}

.card .heading {
	margin-top: 5px;
	font-size: 18px;
	text-align: center;
	color: var(--mainColor);
	font-weight: 600;
}

.card .sub-heading {
	font-size: 14px;
	text-align: center;
	color: grey;
	font-weight: 500;
}

.card .about {
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
	padding-inline: 35px;
	text-align: center;
	line-height: 25px;
}

.card .about .text-1 {
	font-size: 18px;
	font-weight: 600;
	color: #1b1b1b;
}

.card .about .text-2 {
	font-size: 16px;
	font-weight: 600;
	color: var(--mainColor);
}

.card  .btns {
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-inline: 10px;
	padding-bottom: 30px;
}

.card  .btns button {
	height: 40px;
	width: 130px;
	border-radius: 25px;
	font-size: 15px;
	font-weight: 500;
}

.card .btns .follow {
	background: var(--mainColor);
	border: 2px solid var(--mainColor);
	color: white;
	transition: all 0.3s ease;
	cursor: pointer;
}

.card .btns .follow:hover {
	background: transparent;
	color: var(--mainColor);
}

.card .btns .message {
	background: transparent;
	border: 2px solid var(--mainColor);
	color: var(--mainColor);
	cursor: pointer;
	transition: all 0.3s ease;
}

.card .btns .message:hover {
	background: var(--mainColor);
	color: white;
}

.chat {
	text-align: center;
	font-size: 20px;
	color: skyblue;
}

.chat a {
	color: inherit;
}

footer {
	background: rgba(0, 0, 255, 0.1);
	padding-top: 20px;
}
</style>
</head>
<body class="is-boxed has-animations">

	<div class="chatbox-wrapper">
		<div class="chatbox-toggle">
			<i class='bx bx-message-dots'></i>
		</div>
		<div class="chatbox-message-wrapper">
			<div class="chatbox-message-header">
				<div class="chatbox-message-profile">
					<img
						src="https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
						alt="" class="chatbox-message-image">
					<div>
						<h4 class="chatbox-message-name">Manish parashar</h4>
						<p class="chatbox-message-status">online</p>
					</div>
				</div>
				<div class="chatbox-message-dropdown">
					<i
						class='bx bx-dots-vertical-rounded chatbox-message-dropdown-toggle'></i>
					<ul class="chatbox-message-dropdown-menu">
						<li><a href="#">Search</a></li>
						<li><a href="#">Report</a></li>
					</ul>
				</div>
			</div>
			<div class="chatbox-message-content">
				<h4 class="chatbox-message-no-message">You don't have message
					yet!</h4>
				<!-- <div class="chatbox-message-item sent">
					<span class="chatbox-message-item-text">
						Lorem, ipsum, dolor sit amet consectetur adipisicing elit. Quod, fugiat?
					</span>
					<span class="chatbox-message-item-time">08:30</span>
				</div>
				<div class="chatbox-message-item received">
					<span class="chatbox-message-item-text">
						Lorem, ipsum, dolor sit amet consectetur adipisicing elit. Quod, fugiat?
					</span>
					<span class="chatbox-message-item-time">08:30</span>
				</div> -->
			</div>
			<div class="chatbox-message-bottom">
				<form action="#" class="chatbox-message-form">
					<textarea rows="1" placeholder="Type message..."
						class="chatbox-message-input"></textarea>
					<button type="submit" class="chatbox-message-submit">
						<i class='bx bx-send'></i>
					</button>
				</form>
			</div>
		</div>
	</div>

	<%
	String image = (String) request.getAttribute("profilename");
	String name = (String) request.getAttribute("username");
	System.out.print(name);
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="height: 90px; z-index: 99;">

		<!-- Container wrapper -->
		<div class="container-fluid" style="">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Navbar brand -->
				<a class="navbar-brand mt-2 mt-lg-0" href="#"> <img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSizgJvDLKD9q3AIJH5cUi7biSCLHQWo1OmOA&usqp=CAU"
					height="10" width="150" alt="MDB Logo" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="Dashbord.jsp">Dashboard</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">About us</a></li>
					<li class="nav-item"><a class="nav-link" href="NewFile.jsp">Chatbot</a>
					</li>
				</ul>
				<!-- Left links -->
			</div>

			<div class="d-flex align-items-center">
				<!-- Icon -->
				<a class="text-reset me-3" href="#"> <i
					class="fas fa-shopping-cart"></i>
				</a>


				<!-- Avatar -->
				<div class="dropdown">
					<form action="myprofile" method="post">
						<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
							id="navbarDropdownMenuAvatar" role="button"
							data-mdb-toggle="dropdown" aria-expanded="false"> <input
							type="hidden" name="uname" value=<%=name%>>
							<button class="profile-btn" type="submit" name="edit" value="show"
								style="position: inherit;">
								<img src="src/images/<%=image%>" name="img"
									class="rounded-circle" height="25" width="70" alt="manish" />
							</button>

						</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdownMenuAvatar">
							<li><a class="dropdown-item" href="#">My profile</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li><a class="dropdown-item" href="#">Logout</a></li>
						</ul>
					</form>
				</div>
			</div>
			<!-- Right elements -->
		</div>
		<!-- Container wrapper -->
	</nav>

	<!-- navbar end -->
	<section class="hero">
		<div class="hero-figure anime-element">
			<svg class="placeholder" width="528" height="396"
				viewBox="0 0 528 396">
								<rect width="528" height="396" style="fill:transparent;" />
							</svg>
			<div class="hero-figure-box hero-figure-box-01" data-rotation="45deg"></div>
			<div class="hero-figure-box hero-figure-box-02"
				data-rotation="-45deg"></div>
			<div class="hero-figure-box hero-figure-box-03" data-rotation="0deg"></div>
			<div class="hero-figure-box hero-figure-box-04"
				data-rotation="-135deg"></div>
			<div class="hero-figure-box hero-figure-box-05"></div>
			<div class="hero-figure-box hero-figure-box-06"></div>
			<div class="hero-figure-box hero-figure-box-07"></div>
			<div class="hero-figure-box hero-figure-box-08"
				data-rotation="-22deg"></div>
			<div class="hero-figure-box hero-figure-box-09"
				data-rotation="-52deg"></div>
			<div class="hero-figure-box hero-figure-box-10"
				data-rotation="-50deg"></div>
		</div>

		<%-- <%
		String photoname = (String) request.getAttribute("imagename");
		%>
		<%
		System.out.print("----" + photoname);
		%> --%>

		<%
		List<UserEntity> attribute = (List<UserEntity>) request.getAttribute("userdata");
		ArrayList<UserEntity> list= new ArrayList<UserEntity>();
		%>
		<form action="chatwithother" method="post">
			<div class="container">
				<div class="card-container">
					<%
					for (UserEntity e : attribute) {
					%>
					<div class="card"> 
						<div class="card-img">
							<img src="src/images/<%=e.getImage_name()%>"
								<%String name1 = (String) request.getAttribute("name");%>
								alt="image not found">


						</div>
						<div class="content">
							<h1 class="heading"><%=e.getUsername()%></h1>
							<h3 class="sub-heading"><%=e.getProfiletype()%></h3>
						</div>
						<div class="about">
							<div class="followers">
								<p class="text-1">100M</p>
								<p class="text-2">Followers</p>
							</div>
							<div class="followings">
								<p class="text-1">100</p>
								<p class="text-2">Following</p>
							</div>
						</div>
						<div class="btns">
							<button tabindex="1" class="follow" type="submit" value="follow">Follow
							</button>
							<button tabindex="2" class="message" type="submit" name="chatype"
								value="message">Message</button>
						</div>

					</div>
					<%
					
					list.add(e);
					
					System.out.print(list+"javavvavavvavva");
					
					%><%
					if (e.getImage_name().equals(null) && e.getUsername().equals(null))
					{ break; } } %>
				</div>
			</div>
           
			<% 
			 ServletContext context = getServletContext();

	        context.setAttribute("image123", list);
			%>
		</form>

	</section>



	<form action="form" method="post">
		<footer class="site-footer">
			<div class="container">
				<div class="chat">
					<a href="chatBox.jsp">Chat with bot</a>
					<button type="submit">profile</button>
				</div>
				<div class="site-footer-inner">
					<div class="brand footer-brand">
						<a href="#"> <img class="header-logo-image"
							src="dist/images/logo.svg" alt="Logo">
						</a>
					</div>
					<ul class="footer-links list-reset">
						<li><a href="#">Contact</a></li>
						<li><a href="#">About us</a></li>
						<li><a href="#">FAQ's</a></li>
						<li><a href="#">Support</a></li>
					</ul>
					<ul class="footer-social-links list-reset">
						<li><a href="#"> <span class="screen-reader-text">Facebook</span>
								<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
                                    <path
										d="M6.023 16L6 9H3V6h3V4c0-2.7 1.672-4 4.08-4 1.153 0 2.144.086 2.433.124v2.821h-1.67c-1.31 0-1.563.623-1.563 1.536V6H13l-1 3H9.28v7H6.023z"
										fill="#0270D7" />
                                </svg>
						</a></li>
						<li><a href="#"> <span class="screen-reader-text">Twitter</span>
								<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
                                    <path
										d="M16 3c-.6.3-1.2.4-1.9.5.7-.4 1.2-1 1.4-1.8-.6.4-1.3.6-2.1.8-.6-.6-1.5-1-2.4-1-1.7 0-3.2 1.5-3.2 3.3 0 .3 0 .5.1.7-2.7-.1-5.2-1.4-6.8-3.4-.3.5-.4 1-.4 1.7 0 1.1.6 2.1 1.5 2.7-.5 0-1-.2-1.5-.4C.7 7.7 1.8 9 3.3 9.3c-.3.1-.6.1-.9.1-.2 0-.4 0-.6-.1.4 1.3 1.6 2.3 3.1 2.3-1.1.9-2.5 1.4-4.1 1.4H0c1.5.9 3.2 1.5 5 1.5 6 0 9.3-5 9.3-9.3v-.4C15 4.3 15.6 3.7 16 3z"
										fill="#0270D7" />
                                </svg>
						</a></li>
						<li><a href="#"> <span class="screen-reader-text">Google</span>
								<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg">
                                    <path
										d="M7.9 7v2.4H12c-.2 1-1.2 3-4 3-2.4 0-4.3-2-4.3-4.4 0-2.4 2-4.4 4.3-4.4 1.4 0 2.3.6 2.8 1.1l1.9-1.8C11.5 1.7 9.9 1 8 1 4.1 1 1 4.1 1 8s3.1 7 7 7c4 0 6.7-2.8 6.7-6.8 0-.5 0-.8-.1-1.2H7.9z"
										fill="#0270D7" />
                                </svg>
						</a></li>
					</ul>
					<div class="footer-copyright">&copy; 2019 Solid, all rights
						reserved</div>
				</div>
			</div>
		</footer>
	</form>
	<script src="dist/js/main.min.js"></script>
	<script src="chatBox.js"></script>
</body>
</html>
