<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Create New Person</h1>

<form:form modelAttribute="userAttribute" method="POST" action="/kilbirdih/users/add">
	<table>
		<tr>
			<td><form:label path="Name">Name:</form:label></td>
			<td><form:input path="Name"/></td>
		</tr>

		<tr>
			<td><form:label path="Age">Age</form:label></td>
			<td><form:input path="Age"/></td>
		</tr>
		
		<tr>

		</tr>
	</table>
	
	<input type="submit" value="Save" />
</form:form>

</body>
</html>