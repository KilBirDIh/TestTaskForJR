<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Persons</h1>

<table style="border: 1px solid; width: 500px; text-align:center">
	<thead style="background:#fcf">
		<tr>
			<th>Name</th>
			<th>Age</th>
            <th>CreateDate</th>
			<th colspan="3"></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${users}" var="user">
		<tr>
			<td><c:out value="${user.name}" /></td>
			<td><c:out value="${user.age}" /></td>
			<td><c:out value="${user.createDate}" /></td>
			<td><a href="${pageContext.request.contextPath}/kilbirdih/users/edit?id=${user.id}">Edit</a></td>
			<td><a href="${pageContext.request.contextPath}/kilbirdih/users/delete?id=${user.id}">Delete</a></td>
			<td><a href="${pageContext.request.contextPath}/kilbirdih/users/add">Add</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:if test="${empty users}">
	There are currently no persons in the list. <a href="${pageContext.request.contextPath}/kilbirdih/users/add">Add</a> a person.
</c:if>

</body>
</html>