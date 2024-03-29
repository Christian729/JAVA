<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body class="container">
	<h1><c:out value="${product.name}"/></h1>
	<div>
		<a href="/home">Home</a>
	</div>
	<div>
		<h3>Categories:</h3>
		<ul>
			<c:forEach var="category" items="${assignedCategories}">
				<li><c:out value="${category.name}"/></li>
				
			</c:forEach>
		</ul>
		
	</div>
	<hr>
	<form action="/products/${id}" method="post">
		<h3>Add Category:</h3>
		<select name="categoryId" id="categoryId">
			<c:forEach var="category" items="${unassignedCategories}">
				<option value="${category.id}">${category.name}</option>
			</c:forEach>
		</select>
		<input class="button" type="submit" value="Add"/>
	</form>
</body>
</html>