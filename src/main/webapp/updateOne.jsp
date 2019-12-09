<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>

</head>
<body>
<div align="center">
    <spring:message code="message.UpdUsInf"/> ${param.id}:
    <div>
        <form action="/update" method="post">
            <input type="hidden" name="id" value="${param.id}">
            <br>
            <spring:message code="message.Login"/>:
            <input type="text" name="login" value="${param.login}" placeholder=${param.login}><br>
            <br>
            <spring:message code="message.Password"/> :
            <input type="text" name="password" value="${param.password}}" placeholder=${param.password}><br>
            <br>
            <spring:message code="message.Age"/>:
            <input type="number" size="3" name="age" min="1" max="120" value="${param.age}" placeholder=${param.age}><br>
            <br>
            <spring:message code="message.Name"/> :
            <input type="text" name="name" value="${param.name}" placeholder=${param.name}><br>
            <br>
            <spring:message code="message.Description"/>:
            <input type="text" name="description" value="${param.description}"
                   placeholder=${param.description}><br>
            <br>
            <spring:message code="message.Town"/>:
            <input type="text" name="town" value="${param.town}"
                   placeholder=${param.town}><br>
            <br>
            <spring:message code="message.Street"/>:
            <input type="text" name="street" value="${param.street}"
                   placeholder=${param.street}><br>
            <br>
            <spring:message code="message.House"/> :
            <input type="text" name="house" value="${param.house}"
                   placeholder=${param.house}><br>
            <br>
            <spring:message code="message.Role"/>:
            <input required type="radio" name="role" value="user" placeholder="User">  <spring:message code="message.User"/> :
            <br>
            <input type="hidden" name="_method" value="put">
            <input type="submit" value=" <spring:message code="message.Up"/>:">
            <button onclick="location.href='/enterAccount.jsp'" size="45">  <spring:message code="message.Exit"/>: </button>
        </form>
    </div>


</div>
</body>
</html>
