<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<c:url var="homeUrl" value="/bookshell/main/books" />
<c:url var="searchUrl" value="/bookshell/main/books/search" />
<c:url var="addUrl" value="/bookshell/main/books/add" />

<nav class="navbar navbar-expand-lg navbar-light bg-light" id="nav">
  <a class="navbar-brand" href="${homeUrl}">
    <img src="/resouces/lib.png" width="30" height="30" class="d-inline-block align-top" alt="">
    Книжная полка
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="${addUrl}">Добавить</a>
      </li>
    </ul>

    <form:form modelAttribute="searchAttribute" class="form-inline my-2 my-lg-0" method="POST" action="${searchUrl}">
      <form:select path="typeSearch" class="form-control">
        <option <c:if test="${searchAttribute.typeSearch=='Автор'}">selected</c:if>>Автор</option>
        <option <c:if test="${searchAttribute.typeSearch=='Название'}">selected</c:if>>Название</option>
        <option <c:if test="${searchAttribute.typeSearch=='ISBN'}">selected</c:if>>ISBN</option>
        <option <c:if test="${searchAttribute.typeSearch=='Описание'}">selected</c:if>>Описание</option>
        <option <c:if test="${searchAttribute.typeSearch=='Год издания'}">selected</c:if>>Год издания</option>
        <option <c:if test="${searchAttribute.typeSearch=='Прочитана'}">selected</c:if>>Прочитана</option>
      </form:select>

      <form:input path="valueSearch" class="form-control mr-sm-2" type="text" placeholder="Поиск" aria-label="Поиск"/>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Поиск</button>
    </form:form>
  </div>
</nav>
