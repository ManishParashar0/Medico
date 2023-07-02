<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create profile</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<style>
.profile-pic {
	max-height: 250px;
}
</style>
</head>
<body>
	<form action="profile" method="post" enctype="multipart/form-data">

		<%
		String n;
		HttpSession sess = request.getSession(false);
		n = (String) sess.getAttribute("uname");
		%>
		<div class="card bg-light">
			<article class="card-body mx-auto" style="max-width: 400px;">
				<p class="divider-text" style="text-align: center color:blue;">
					CREATE YOUR ID
					<%=n.toUpperCase()%></p>
				<div>
					<div class="d-flex justify-content-center mb-4">
						<img class="rounded-circle profile-pic" alt="example placeholder"
							style="width: 200px;" id="output"
							src="https://www.w3schools.com/howto/img_avatar2.png" />
						<script>
							var loadFile = function(event) {
								var reader = new FileReader();
								reader.onload = function() {
									var output = document
											.getElementById('output');
									output.src = reader.result;
								};
								reader.readAsDataURL(event.target.files[0]);
							};
						</script>
					</div>

					<div class="d-flex justify-content-center choose-btn">
						<div class="btn btn-primary btn-rounded">
							<label class="form-label text-white m-1" for="customFile2">Choose
								Photo</label> <input type="file" class="form-control d-none"
								id="customFile2" name="image" accept="image/*"
								onchange="loadFile(event)" />
						</div>
					</div>
				</div>
				<br>
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input name="userid" class="form-control"
						placeholder="CREATE USER NAME" type="text">
				</div>
				<div class="form-group">
					<button type="submit" name="profile"
					 	class="btn btn-primary btn-block">Create id</button>
				</div>
			</article>
		</div>

	</form>
	<br>
	<br>

</body>
</html>