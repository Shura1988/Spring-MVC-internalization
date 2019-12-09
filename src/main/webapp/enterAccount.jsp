<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title><spring:message code="message.Enter"/></title>
</head>
<body>
<div align="center">
    <h1><spring:message code="message.Login"/></h1>
    <form action="/enter" method="post">
        <spring:message code="message.Login"/>:<br>
        <input type="text" name="login">
        <br><br>
        <spring:message code="message.Password"/>:<br>
        <input type="text" name="password">
        <br><br>
        <form action="/enter" method="post">
            <input type="submit" value=" <spring:message code="message.Ente"/>"/>
        </form>
        <form action="/createUser" method="get">
            <input type="submit" value=" <spring:message code="message.Add"/>">
        </form>

        <form action="/">
            <input type="submit" value=" <spring:message code="message.Exit"/>"/>
            <form action="/start.jsp"></form>
        </form>
    </form>
</div>
</body>
</html>


