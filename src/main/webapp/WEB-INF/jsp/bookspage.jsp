<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="import" href="/nav.jsp">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Книжная полка</title>
</head>
<body>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <c:import url="nav.jsp"/>

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