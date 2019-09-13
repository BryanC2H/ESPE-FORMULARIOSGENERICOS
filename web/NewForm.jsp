<%-- 
    Document   : NewForm
    Created on : 15/03/2018, 11:06:04 AM
    Author     : D4ve
--%>
<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="espe.edu.ec.models.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<<%Cookie cookie = null;
    Cookie[] cookies = null;
    String pidm = null;
    String id = null;
    cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            if (cookie.getName().equals("pidm")) {
                pidm = cookie.getValue();
            } else if (cookie.getName().equals("id")) {
                id = cookie.getValue();
            }
        }
    } else {
        out.println("<h2>No cookies founds</h2>");
    }
    String currentUser = pidm;
    if (currentUser != null) { %>
<!DOCTYPE html>
<html>
    <head>
        <title>Formularios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>
    </head>
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


        <p></p>
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
                            <!--<li role="presentation">
                                <a href="NewForm.jsp">
                                    <i class="fas fa-">&#xf0fe</i>&nbsp<strong>Nuevo</strong></a>
                            </li>-->
                            <li role="presentation">
                                <a href="mostrarFormulario.jsp">
                                    <i class="fas fa-tools"></i> Gestion</a>
                            </li>
                            <li role="presentation">
                                <a href="mostrarGRes.jsp">
                                    <i class="fas fa-chalkboard-teacher"></i> Publicados</a>
                            </li>
                            <li role="presentation">
                                <a href="mostrarRespuesta.jsp">
                                    <i class="fas fa-file-archive"></i> Respuestas</a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a><% out.print(id);%></a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
        <!-- --------------------------------Fin Navbar superior-------------------------------------------  -->




        <%--<li role="presentation"><a  href="mostrarGRes.jsp" >Volver</a></li>--%>
    </ul>


    <form action="nuevoFormulario.jsp" method="POST">   

        <div class="container">
            <div class="row">   
                <div class="col-md-3"></div>
                <div class="col-md-3"><h4>Nombre Formulario: </h4></div>
                <div class="col-md-3"><center><input id="nombre" type="text" name="nombre" class="form-control" placeholder="nombre" required/></center></div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3"><h4>Descripcion: </h4></div>
                <div class="col-md-3"><center><input id="descripcion" type="text" name="descripcion" class="form-control" placeholder="descripcion" required/></center></div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3"><h4>Objetivo: </h4></div>
                <div class="col-md-3"><center><label for="objetivo" class="sr-only">objetivo</label><input id="objetivo" type="text" name="objetivo" class="form-control" placeholder="objetivo" required/></center></div>
            </div>
            <div class ="row">
                <br><div class="col-md-3"></div>
                <div class="col-md-3"><h4>Base: </h4></div>
                <div class="col-md-3"><center><select  name="seleccion" class="form-control" required>
                            <option selected>DESARROLLO</option>
                        </select></center>


                </div>

            </div>

            <div class ="row">
                <br><div class="col-md-3"></div>
                <div class="col-md-3"><h4>Tipo de formulario: </h4></div>
                <div class="col-md-3"><center><select  name="seleccionTipo" class="form-control" required>
                            <option selected value="N">NO MODIFICABLE</option>
                            <option value="M">MODIFICABLE</option>
                            <option value="S">SECUENCIAL</option>
                        </select></center>
                    <br><div class="col-md-3"><center><button class="btn btn-success btn-lg" type="submit" name="Submit" value="guardar">Aceptar</button></center></div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3"></div>
                <!--<div class="col-md-3"><center><button class="btn btn-default" type="submit" name="Submit" value="guardar">Aceptar</button></center></div>-->
            </div>
        </div>
    </form>
    <%                                        } catch (Exception e) {
            System.out.println("error." + e.getMessage());

        }
    %>
</body>
</html>
<% } else {

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet"></link>
        <title>No Autorizado</title>
    </head>
    <body>
        <%             try {

        %>
        <ul class="nav nav-tabs" role="tablist">




            <div class="col-md-4">Error! Usuario no autorizado</div>


        </form>


    </ul>
    <%             } catch (Exception e) {
            System.out.println("error." + e.getMessage());

        }
    %>
</body>
</html>



<% }%>

