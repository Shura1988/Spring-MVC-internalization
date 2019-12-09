<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
    <title><spring:message code="message.CreatUser"/></title>
</head>
<body>
<div align="center">
    <form action="/createUser" method="post">

        <h1><spring:message code="message.registration"/></h1>
        <spring:message code="message.Login"/>:
        <br> <input required type="text" name="login" placeholder="${message}"/>
        <br>
        <br>
        <spring:message code="message.Password"/> :
        <br><input required type="text" name="password" placeholder="<spring:message code="message.Password"/>"/><br>
        <br>
        <spring:message code="message.Age"/>: <br>
        <input required type="number" size="3" name="age" min="1" max="120" value="1"
               placeholder="${message}"/><br>
        <br>
        <spring:message code="message.Name"/> :<br>
        <input required type="text" name="name" placeholder="<spring:message code="message.Name"/>"/><br>
        <br>
        <spring:message code="message.Description"/>:<br>
        <input required type="text" name="description" placeholder="<spring:message code="message.Description"/>"/><br>
        <br>
        <spring:message code="message.Town"/>:
        <br><input required type="text" name="town" placeholder="<spring:message code="message.Town"/>"/><br>
        <br>
        <spring:message code="message.Street"/>:
        <br><input required type="text" name="street" placeholder="<spring:message code="message.Street"/>"/><br>
        <br>
        <spring:message code="message.House"/> :
        <br><input required type="text" name="house" placeholder="<spring:message code="message.House"/>"/><br>
        <br>
        <input required type="radio" name="role" value="user" checked placeholder="User"> <spring:message
            code="message.User"/>
        <br>
        <input type="submit" value="<spring:message code="message.save"/>">
        <input type="reset" value="<spring:message code="message.Clean"/>"> <br><br>
    </form>
    <form action="/enter">
        <input type="submit" value="<spring:message code="message.Back"/>"/>
        <form action="/start.jsp"></form>
    </form>
</div>
</body>
</html>

