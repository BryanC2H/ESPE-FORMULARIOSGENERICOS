<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensaje</title>
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>
    </head>
    <body>

        <center>

            <div id="imprimir">
                <div class="row bg-default">
                    <!-- <div class="col-md-2"><center><img src="espelogo.jpg"/></center></div> -->
                    <div class="col-md-8"><center><h1>Formularios</h1></center></div>
                    <div class="col-md-2"></div>
                </div>
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation"><a href="almacenarR.jsp">Volver</a></li>
                </ul>
                <center><div class="alert alert-success"><strong>Exito!</strong><%=request.getAttribute("Message")%></center></div>
        </center>
    </body>
</html>