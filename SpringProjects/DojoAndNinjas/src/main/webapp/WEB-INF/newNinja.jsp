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
<title>New Ninja</title>
</head>
<body>
	<form:form method="post" modelAttribute="ninja" class="form">
		<div class="form-group">
			<form:label path="dojo">Dojo:</form:label>
			<form:select path="dojo">
				<c:forEach var="dojo" items="${dojos}">
					<option value="${team.id}">${teams}</option>
				</c:forEach>
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="firstName">First Name:</form:label>
			<form:input path="firstName" class="form-control"/>
		</div>
	</form:form>
</body>
</html>