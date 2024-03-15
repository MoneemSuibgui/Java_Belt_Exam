<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title><c:out value="${loggedUser}"/></title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<!--adding some styling using bootstrap library -->
<div class="container mt-5">
<h1 class="mb-3"><c:out value="${course.name }"/> with <c:out value="${corse.creatoe.name}"></c:out></h1>
<p class="fs-4">Day : <c:out value="${course.day }"></c:out></p>
<p class="fs-4">Cost : $<c:out value="${course.price }"></c:out></p>
<p class="fs-4 mt-4">Time : <c:out value="${course.time}" /></p>

<p> <c:out value="${course.description}"/> </p>


<hr>
<div class="text-info mt-4">
<h3>Students :</h3>
<div class="card bg-warning p-3 mb-5 col-6">
<ul>
<c:forEach var="student" items="${course.studentsCourse}">
<li><c:out value="${student.studentName}"></c:out> -- <c:out value="${student.studentEmail}"></c:out></li>
</c:forEach>
</ul>
</div>


<h2>Add Students to course </h2>
<h3>New Student :</h3>
<div class="d-flex justify-content*between mt-4">
<div>
<form:form action="/add/student/${course.id}" method="post" modelAttribute="student">


<p><form:label path="studentName">Student Name :</form:label>
<form:input path="studentName"/><p>

<p><form:label path="studentEmail">Email :</form:label>
<form:input path="studentEmail"/></p>

<button class="btn btn-primary">Add Student</button>
</form:form>
</div>


<div class="mx-5">
<h3>Existing Student:</h3>

<form action="/add/newStudent/${course.id}" method="post">

<label for="student">Choose Student :</label>

<select name="studentId" id="studentId">
<c:forEach var="student" items="${students}">
<c:if test="${!course.studentsCourse.contains(student)}">
<option id="studentId" value="${student.id}"><c:out value="${student.studentName}" /> -- <c:out value="${student.studentEmail}" /></option>
</c:if>
</c:forEach>
</select>
<button class="btn btn-primary mt-2">Add Student</button>

</form>
</div>

</div>


</div>
</div>
</body>
</html>