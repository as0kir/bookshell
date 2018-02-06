<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Книжная полка</title>
</head>
<body>

<h1>Создание новой книги</h1>

<c:url var="saveUrl" value="/bookshell/main/books/add" />
<form:form modelAttribute="bookAttribute" method="POST" action="${saveUrl}">
  <table>
    <tr>
      <td><form:label path="title">Название</form:label></td>
      <td><form:input path="title"/></td>
    </tr>

    <tr>
      <td><form:label path="author">Автор</form:label></td>
      <td><form:input path="author"/></td>
    </tr>

    <tr>
      <td><form:label path="isbn">ISBN</form:label></td>
      <td><form:input path="isbn"/></td>
    </tr>

    <tr>
      <td><form:label path="printYear">Год издания</form:label></td>
      <td><form:input path="printYear"/></td>
    </tr>

    <tr>
      <td><form:label path="description">Описание</form:label></td>
      <td><form:input path="description"/></td>
    </tr>
  </table>

  <input type="submit" value="Save" />
</form:form>

</body>
</html>