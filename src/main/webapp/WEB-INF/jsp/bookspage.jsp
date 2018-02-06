<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Книжная полка</title>
</head>
<body>
<h1>Книжная полка</h1>

<c:url var="addUrl" value="/bookshell/main/books/add" />
<table style="border: 1px solid; text-align:center">
  <thead style="background:#fcf">
  <tr>
    <th>Автор</th>
    <th>Название</th>
    <th>ISBN</th>
    <th>Год издания</th>
    <th>Описание</th>
    <th>Прочитана</th>
    <th colspan="3"></th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${books}" var="book">
    <c:url var="editUrl" value="/bookshell/main/books/edit?id=${book.id}" />
    <c:url var="deleteUrl" value="/bookshell/main/books/delete?id=${book.id}" />
    <tr>
      <td><c:out value="${book.author}" /></td>
      <td><c:out value="${book.title}" /></td>
      <td><c:out value="${book.printYear}" /></td>
      <td><c:out value="${book.isbn}" /></td>
      <td><c:out value="${book.description}" /></td>
      <td><c:out value="${book.readAlready}" /></td>

      <td><a href="${editUrl}">Редактировать</a></td>
      <td><a href="${deleteUrl}">Удалить</a></td>
      <td><a href="${addUrl}">Добавить</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<c:if test="${empty books}">
  Нет книг в списке. <a href="${addUrl}">Добавить</a> книгу.
</c:if>

</body>
</html>