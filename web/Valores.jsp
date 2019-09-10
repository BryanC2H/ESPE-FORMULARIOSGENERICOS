<%-- 
    Document   : Valores
    Created on : 13-ago-2016, 22:39:15
    Author     : david
--%>


<%@page import="espe.edu.ec.connection.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.models.TipoPreguntas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.Grupo"%>
<%@page import="espe.edu.ec.models.Preguntas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Valor-Pregunta</title>           
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <style>.navbar-custom {
                color: #58D68D;
                background-color: #239B56;
                border-color: #000
            }</style>
    </body>

<body>
    <%@page import="org.apache.log4j.Logger"%>
    <%! static Logger logger = Logger.getLogger("bitacora.subnivel.Control");%>
    <%logger.info("esta es la prueba."); %>
    <%logger.debug("Demostracion del mensaje");%>
    <%logger.warn("Show WARN message");%>
    <%logger.error("Show ERROR message");%>
    <%logger.fatal("Show FATAL message"); %>
    <%

        try {

    %> 
    <div class="row bg-">
        <div class="col-md-2"><center><img src="Imagenes/espelogo.jpg"/></center></div>
        <div class="col-md-8"><center><h1>Formularios Genericos</h1></center></div>
        <div class="col-md-2"></div>
    </div>
    <ul class="nav nav-tabs" role="tablist">
        <li class="navbar navbar-inverse navbar-fixed-top navbar-custom" role="presentation"><a style="color:white;" href="Valores.jsp"><strong><i class="far fa-calendar-plus" style='font-size:24px;color:white'></i>Nuevo Valor</a></strong</li>                
        <li class="navbar navbar-inverse navbar-fixed-top navbar-custom" role="presentation"><a style="color:white;" href="pregunta.jsp"><strong><i class="fas fa-calendar-plus" style='font-size:24px;color:white'></i>Nueva Pregunta</a></strong</li>
    </ul>
        <form action="nuevoValor.jsp" method="POST">   
            <%
               
                //out.println("<h3>"+pregunta+"</h3>");
            %>
            <div class="container">
            <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3"><h4>Valor: </h4></div>
            <div class="col-md-3"><center><input id="valor" type="text" name="valor" class="form-control" placeholder="ingrese el valor de la respuesta" required/></center></div>
            </div>
            <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-3"><center><button class="btn btn-success" type="submit" name="Submit" value="guardar">Agregar</button></center></div>
            </div>
            </div>
        </form>
 <%             } catch (Exception e) {
            System.out.println("error." + e.getMessage());

        }
    %>
    </body>
</html>
