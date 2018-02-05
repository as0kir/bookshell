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
<h1>Books</h1>

<c:url var="addUrl" value="/app/main/books/add" />
<table style="border: 1px solid; width: 500px; text-align:center">
  <thead style="background:#fcf">
  <tr>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Money</th>
    <th colspan="3"></th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${books}" var="book">
    <c:url var="editUrl" value="/app/main/books/edit?id=${book.id}" />
    <c:url var="deleteUrl" value="/app/main/books/delete?id=${book.id}" />
    <tr>
      <td><c:out value="${book.title}" /></td>
      <td><c:out value="${book.author}" /></td>
      <td><a href="${editUrl}">Edit</a></td>
      <td><a href="${deleteUrl}">Delete</a></td>
      <td><a href="${addUrl}">Add</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<c:if test="${empty books}">
  There are currently no books in the list. <a href="${addUrl}">Add</a> a book.
</c:if>

</body>
</html>