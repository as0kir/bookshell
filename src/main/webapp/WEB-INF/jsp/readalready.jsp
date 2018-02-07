<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Книжная полка</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="import" href="/nav.jsp">
</head>
<body>
<c:import url="nav.jsp"/>
<c:url var="mainUrl" value="/bookshell/main/books" />
<div style="height:50px;"></div>

<div class="container">
  <div class="row">
    <div class="col"></div>
    <div class="form-group col-6">
      <div class="alert alert-success" role="alert">
        <h4 class="alert-heading">Редактирование</h4>
        <p>Вы отметили книгу с ID=${id} как прочитанную</p>
        <hr>
        <p class="mb-0">Вернуться в <a href="${mainUrl}" class="alert-link">Главный список</a></p>
      </div>
    </div>
    <div class="col"></div>
  </div>
</div>

</body>
</html>