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
  <c:import url="nav.jsp"/>

  <div class="container-fluid">
    <table class="table table-condensed table-hover">
      <thead>
        <tr>
          <th>Автор</th>
          <th>Название</th>
          <th>ISBN</th>
          <th>Год издания</th>
          <th>Описание</th>
          <th>Прочитана</th>
          <th colspan="2"></th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${books}" var="book">
          <c:url var="editUrl" value="/bookshell/main/books/edit?id=${book.id}" />
          <c:url var="deleteUrl" value="/bookshell/main/books/delete?id=${book.id}" />
          <tr>
            <td><c:out value="${book.author}" /></td>
            <td><c:out value="${book.title}" /></td>
            <td width=150><c:out value="${book.isbn}" /></td>
            <td width=150><c:out value="${book.printYear}" /></td>
            <td><c:out value="${book.description}" /></td>
            <td><c:out value="${book.readAlready}" /></td>

            <td width=100><a href="${editUrl}">Редактировать</a></td>
            <td width=100><a href="${deleteUrl}">Удалить</a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <nav aria-label="Page navigation example">
    <ul class="pagination">
      <c:forEach items="${pages}" var="page">
        <li class="page-item"><a class="page-link" href="#">${page}</a></li>
      </c:forEach>
    </ul>
  </nav>

</body>
</html>