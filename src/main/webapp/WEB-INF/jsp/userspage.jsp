<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRUD</title>
</head>
<body>
<h1>Users</h1>

<form:form action="/kilbirdih/users" method="post">
	<label>Name:</label>
    <label>
        <input type="text" name="name"/>
    </label>
    <input type="submit" value="Search">
</form:form>
<br/>
<table style="border: 1px solid; width: 500px; text-align:center" >
    <thead style="background:aquamarine">
    <tr>
        <th>Name</th>
        <th>Age</th>
        <th>Admin</th>
        <th>CreateDate</th>
        <th colspan="3"></th>
    </tr>
    </thead>
    <tbody style="background: #ddd">
    <c:forEach items="${users}" var="user">
        <tr>
            <td><c:out value="${user.name}" /></td>
            <td><c:out value="${user.age}" /></td>
            <td><c:out value="${user.admin}" /></td>
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
<div id="pagination">

    <c:if test="${page > 1}">
        <c:choose>
        <c:when test="${name != null}"><a href="<c:out value="/kilbirdih/users?page=${page-1}&name=${name}" />" class="pn prev">Prev</a> </c:when>
        <c:otherwise>
        <a href="<c:out value="/kilbirdih/users?page=${page-1}" />" class="pn prev">Prev</a>
        </c:otherwise>
        </c:choose>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:choose>
                <c:when test="${name != null}"><a href="<c:out value="/kilbirdih/users?page=${i.index}&name=${name}" />">${i.index}</a> </c:when>
                <c:otherwise>
                    <a href='<c:out value="/kilbirdih/users?page=${i.index}" />'>${i.index}</a>
                </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${page + 1 <= maxPages}">
        <c:choose>
        <c:when test="${name != null}"><a href="<c:out value="/kilbirdih/users?page=${page+1}&name=${name}" />" class="pn next">Next</a> </c:when>
        <c:otherwise>
        <a href='<c:out value="/kilbirdih/users?page=${page + 1}" />' class="pn next">Next</a>
        </c:otherwise>
        </c:choose>
    </c:if>
</div>

</body>
</html>