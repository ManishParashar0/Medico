<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.manish.madico.entity.UserEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>chatmedico</title>
<style type="text/css">
/* **********************************
Reset CSS
************************************** */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

body {
	line-height: 1.5;
}

ol, ul {
	list-style: none;
}

blockquote, q {
	quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

/********************************
 Typography Style
******************************** */
body {
	margin: 0;
	font-family: 'Open Sans', sans-serif;
	line-height: 1.5;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

html {
	min-height: 100%;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

h1 {
	font-size: 36px;
}

h2 {
	font-size: 30px;
}

h3 {
	font-size: 26px;
}

h4 {
	font-size: 22px;
}

h5 {
	font-size: 18px;
}

h6 {
	font-size: 16px;
}

p {
	font-size: 15px;
}

a {
	text-decoration: none;
	font-size: 15px;
}

* {
	margin-bottom: 0;
}

/* *******************************
message-area
******************************** */
.message-area {
	height: 100vh;
	overflow: hidden;
	padding: 30px 0;
	background: #f5f5f5;
}

.chat-area {
	position: relative;
	width: 100%;
	background-color: #fff;
	border-radius: 0.3rem;
	height: 90vh;
	overflow: hidden;
	min-height: calc(100% - 1rem);
}

.chatlist {
	outline: 0;
	height: 100%;
	overflow: hidden;
	width: 300px;
	float: left;
	padding: 15px;
}

.chat-area .modal-content {
	border: none;
	border-radius: 0;
	outline: 0;
	height: 100%;
}

.chat-area .modal-dialog-scrollable {
	height: 100% !important;
}

.chatbox {
	width: auto;
	overflow: hidden;
	height: 100%;
	border-left: 1px solid #ccc;
}

.chatbox .modal-dialog, .chatlist .modal-dialog {
	max-width: 100%;
	margin: 0;
}

.msg-search {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.chat-area .form-control {
	display: block;
	width: 80%;
	padding: 0.375rem 0.75rem;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.5;
	color: #222;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ccc;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0.25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.chat-area .form-control:focus {
	outline: 0;
	box-shadow: inherit;
}

a.add img {
	height: 36px;
}

.chat-area .nav-tabs {
	border-bottom: 1px solid #dee2e6;
	align-items: center;
	justify-content: space-between;
	flex-wrap: inherit;
}

.chat-area .nav-tabs .nav-item {
	width: 100%;
}

.chat-area .nav-tabs .nav-link {
	width: 100%;
	color: #180660;
	font-size: 14px;
	font-weight: 500;
	line-height: 1.5;
	text-transform: capitalize;
	margin-top: 5px;
	margin-bottom: -1px;
	background: 0 0;
	border: 1px solid transparent;
	border-top-left-radius: 0.25rem;
	border-top-right-radius: 0.25rem;
}

.chat-area .nav-tabs .nav-item.show .nav-link, .chat-area .nav-tabs .nav-link.active
	{
	color: #222;
	background-color: #fff;
	border-color: transparent transparent #000;
}

.chat-area .nav-tabs .nav-link:focus, .chat-area .nav-tabs .nav-link:hover
	{
	border-color: transparent transparent #000;
	isolation: isolate;
}

.chat-list h3 {
	color: #222;
	font-size: 16px;
	font-weight: 500;
	line-height: 1.5;
	text-transform: capitalize;
	margin-bottom: 0;
}

.chat-list p {
	color: #343434;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.5;
	text-transform: capitalize;
	margin-bottom: 0;
}

.chat-list a.d-flex {
	margin-bottom: 15px;
	position: relative;
	text-decoration: none;
}

.chat-list .active {
	display: block;
	content: '';
	clear: both;
	position: absolute;
	bottom: 3px;
	left: 34px;
	height: 12px;
	width: 12px;
	background: #00DB75;
	border-radius: 50%;
	border: 2px solid #fff;
}

.msg-head h3 {
	color: #222;
	font-size: 18px;
	font-weight: 600;
	line-height: 1.5;
	margin-bottom: 0;
}

.msg-head p {
	color: #343434;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.5;
	text-transform: capitalize;
	margin-bottom: 0;
}

.msg-head {
	padding: 15px;
	border-bottom: 1px solid #ccc;
}

.moreoption {
	display: flex;
	align-items: center;
	justify-content: end;
}

.moreoption .navbar {
	padding: 0;
}

.moreoption li .nav-link {
	color: #222;
	font-size: 16px;
}

.moreoption .dropdown-toggle::after {
	display: none;
}

.moreoption .dropdown-menu[data-bs-popper] {
	top: 100%;
	left: auto;
	right: 0;
	margin-top: 0.125rem;
}

.msg-body ul {
	overflow: hidden;
}

.msg-body ul li {
	list-style: none;
	margin: 15px 0;
}

.msg-body ul li.sender {
	display: block;
	width: 100%;
	position: relative;
}

.msg-body ul li.sender:before {
	display: block;
	clear: both;
	content: '';
	position: absolute;
	top: -6px;
	left: -7px;
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 12px 15px 12px;
	border-color: transparent transparent #f5f5f5 transparent;
	-webkit-transform: rotate(-37deg);
	-ms-transform: rotate(-37deg);
	transform: rotate(-37deg);
}

.msg-body ul li.sender p {
	color: #000;
	font-size: 14px;
	line-height: 1.5;
	font-weight: 400;
	padding: 15px;
	background: #f5f5f5;
	display: inline-block;
	border-bottom-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	margin-bottom: 0;
}

.msg-body ul li.sender p b {
	display: block;
	color: #180660;
	font-size: 14px;
	line-height: 1.5;
	font-weight: 500;
}

.msg-body ul li.repaly {
	display: block;
	width: 100%;
	text-align: right;
	position: relative;
}

.msg-body ul li.repaly:before {
	display: block;
	clear: both;
	content: '';
	position: absolute;
	bottom: 15px;
	right: -7px;
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 12px 15px 12px;
	border-color: transparent transparent #4b7bec transparent;
	-webkit-transform: rotate(37deg);
	-ms-transform: rotate(37deg);
	transform: rotate(37deg);
}

.msg-body ul li.repaly p {
	color: #fff;
	font-size: 14px;
	line-height: 1.5;
	font-weight: 400;
	padding: 15px;
	background: #4b7bec;
	display: inline-block;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	margin-bottom: 0;
}

.msg-body ul li.repaly p b {
	display: block;
	color: #061061;
	font-size: 14px;
	line-height: 1.5;
	font-weight: 500;
}

.msg-body ul li.repaly:after {
	display: block;
	content: '';
	clear: both;
}

.time {
	display: block;
	color: #000;
	font-size: 12px;
	line-height: 1.5;
	font-weight: 400;
}

li.repaly .time {
	margin-right: 20px;
}

.divider {
	position: relative;
	z-index: 1;
	text-align: center;
}

.msg-body h6 {
	text-align: center;
	font-weight: normal;
	font-size: 14px;
	line-height: 1.5;
	color: #222;
	background: #fff;
	display: inline-block;
	padding: 0 5px;
	margin-bottom: 0;
}

.divider:after {
	display: block;
	content: '';
	clear: both;
	position: absolute;
	top: 12px;
	left: 0;
	border-top: 1px solid #EBEBEB;
	width: 100%;
	height: 100%;
	z-index: -1;
}

.send-box {
	padding: 15px;
	border-top: 1px solid #ccc;
}

.send-box form {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 15px;
}

.send-box .form-control {
	display: block;
	width: 85%;
	padding: 0.375rem 0.75rem;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.5;
	color: #222;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ccc;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0.25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.send-box button {
	border: none;
	background: #3867d6;
	padding: 0.375rem 5px;
	color: #fff;
	border-radius: 0.25rem;
	font-size: 14px;
	font-weight: 400;
	width: 24%;
	margin-left: 1%;
}

.send-box button i {
	margin-right: 5px;
}

.send-btns .button-wrapper {
	position: relative;
	width: 125px;
	height: auto;
	text-align: left;
	margin: 0 auto;
	display: block;
	background: #F6F7FA;
	border-radius: 3px;
	padding: 5px 15px;
	float: left;
	margin-right: 5px;
	margin-bottom: 5px;
	overflow: hidden;
}

.send-btns .button-wrapper span.label {
	position: relative;
	z-index: 1;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	width: 100%;
	cursor: pointer;
	color: #343945;
	font-weight: 400;
	text-transform: capitalize;
	font-size: 13px;
}

#upload {
	display: inline-block;
	position: absolute;
	z-index: 1;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.send-btns .attach .form-control {
	display: inline-block;
	width: 120px;
	height: auto;
	padding: 5px 8px;
	font-size: 13px;
	font-weight: 400;
	line-height: 1.5;
	color: #343945;
	background-color: #F6F7FA;
	background-clip: padding-box;
	border: 1px solid #F6F7FA;
	border-radius: 3px;
	margin-bottom: 5px;
}

.send-btns .button-wrapper span.label img {
	margin-right: 5px;
}

.button-wrapper {
	position: relative;
	width: 100px;
	height: 100px;
	text-align: center;
	margin: 0 auto;
}

button:focus {
	outline: 0;
}

.add-apoint {
	display: inline-block;
	margin-left: 5px;
}

.add-apoint a {
	text-decoration: none;
	background: #F6F7FA;
	border-radius: 8px;
	padding: 8px 8px;
	font-size: 13px;
	font-weight: 400;
	line-height: 1.2;
	color: #343945;
}

.add-apoint a svg {
	margin-right: 5px;
}

.chat-icon {
	display: none;
}

.closess i {
	display: none;
}

@media ( max-width : 767px) {
	.chat-icon {
		display: block;
		margin-right: 5px;
	}
	.chatlist {
		width: 100%;
	}
	.chatbox {
		width: 100%;
		position: absolute;
		left: 1000px;
		right: 0;
		background: #fff;
		transition: all 0.5s ease;
		border-left: none;
	}
	.showbox {
		left: 0 !important;
		transition: all 0.5s ease;
	}
	.msg-head h3 {
		font-size: 14px;
	}
	.msg-head p {
		font-size: 12px;
	}
	.msg-head .flex-shrink-0 img {
		height: 30px;
	}
	.send-box button {
		width: 28%;
	}
	.send-box .form-control {
		width: 70%;
	}
	.chat-list h3 {
		font-size: 14px;
	}
	.chat-list p {
		font-size: 12px;
	}
	.msg-body ul li.sender p {
		font-size: 13px;
		padding: 8px;
		border-bottom-left-radius: 6px;
		border-top-right-radius: 6px;
		border-bottom-right-radius: 6px;
	}
	.msg-body ul li.repaly p {
		font-size: 13px;
		padding: 8px;
		border-top-left-radius: 6px;
		border-top-right-radius: 6px;
		border-bottom-left-radius: 6px;
	}
}

.chat-lists .img-fluid {
	width: 50px;
	height: 50px;
	object-fit: cover;
	border-radius: 50%;
	object-position: 0 0;
}

.chat-lists .chat-submit {
	background: transparent;
	border: none;
	padding: 5px 0;
	transition: all 0.3s ease;
	width: 100%;
}
</style>


</head>
<body>
<%System.out.print("hellojababab"); %>
	<!-- Google Fonts -->
	<link
		href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700&display=swap"
		rel="stylesheet">

	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>


	<!-- char-area -->
	<section class="message-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="chat-area">
						<!-- chatlist -->
						<div class="chatlist">
							<div class="modal-dialog-scrollable">
								<div class="modal-content">
									<div class="chat-header">
										<div class="msg-search">
											<input type="text" class="form-control"
												id="inlineFormInputGroup" placeholder="Search"
												aria-label="search"> <a class="add" href="#"><img
												class="img-fluid"
												src="https://mehedihtml.com/chatbox/assets/img/add.svg"
												alt="add"></a>
										</div>

										<ul class="nav nav-tabs" id="myTab" role="tablist">
											<li class="nav-item" role="presentation">
												<button class="nav-link active" id="Open-tab"
													data-bs-toggle="tab" data-bs-target="#Open" type="button"
													role="tab" aria-controls="Open" aria-selected="true">Open</button>
											</li>
											<li class="nav-item" role="presentation">
												<button class="nav-link" id="Closed-tab"
													data-bs-toggle="tab" data-bs-target="#Closed" type="button"
													role="tab" aria-controls="Closed" aria-selected="false">Closed</button>
											</li>
										</ul>
									</div>

									<div class="modal-body">
										<!-- chat-list -->
										<div class="chat-lists">
											<div class="tab-content" id="myTabContent">
												<div class="tab-pane fade show active" id="Open"
													role="tabpanel" aria-labelledby="Open-tab">
													<!-- chat-list -->
													<!--=------------------------------------------------------------------ ____________________________________-------------------------------------------------------- -->
													<%
													ServletContext context = getServletContext();
													ArrayList<UserEntity> s = (ArrayList<UserEntity>) context.getAttribute("users");
													HashMap<Integer, UserEntity> list = new HashMap<Integer, UserEntity>();
													int cout = 1;
													%>
													<form action="chatwithother" class="chat-list"
														method="post">
														<%
														for (UserEntity user : s) {
														%>
														<button type="submit" name="chatype" value="chat"
															class="chat-submit d-flex align-items-center">
															<div class="flex-shrink-0">
																<img class="img-fluid"
																	src="src/images/<%=user.getImage_name()%>"
																	alt="user img"> <span class="active"></span>
															</div>
															<div class="flex-grow-1 ms-3">
																<h3><%=user.getUsername()%></h3>
																<p>Profile : doctor</p>
															</div>

															<%
															list.put(cout++, user);
															%>
														</button>
														<%
														}
														%>
														<%
														context.setAttribute("chat1", list);
														%>


													</form>
													s
													<!-- chat-list -->
												</div>
												<div class="tab-pane fade" id="Closed" role="tabpanel"
													aria-labelledby="Closed-tab">

													<!-- chat-list -->
													<div class="chat-list">
														<a href="#" class="d-flex align-items-center">
															<div class="flex-shrink-0">
																<img class="img-fluid"
																	src="https://mehedihtml.com/chatbox/assets/img/user.png"
																	alt="user img"> <span class="active"></span>
															</div>
															<div class="flex-grow-1 ms-3">
																<h3>john</h3>
																<p>RObo</p>
															</div>
														</a>
													</div>
													<!-- chat-list -->
												</div>
											</div>

										</div>
										<!-- chat-list -->
									</div>
								</div>
							</div>
						</div>
						<!-- chatlist -->



						<!-- chatbox -->
						<div class="chatbox">
							<div class="modal-dialog-scrollable">
								<div class="modal-content">
									<div class="msg-head">
										<div class="row">
											<div class="col-8">
												<div class="d-flex align-items-center">
													<span class="chat-icon"><img class="img-fluid"
														src="https://mehedihtml.com/chatbox/assets/img/arroleftt.svg"
														alt="image title"></span>
													<div class="flex-shrink-0">
														<img class="img-fluid"
															src="https://mehedihtml.com/chatbox/assets/img/user.png"
															alt="user img">
													</div>

													<% if (request.getAttribute("userchat") != null) { %>
													<% UserEntity e = (UserEntity) request.getAttribute("userchat"); %>
													<%System.out.print("aarha hai"); %>

													<div class="flex-grow-1 ms-3">
														<h3><%= e.getUsername() %></h3>
														<p><%= e.getProfiletype() %></p>
													</div>
													<% } %>

												
													
												</div>
											</div>
											<div class="col-4">
												<ul class="moreoption">
													<li class="navbar nav-item dropdown"><a
														class="nav-link dropdown-toggle" href="#" role="button"
														data-bs-toggle="dropdown" aria-expanded="false"><i
															class="fa fa-ellipsis-v" aria-hidden="true"></i></a>
														<ul class="dropdown-menu">
															<li><a class="dropdown-item" href="#">Action</a></li>
															<li><a class="dropdown-item" href="#">Another
																	action</a></li>
															<li>
																<hr class="dropdown-divider">
															</li>
															<li><a class="dropdown-item" href="#">Something
																	else here</a></li>
														</ul></li>
												</ul>
											</div>
										</div>
									</div>


									<div class="modal-body">
										<div class="msg-body">
											<ul>
												<li class="sender">
													<p>Hey, Are you there?</p> <span class="time">10:06
														am</span>
												</li>
												<li class="sender">
													<p>Hey, Are you there?</p> <span class="time">10:16
														am</span>
												</li>
												<li class="repaly">
													<p>yes!</p> <span class="time">10:20 am</span>
												</li>
												<li class="sender">
													<p>Hey, Are you there?</p> <span class="time">10:26
														am</span>
												</li>
												<li class="sender">
													<p>Hey, Are you there?</p> <span class="time">10:32
														am</span>
												</li>
												<li class="repaly">
													<p>How are you?</p> <span class="time">10:35 am</span>
												</li>
												<li>
													<div class="divider">
														<h6>Today</h6>
													</div>
												</li>

												<li class="repaly">
													<p>yes, tell me</p> <span class="time">10:36 am</span>
												</li>
												<li class="repaly">
													<p>yes... on it</p> <span class="time">junt now</span>
												</li>

											</ul>
										</div>
									</div>


									<div class="send-box">
										<form action="chatwithother" method=" ">
											<input type="text" class="form-control" aria-label="message…"
												placeholder="Write message…">

											<button type="button">
												<i class="fa fa-paper-plane" aria-hidden="true"></i> Send
											</button>
										</form>

										<div class="send-btns">
											<div class="attach">
												<div class="button-wrapper">
													<span class="label"> <img class="img-fluid"
														src="https://mehedihtml.com/chatbox/assets/img/upload.svg"
														alt="image title"> attached file
													</span><input type="file" name="upload" id="upload"
														class="upload-box" placeholder="Upload File"
														aria-label="Upload File">
												</div>

												<select class="form-control" id="exampleFormControlSelect1">
													<option>Select template</option>
													<option>Template 1</option>
													<option>Template 2</option>
												</select>

												<div class="add-apoint">
													<a href="#" data-toggle="modal"
														data-target="#exampleModal4"><svg
															xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															viewbox="0 0 16 16" fill="none">
															<path
																d="M8 16C3.58862 16 0 12.4114 0 8C0 3.58862 3.58862 0 8 0C12.4114 0 16 3.58862 16 8C16 12.4114 12.4114 16 8 16ZM8 1C4.14001 1 1 4.14001 1 8C1 11.86 4.14001 15 8 15C11.86 15 15 11.86 15 8C15 4.14001 11.86 1 8 1Z"
																fill="#7D7D7D" />
															<path
																d="M11.5 8.5H4.5C4.224 8.5 4 8.276 4 8C4 7.724 4.224 7.5 4.5 7.5H11.5C11.776 7.5 12 7.724 12 8C12 8.276 11.776 8.5 11.5 8.5Z"
																fill="#7D7D7D" />
															<path
																d="M8 12C7.724 12 7.5 11.776 7.5 11.5V4.5C7.5 4.224 7.724 4 8 4C8.276 4 8.5 4.224 8.5 4.5V11.5C8.5 11.776 8.276 12 8 12Z"
																fill="#7D7D7D" /></svg> Appoinment</a>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- chatbox -->


				</div>
			</div>
		</div>
		</div>
	</section>
	<!-- char-area -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js">
		jQuery(document).ready(function() {

			$(".chat-list a").click(function() {
				$(".chatbox").addClass('showbox');
				return false;
			});

			$(".chat-icon").click(function() {
				$(".chatbox").removeClass('showbox');
			});

		});
	</script>


</body>


</html>




<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat app</title>
<style type="text/css">

/* google fonts link  */
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,600&display=swap');
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins' , sans-serif;
}
html{
    font-size:60%;
}
.main-container{
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    background:#ccc;
}
.chat-container{
    /* box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px; */
    background:white;
    width:100%;
    height:100vh;
    max-width:100%;
    display:flex;
    flex-direction:column;
    align-items:stretch;
    overflow:hidden;
}
.chat-container .header{
    display:flex;
    justify-content:space-between;
    padding:10px 25px;
}
.chat-container .header .group{
    display:flex;
    column-gap:10px;
}
.chat-container .header .group .image{
    background:#ccc;
    border-radius:50%;
    display:inline-flex;
    justify-content:center;
    align-items:center;
    width:45px;
    height:45px;
    font-size:2rem;
    color:#a8a8a8;
}
.chat-container .header .group .image img{
    height:95%;
    width:95%;
    border-radius:50%;
    border:2px solid grey;
    object-fit: cover;
}
.chat-container .header .group .title .name{
    font-size:1.7rem;
    font-weight:600;
    text-transform:capitalize;
}
.chat-container .header .group .title .online{
    color:grey;
    font-size:1.5rem;
}
.chat-container .header .dot{
    font-size:1.6rem;
    color:black;
    height:fit-content;
    width:30px;
    height:30px;
    display:inline-flex;
    justify-content:center;
    align-items:center;
    border-radius:50%;
    cursor:pointer;
    transition:all 0.3s ease;
}
.chat-container .header .dot:hover{
    background:#ccc;
}
.chat-container .body{
    background:#ccc;
    padding:25px;
    height:100%;
    overflow:auto;
    scroll-behavior: smooth;
}
.chat-container .body::-webkit-scrollbar{
    background:#ccc;
    width:10px;
    box-shadow:inset 0 4px 10px rgba(0,0,0,0.1);
}
.chat-container .body::-webkit-scrollbar-thumb{
    background:lightblue;
    transition:all 0.3s ease;
}
.chat-container .body::-webkit-scrollbar-thumb:hover{
    background:skyblue;
}
.chat-container .body .no-message{
    height:100%;
    width:100%;
    display:inline-flex;
    justify-content:center;
    align-items: center;
    font-size:2rem;
    font-weight:600;
}
.chat-container .input{
    padding:15px 25px;
}
.chat-container .input .type{
    min-height:50px;
    max-height:fit-content;
    width:100%;
    border-radius:10px;
    position:relative;
}
.chat-container .input textarea{
    border:none;
    outline:none;
    background:#ccc;
    border-radius:10px;
    width:100%;
    font-size:1.6rem;
    font-weight:400;
    resize:none;
    padding:12px 52px 12px 20px;
}
.chat-container .input textarea::-webkit-scrollbar{
    display:none;
}
.chat-container .input .type button{
    position:absolute;
    top:50%;
    transform:translateY(-55%);
    right:20px;
    background:transparent;
    border:none;
    outline:none;
    color:blue;
    cursor:pointer;
    font-size:2rem;
}
/* main chat design  */
.chat-container .body .msg-box{
    padding:15px;
    background:white;
    width:60%;
    font-size:1.6rem;
    font-weight:500;
    border-radius:10px;
    display:flex;
    flex-wrap:wrap;
    justify-content:start;
    align-items:start;
    margin-bottom:15px;
}
.chat-container .body .msg-box .time{
    margin-left:auto;
}
.chat-container .body .user{
    margin-left:auto;
    border-top-right-radius:0;
    background:blue;
    color:white;
}
.chat-container .body .bot{
    border-top-left-radius:0;
    margin-right:auto;
    background:white;
    color:black;
}
@media screen and (max-width:500px){
    html{
        font-size:55%;
    }
}
@media screen and (max-width:768px){
    .chat-container .body .msg-box{
        width:70%;
    }
}
@media screen and (max-width:500px){
    .chat-container .body .msg-box{
        width:90%;
    }
}


</style>
<!-- own css file link  -->
<!-- fontawesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<!-- favicon link  -->
<link rel="icon" type="images/x-icon" href="images/ammar.png">
</head>

<body>
	<div class="main-container">
		<div class="chat-container">
			<div class="header">
				<div class="group">
					<div class="image">
						<!-- <i class="fa-solid fa-user"></i> -->
								<% String img =(String)request.getAttribute("img"); %>
						<img src="src/images/<%=img %>" alt="">
					</div>
					<div class="title">
					<% String name =(String)request.getAttribute("name1"); %>
						<p class="name"><%=name%></p>
						<p class="online">online</p>
					</div>
				</div>
				<div class="dot">
					<i class="fa-solid fa-ellipsis-vertical"></i>
				</div>
			</div>
			<div class="body">
				<!-- if  there is no message  -->
				<!-- <div class="no-message">
                    You don't have message yet!
                </div> -->

				<!-- message sent from user  -->
				<!-- <div class="msg-box user">
                    <div class="msg">
                        hi
                    </div>
                    <div class="time">
                        4:57
                    </div>
                </div>
                
                message sent from bot
                <div class="msg-box bot">
                    <div class="msg">
                        Thank you for your awesome support!
                    </div>
                    <div class="time">
                        4:57
                    </div>
                </div> -->

			</div>
			<form class="input">
				<div class="type">
					<textarea rows="1" placeholder="Type message..."></textarea>
					<button type="submit">
						<i class="fa-solid fa-paper-plane"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	<script src="script.js"></script>
</body>

</html>






























<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Lato:100,300,400,700)
	;

@import
	url(http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css)
	;

html, body {
	background: #e5e5e5;
	font-family: 'Lato', sans-serif;
	margin: 0px auto;
}

::selection {
	background: rgba(82, 179, 217, 0.3);
	color: inherit;
}

/* M E N U */
.menu {
	position: fixed;
	top: 0px;
	left: 0px;
	right: 0px;
	width: 100%;
	height: 50px;
	background: rgba(82, 179, 217, 0.9);
	z-index: 100;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.back {
	position: absolute;
	width: 90px;
	height: 50px;
	top: 0px;
	left: 0px;
	color: #fff;
	line-height: 50px;
	font-size: 30px;
	padding-left: 10px;
	cursor: pointer;
}

.back img {
	position: absolute;
	top: 5px;
	left: 30px;
	width: 40px;
	height: 40px;
	background-color: rgba(255, 255, 255, 0.98);
	border-radius: 100%;
	-webkit-border-radius: 100%;
	-moz-border-radius: 100%;
	-ms-border-radius: 100%;
	margin-left: 15px;
}

.back:active {
	background: rgba(255, 255, 255, 0.2);
}

.name {
	position: absolute;
	top: 3px;
	left: 110px;
	font-family: 'Lato';
	font-size: 25px;
	font-weight: 300;
	color: rgba(255, 255, 255, 0.98);
	cursor: default;
}

.last {
	position: absolute;
	top: 30px;
	left: 115px;
	font-family: 'Lato';
	font-size: 11px;
	font-weight: 400;
	color: rgba(255, 255, 255, 0.6);
	cursor: default;
}

/* M E S S A G E S */
.chat {
	list-style: none;
	background: none;
	margin: 0;
	padding: 0 0 50px 0;
	margin-top: 60px;
	margin-bottom: 10px;
}

.chat li {
	padding: 0.5rem;
	overflow: hidden;
	display: flex;
}

.chat .avatar {
	width: 40px;
	height: 40px;
	position: relative;
	display: block;
	z-index: 2;
	border-radius: 100%;
	-webkit-border-radius: 100%;
	-moz-border-radius: 100%;
	-ms-border-radius: 100%;
	background-color: rgba(255, 255, 255, 0.9);
}

.chat .avatar img {
	width: 40px;
	height: 40px;
	border-radius: 100%;
	-webkit-border-radius: 100%;
	-moz-border-radius: 100%;
	-ms-border-radius: 100%;
	background-color: rgba(255, 255, 255, 0.9);
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.chat .day {
	position: relative;
	display: block;
	text-align: center;
	color: #c0c0c0;
	height: 20px;
	text-shadow: 7px 0px 0px #e5e5e5, 6px 0px 0px #e5e5e5, 5px 0px 0px
		#e5e5e5, 4px 0px 0px #e5e5e5, 3px 0px 0px #e5e5e5, 2px 0px 0px #e5e5e5,
		1px 0px 0px #e5e5e5, 1px 0px 0px #e5e5e5, 0px 0px 0px #e5e5e5, -1px
		0px 0px #e5e5e5, -2px 0px 0px #e5e5e5, -3px 0px 0px #e5e5e5, -4px 0px
		0px #e5e5e5, -5px 0px 0px #e5e5e5, -6px 0px 0px #e5e5e5, -7px 0px 0px
		#e5e5e5;
	box-shadow: inset 20px 0px 0px #e5e5e5, inset -20px 0px 0px #e5e5e5,
		inset 0px -2px 0px #d7d7d7;
	line-height: 38px;
	margin-top: 5px;
	margin-bottom: 20px;
	cursor: default;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.other .msg {
	order: 1;
	border-top-left-radius: 0px;
	box-shadow: -1px 2px 0px #D4D4D4;
}

.other:before {
	content: "";
	position: relative;
	top: 0px;
	right: 0px;
	left: 40px;
	width: 0px;
	height: 0px;
	border: 5px solid #fff;
	border-left-color: transparent;
	border-bottom-color: transparent;
}

.self {
	justify-content: flex-end;
	align-items: flex-end;
}

.self .msg {
	order: 1;
	border-bottom-right-radius: 0px;
	box-shadow: 1px 2px 0px #D4D4D4;
}

.self .avatar {
	order: 2;
}

.self .avatar:after {
	content: "";
	position: relative;
	display: inline-block;
	bottom: 19px;
	right: 0px;
	width: 0px;
	height: 0px;
	border: 5px solid #fff;
	border-right-color: transparent;
	border-top-color: transparent;
	box-shadow: 0px 2px 0px #D4D4D4;
}

.msg {
	background: white;
	min-width: 50px;
	padding: 10px;
	border-radius: 2px;
	box-shadow: 0px 2px 0px rgba(0, 0, 0, 0.07);
}

.msg p {
	font-size: 0.8rem;
	margin: 0 0 0.2rem 0;
	color: #777;
}

.msg img {
	position: relative;
	display: block;
	width: 450px;
	border-radius: 5px;
	box-shadow: 0px 0px 3px #eee;
	transition: all .4s cubic-bezier(0.565, -0.260, 0.255, 1.410);
	cursor: default;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

@media screen and (max-width: 800px) {
	.msg img {
		width: 300px;
	}
}

@media screen and (max-width: 550px) {
	.msg img {
		width: 200px;
	}
}

.msg time {
	font-size: 0.7rem;
	color: #ccc;
	margin-top: 3px;
	float: right;
	cursor: default;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.msg time:before {
	content: "\f017";
	color: #ddd;
	font-family: FontAwesome;
	display: inline-block;
	margin-right: 4px;
}

emoji {
	display: inline-block;
	height: 18px;
	width: 18px;
	background-size: cover;
	background-repeat: no-repeat;
	margin-top: -7px;
	margin-right: 2px;
	transform: translate3d(0px, 3px, 0px);
}

emoji.please {
	background-image: url(http://imgur.com/ftowh0s.png);
}

emoji.lmao {
	background-image: url(http://i.imgur.com/MllSy5N.png);
}

emoji.happy {
	background-image: url(http://imgur.com/5WUpcPZ.png);
}

emoji.pizza {
	background-image: url(http://imgur.com/voEvJld.png);
}

emoji.cryalot {
	background-image: url(http://i.imgur.com/UUrRRo6.png);
}

emoji.books {
	background-image: url(http://i.imgur.com/UjZLf1R.png);
}

emoji.moai {
	background-image: url(http://imgur.com/uSpaYy8.png);
}

emoji.suffocated {
	background-image: url(http://i.imgur.com/jfTyB5F.png);
}

emoji.scream {
	background-image: url(http://i.imgur.com/tOLNJgg.png);
}

emoji.hearth_blue {
	background-image: url(http://i.imgur.com/gR9juts.png);
}

emoji.funny {
	background-image: url(http://i.imgur.com/qKia58V.png);
}

@
-webikt-keyframes pulse {from { opacity:0;
	
}

to {
	opacity: 0.5;
}

}
::-webkit-scrollbar {
	min-width: 12px;
	width: 12px;
	max-width: 12px;
	min-height: 12px;
	height: 12px;
	max-height: 12px;
	background: #e5e5e5;
	box-shadow: inset 0px 50px 0px rgba(82, 179, 217, 0.9), inset 0px -52px
		0px #fafafa;
}

::-webkit-scrollbar-thumb {
	background: #bbb;
	border: none;
	border-radius: 100px;
	border: solid 3px #e5e5e5;
	box-shadow: inset 0px 0px 3px #999;
}

::-webkit-scrollbar-thumb:hover {
	background: #b0b0b0;
	box-shadow: inset 0px 0px 3px #888;
}

::-webkit-scrollbar-thumb:active {
	background: #aaa;
	box-shadow: inset 0px 0px 3px #7f7f7f;
}

::-webkit-scrollbar-button {
	display: block;
	height: 26px;
}

/* T Y P E */
input.textarea {
	position: fixed;
	bottom: 0px;
	left: 0px;
	right: 0px;
	width: 100%;
	height: 50px;
	z-index: 99;
	background: #fafafa;
	border: none;
	outline: none;
	padding-left: 55px;
	padding-right: 55px;
	color: #666;
	font-weight: 400;
}

.emojis {
	position: fixed;
	display: block;
	bottom: 8px;
	left: 7px;
	width: 34px;
	height: 34px;
	background-image: url(http://i.imgur.com/5WUpcPZ.png);
	background-repeat: no-repeat;
	background-size: cover;
	z-index: 100;
	cursor: pointer;
}

.emojis:active {
	opacity: 0.9;
}
</style>
</head>
<body>
	<div class="menu">

		<div class="back">
			<i class="fa fa-chevron-left"></i> <img
				src="http://i.imgur.com/DY6gND0.png" draggable="false" />
		</div>

		<div class="name">Alex</div>

		<div class="last">18:09</div>

	</div>
	<ol class="chat">
		<li class="other">
			<div class="avatar">
				<img src="http://i.imgur.com/DY6gND0.png" draggable="false" />
			</div>
			<div class="msg">
				<p>Hola!</p>
				<p>
					Te vienes a cenar al centro?
					<emoji class="pizza" />
				</p>
				<time>20:17</time>
			</div>
		</li>
		<li class="self">
			<div class="avatar">
				<img src="http://i.imgur.com/HYcn9xO.png" draggable="false" />
			</div>
			<div class="msg">
				<p>Puff...</p>
				<p>
					Aún estoy haciendo el contexto de Góngora...
					<emoji class="books" />
				</p>
				<p>Mejor otro día</p>
				<time>20:18</time>
			</div>
		</li>
		<li class="other">
			<div class="avatar">
				<img src="http://i.imgur.com/DY6gND0.png" draggable="false" />
			</div>
			<div class="msg">
				<p>
					Qué contexto de Góngora?
					<emoji class="suffocated" />
				</p>
				<time>20:18</time>
			</div>
		</li>
		<li class="self">
			<div class="avatar">
				<img src="http://i.imgur.com/HYcn9xO.png" draggable="false" />
			</div>
			<div class="msg">
				<p>El que mandó Marialu</p>
				<p>Es para mañana...</p>
				<time>20:18</time>
			</div>
		</li>
		<li class="other">
			<div class="avatar">
				<img src="http://i.imgur.com/DY6gND0.png" draggable="false" />
			</div>
			<div class="msg">
				<p>
					<emoji class="scream" />
				</p>
				<p>
					Pásamelo!
					<emoji class="please" />
				</p>
				<time>20:18</time>
			</div>
		</li>
		<li class="self">
			<div class="avatar">
				<img src="http://i.imgur.com/HYcn9xO.png" draggable="false" />
			</div>
			<div class="msg">
				<img src="http://i.imgur.com/QAROObc.jpg" draggable="false" />
				<time>20:19</time>
			</div>
		</li>
		<li class="other">
			<div class="avatar">
				<img src="http://i.imgur.com/DY6gND0.png" draggable="false" />
			</div>
			<div class="msg">
				<p>
					Gracias!
					<emoji class="hearth_blue" />
				</p>
				<time>20:20</time>
			</div>
		</li>
		<div class="day">Hoy</div>
		<li class="self">
			<div class="avatar">
				<img src="http://i.imgur.com/HYcn9xO.png" draggable="false" />
			</div>
			<div class="msg">
				<p>Te apetece jugar a Minecraft?</p>
				<time>18:03</time>
			</div>
		</li>
		<li class="other">
			<div class="avatar">
				<img src="http://i.imgur.com/DY6gND0.png" draggable="false" />
			</div>
			<div class="msg">
				<p>Venga va, hace ya mucho que no juego...</p>
				<time>18:07</time>
			</div>
		</li>
		<li class="self">
			<div class="avatar">
				<img src="http://i.imgur.com/HYcn9xO.png" draggable="false" />
			</div>
			<div class="msg">
				<p>
					Ehh, me crashea el Launcher...
					<emoji class="cryalot" />
				</p>
				<time>18:08</time>
			</div>
		</li>
		<li class="other">
			<div class="avatar">
				<img src="http://i.imgur.com/DY6gND0.png" draggable="false" />
			</div>
			<div class="msg">
				<p>
					<emoji class="lmao" />
				</p>
				<time>18:08</time>
			</div>
		</li>
		<li class="self">
			<div class="avatar">
				<img src="http://i.imgur.com/HYcn9xO.png" draggable="false" />
			</div>
			<div class="msg">
				<p>Es broma</p>
				<p>Ataque Moai!</p>
				<p>
					<span><emoji class="moai" /></span><span><emoji
							class="moai" /></span><span><emoji class="moai" /></span><span><emoji
							class="moai" /></span><span><emoji class="moai" /></span><span><emoji
							class="moai" /></span>
				</p>
				<time>18:09</time>
			</div>
		</li>
		<li class="other">
			<div class="avatar">
				<img src="http://i.imgur.com/DY6gND0.png" draggable="false" />
			</div>
			<div class="msg">
				<p>Copón</p>
				<p>
					<emoji class="funny" />
				</p>
				<time>18:08</time>
			</div>
		</li>
	</ol>
	<input class="textarea" type="text" placeholder="Type here!" />
	<div class="emojis"></div>
</body>
</html> --%>