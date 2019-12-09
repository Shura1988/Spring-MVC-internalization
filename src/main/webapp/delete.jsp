<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
    <title><spring:message code="message.Delete"/></title>
</head>
<body>

<spring:message code="message.delInf"/> ${param.id}?

<form action="/delete" method="post">
    <input type="hidden" name="id" value="${param.id}">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="<spring:message code="message.Del"/>">
</form>
</body>
</html>
