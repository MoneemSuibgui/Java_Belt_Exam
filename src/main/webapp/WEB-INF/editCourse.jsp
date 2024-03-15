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
<title>Edit Course</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<!--adding some styling using bootstrap library -->
	<div class="container mt-5">
		<h1>
			<c:out value="${course.name }"></c:out>
		</h1>

		<form:form action="/update/course/${course.id}" method="put"
			modelAttribute="course">


			<p>
				<form:errors path="name" class="text-danger"></form:errors>
			</p>
			<form:label path="name">Name :</form:label>
			<form:input path="name" class="form-control mb-3" />

			<p>
				<form:errors path="day" class="text-danger"></form:errors>
			</p>
			<form:label path="day">Day of Week :</form:label>
			<form:select path="day" class="form-control">
				<form:option value="Monday">Monday</form:option>
				<form:option value="Tuesday">Tuesday</form:option>
				<form:option value="Wednesday">Wednesday</form:option>
				<form:option value="Thursday">Thursday</form:option>
				<form:option value="Friday">Friday</form:option>
				<form:option value="Saturday">Saturday</form:option>
				<form:option value="Sunday">Sunday</form:option>
			</form:select>


			<p>
				<form:errors path="price" class="text-danger"></form:errors>
			</p>
			<form:label path="price">Drop-in Price :</form:label>
			<form:input path="price" type="number" class="form-control mb-3" />

			<p>
				<form:errors path="time" class="text-danger"></form:errors>
			</p>
			<form:label path="time">Time :</form:label>
			<form:input path="time" type="time" class="form-control mb-3" />

			<p>
				<form:errors path="description" class="text-danger"></form:errors>
			</p>
			<form:label path="description">Description :</form:label>
			<form:textarea path="description" class="form-control mb-3" />

			<div class="d-flex justify-content-around mt-4">

				<form action="/delete/course/${course.id}" method="post">
					<input type="hidden" name="_method" value="delete"> 
					<input type="submit" class="btn btn-danger btn-lg mx-5" value="Delete" >
				</form>

				<div>
					<input type="submit" class="btn btn-primary btn-lg mx-2"
						value="Update" /> <a href="/classes"
						class="btn btn-warning btn-lg">Cancel</a>
				</div>
			</div>

		</form:form>

	</div>
</body>
</html>