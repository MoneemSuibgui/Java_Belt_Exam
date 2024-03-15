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
<title><c:out value="${loggedUser}" /></title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<!--adding some styling using bootstrap library -->
	<div class="container m-5">
	<div class="d-flex justify-content-between ">
	<h1>
			<c:out value="${loggedUser.userName}" />
		</h1>
		
		<a href="/logout">Logout</a>
	</div>
	<p>Course Schedule</p>
	<table class="table table-bordered table-stripped table-hover mb-5">
	<thead>
	<tr>
	<th>Class Name</th>
	<th>Instructor</th>
	<th>Weekday</th>
	<th>Price</th>
	<th>Time</th> 
	</tr>

	</thead>
	<tbody>
		<c:forEach var="course" items="${courses }">
			<tr>
			<td><a href="/classes/${course.id}"><c:out value="${course.name }"/></a>
			
			<c:if test="${loggedUser==course.creator}">
			<a href="/classes/${course.id }/edit" class="btn btn-info mx-2">edit</a>
			</c:if></td>
			
			<td>
			
			<c:out value="${course.creator.userName }"></c:out> 
			</td>
			<td><c:out value="${course.day }"></c:out></td>
			<td>$<c:out value="${course.price }"></c:out></td>
			<td><c:out value="${course.time}">
			<fmt:formatDate value="${course.time}" pattern="hh:mm:ss a"/></c:out></td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
		<a href="/classes/new" class="btn btn-primary">+new course</a>
	</div>

</body>
</html>