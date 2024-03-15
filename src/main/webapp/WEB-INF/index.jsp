<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_Register</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<%-- adding some styling using bootstrap library --%>
	<div class="container mt-5">
		<div class="row">
			<h1 class="mb-3 text-center text-info">Course Platform - Instructors</h1>
			
			<h2 class="mb-3">New Instructor</h2>
			<div class="col-5 bg-warning p-3 border border-4">
			<h2 class="mx-5 mb-3">Register</h2>
				<form:form action="/register" method="post" modelAttribute="newUser">


					<form:label path="userName">Username : </form:label>
					<p><form:errors path="userName" class="text-danger" /></p>
					<form:input path="userName" class="form-control mb-3" />

					<form:label path="email">Email : </form:label>
					<p><form:errors path="email" class="text-danger" /></p>
					<form:input path="email" class="form-control mb-3" />

					<form:label path="password">Password : </form:label>
					<p><form:errors path="password" class="text-danger" /></p>
					<form:input path="password" type="password" class="form-control mb-3" />

					<form:label path="confirmPass">Confirm PW : </form:label>
					<p><form:errors path="confirmPass" class="text-danger" /></p>
					<form:input path="confirmPass" class="form-control mb-2" />

					<button class="btn btn-primary btn-lg mt-3">Submit</button>
				</form:form>
			</div>
			<div class="col-5 p-4 mx-5 bg-secondary border border-4">
			<h2 class="mx-5 mb-3">Login</h2>
				<form:form action="/login" method="post" modelAttribute="loggedInUser" class="bg-info p-3 border border-5">


					<form:label path="email">Email : </form:label>
					<p><form:errors path="email" class="text-danger" /></p>
					<form:input path="email" class="form-control mb-3" />

					<form:label path="password">Password : </form:label>
					<p><form:errors path="password" class="text-danger" /></p>
					<form:input path="password" class="form-control mb-3" />


					<button class="btn btn-primary btn-lg mt-3">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>