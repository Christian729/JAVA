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
	<h1>Edit Project</h1>
	<form:form action="/projects/update/${project.id}" method="post" modelAttribute="project">
		
		<table>
		    <thead>
		    	<tr>
		            <td class="float-left">Project Title:</td>
		            <td class="float-left">
		            	<form:errors path="title" class="text-danger"/>
						<form:input class="input" path="title"/>
		            </td>
		        </tr>
		        <tr>
		            <td class="float-left">Project Description:</td>
		            <td class="float-left">
		            	<form:errors path="description" class="text-danger"/>
						<form:textarea rows="4" class="input" path="description"/>
		            </td>
		        </tr>
		        <tr>
		            <td class="float-left">Due Date:</td>
		            <td class="float-left">
		            	<form:errors path="dueDate" class="text-danger"/>
						<form:input path="dueDate" type="date"/>
		            </td>
		        </tr>
		        
		        
		        <tr>
		        	<td><a href="/home">Cancel</a></td>
		        	<td><input class="input" type="submit" value="Submit"/></td>
		        </tr>
		        
		    </thead>
		</table>
	</form:form>
</body>
</html>