<%-- 
    Document   : Valores
    Created on : 13-ago-2016, 22:39:15
    Author     : david
--%>


<%@page import="espe.edu.ec.constant.ConstantesForm"%>
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
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>
    </head>
    <body>

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
        <div class="container">
            <nav class="navbar navbar-default" role="tablist">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand"><b>Nuevo Formulario</b> </a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li role="presentation">
                                <a href="Valores.jsp">
                                    <i class="fas fa-">&#xf0fe</i>&nbsp<strong>Nuevo Valores</strong></a>
                            </li>
                            <li role="presentation">
                                <a href="pregunta.jsp">
                                    <i class="fas fa-"></i> Nueva Pregunta</a>
                            </li>
                            
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
        <!-- --------------------------------Fin Navbar superior-------------------------------------------  -->

       
        <form action="nuevoValor.jsp" method="POST">   
            <%                //out.println("<h3>"+pregunta+"</h3>");
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
