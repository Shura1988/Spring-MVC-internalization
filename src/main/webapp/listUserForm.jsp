<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>

</head>

<body>

<h1><spring:message code="message.Admin"/></h1>
<div align="center">
    <table border="2" cellpadding="5">
        <caption><h2><spring:message code="message.UpdUsInf"/></h2></caption>
        <tr>
            <th>id</th>
            <th><spring:message code="message.Login"/></th>
            <th><spring:message code="message.Password"/></th>
            <th><spring:message code="message.Age"/></th>
            <th><spring:message code="message.Name"/></th>
            <th><spring:message code="message.Description"/></th>
            <th><spring:message code="message.Town"/></th>
            <th><spring:message code="message.Street"/></th>
            <th><spring:message code="message.House"/></th>
            <th><spring:message code="message.Role"/></th>
        </tr>
        <c:forEach var="user" items="${user}">
            <tr>
                <td> ${user.id}</td>
                <td> ${user.login} </td>
                <td> ${user.password} </td>
                <td> ${user.age}</td>
                <td> ${user.name} </td>
                <td> ${user.description}</td>
                <td> ${user.adress.getTown()} </td>
                <td> ${user.adress.getStreet()}</td>
                <td> ${user.adress.getHouse()} </td>
                <td> ${user.role.getTitle()}</td>
                <td>
                    <form action="/update" method="get">
                        <input type="hidden" name="id" value="${user.getId()}">
                        <input type="hidden" name="login" value="${user.getLogin()}">
                        <input type="hidden" name="password" value="${user.getPassword()}">
                        <input type="hidden" name="age" value="${user.getAge()}">
                        <input type="hidden" name="name" value="${user.getName()}">
                        <input type="hidden" name="description" value="${user.getDescription()}">
                        <input type="hidden" name="town" value="${user.adress.getTown()}">
                        <input type="hidden" name="street" value="${user.adress.getStreet()}">
                        <input type="hidden" name="house" value="${user.adress.getStreet()}">
                        <input type="hidden" name="title" value="${user.role.getTitle()}">
                        <input type="submit" value="<spring:message code="message.Up"/>" style="float:left">
                    </form>
                    <form action="/delete" method="get">
                        <input type="hidden" name="id" value="${user.getId()}">
                        <input type="submit" value="<spring:message code="message.Del"/>" style="float:left">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <button onclick="location.href='/enterAccount.jsp'" size="45"> <spring:message code="message.Exit"/> </button>
</div>
</body>
</html>