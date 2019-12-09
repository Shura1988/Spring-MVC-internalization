<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
    <title><spring:message code="message.wellcom"/></title>
</head>
<body>
<span style="float: right">
    <a href="?lang=en"> en </a>
    <a href="?lang=ru"> ru </a>
</span>
<div style="text-align: center;">
    <h1><b><spring:message code="message.Social"/></b></h1><br>

    <p>
    <form action="/enter" method="get">
        <input type="submit" value="<spring:message code="message.enter"/>"> <br><br>
    </form>
    </p>
    <p>
    <form action="/createUser" method="get">
        <input type="submit" value="<spring:message code="message.registration"/>">
    </form>
    </p>
</div>
</body>
</html>
