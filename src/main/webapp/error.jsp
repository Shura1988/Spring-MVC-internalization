<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
    <title><spring:message code="message.Err"/></title>

<body>

<div align="center">
    <h1> <spring:message code="message.Err"/> </h1>
</div>
<div align="center">
    <spring:message code="message.inEr"/> <br>
    <button onclick="location.href='/enterAccount.jsp'" size="45"> <spring:message code="message.enter"/> </button>
    <br><br>
</div>
</body>
</html>
