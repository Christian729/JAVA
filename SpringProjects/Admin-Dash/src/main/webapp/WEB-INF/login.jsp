<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>

<body>
<!-- in the event we are logging out, flash the logout message  -->
	 <c:if test="${logoutMessage != null}">
        <c:out value="${logoutMessage}"></c:out>
    </c:if>
    <h1>Login</h1>
    <!-- in the event we are having an error, flash error message  -->
    <c:if test="${errorMessage != null}">
        <c:out value="${errorMessage}"></c:out>
    </c:if>
    
    
    <form:form method="POST" action="/login" modelAttribute="user">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <!-- the main thing we did when adding in the login page to the register page was putting this csrf token -->
        <p>
            <label for="username">Username</label>
            <form:errors path="userName" class="text-danger"/>
            <input type="text" id="username" name="username"/>
            <!--  It is important to note that the form must have a name field with the username value for Spring Security to correctly grab the information in the loadUserByUsername(String) method. -->
        </p>
        <p>
            <label for="password">Password</label>
            <form:errors path="password" class="text-danger"/>
            <input type="password" id="password" name="password"/>
        </p>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Login!"/>
    </form:form><!-- spring security handles our post request automatically, so we dont need to put one into our controller  -->
    <hr>
    
    <h1>Register!</h1>
    
    <%-- <p><form:errors path="user.*"/></p> --%>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
        <p>
            <form:label path="username">Username:</form:label>
            <form:errors path="userName" class="text-danger"/>
            <form:input path="username"/>
        </p>
        <p>
            <form:label path="password">Password:</form:label>
            <form:errors path="password" class="text-danger"/>
            <form:password path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:errors path="passwordConfirmation" class="text-danger"/>
            <form:password path="passwordConfirmation"/>
        </p>
        <input type="submit" value="Register!"/>
    </form:form>
    
    <!-- after adding the login and reg pages together we need to adjust the controller -->
    
</body>
</html>