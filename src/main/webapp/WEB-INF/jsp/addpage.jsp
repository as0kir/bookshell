<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Книжная полка</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="import" href="/nav.jsp">
</head>
<body>
  <c:import url="nav.jsp"/>
  <c:url var="saveUrl" value="/bookshell/main/books/add" />
  <div style="height:50px;"></div>

  <form:form modelAttribute="bookAttribute" method="POST" action="${saveUrl}">
    <div class="container">
      <div class="row">
        <div class="col"></div>
        <div class="form-group col-6">
          <div class="control-group required">

            <div class="form-group">
              <label for="title">Название</label>
              <form:input path="title" type="text" class="form-control" aria-describedby="titleHelp" placeholder="Введите название произведения"/>
            </div>

            <div class="form-group">
              <label for="author">Автор</label>
              <form:input path="author" type="text" class="form-control" aria-describedby="authorHelp" placeholder="Введите автора произведения"/>
            </div>

            <div class="form-group">
              <label for="isbn">ISBN</label>
              <form:input path="isbn" type="text" class="form-control" aria-describedby="isbnHelp" placeholder="Введите ISBN произведения"/>
            </div>

            <div class="form-group">
              <label for="printYear">Год издания</label>
              <form:input path="printYear" type="text" class="form-control" aria-describedby="printYearHelp" placeholder="Введите год издания"/>
            </div>

            <div class="form-group">
              <label for="description">Описание</label>
              <form:input path="description" type="text" class="form-control" aria-describedby="descriptionHelp" placeholder="Введите описание произведения"/>
            </div>

            <button type="submit" class="btn btn-primary">Сохранить</button>
            <input type="button" class="btn btn-primary" onclick="history.back()" value="Назад">

          </div>
        </div>
        <div class="col"></div>
      </div>
    </div>
  </form:form>
</body>
</html>