<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="Cookies.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
