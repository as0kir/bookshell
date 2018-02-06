<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Книжная полка</title>
</head>
<body>
  <h1>Книги</h1>
  <c:url var="mainUrl" value="/bookshell/main/books" />

  <div class="alert alert-success" role="alert">
    <h4 class="alert-heading">Успешно сохранено</h4>
    <p>Вы отредактировали информацию о книге с ID=${id}.</p>
    <hr>
    <p class="mb-0">Вернуться в <a href="${mainUrl}" class="alert-link">Главный список</a></p>
  </div>

</body>
</html>