<%-- 
    Document   : NewForm
    Created on : 15/03/2018, 11:06:04 AM
    Author     : D4ve
--%>
<%@page import="FORM.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser")); //Recibe el atributo de sesion del Servlet
/*Si el atributo es diferente de nulo muestra la pagina */if (currentUser!=null){ %>
<!DOCTYPE html>
<html>
    <head>
        <title>Formularios</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     	<link href="css/bootstrap.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
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
        <style>.navbar-custom {
                color: #58D68D;
                background-color: #239B56;
                border-color: #000
            }</style>

        </br></br></br>
        <ul class="nav nav-tabs " role="tablist" >

            <%       // out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\"  href=\"NewForm.jsp\"><i class=\"fas fa-\" style='font-size:24px'>&#xf0fe;</i><strong> Nuevo </strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\" href=\" mostrarFormulario.jsp\"><i class=\"fas fa-tools\" style='font-size:24px'></i><strong> Gestión </strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\" href=\"mostrarGRes.jsp?param=\"null\"\"><i class=\"fas fa-chalkboard-teacher\" style='font-size:24px'></i>&nbsp<strong>Publicados</strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white ;\" href=\"mostrarRespuesta.jsp\"><i class=\"fas fa-\" style='font-size:24px'>&#xf15c;</i><strong> Respuestas</strong></a></li></br>");
            %>



            <%--<li role="presentation"><a  href="mostrarGRes.jsp" >Volver</a></li>--%>
        </ul>
        <%
     out.println("<center><div class=\"col-3 .col-md-7\"><h4 class=\"text alert alert-success\"><strong>" + "Nuevo Formulario</strong></h4></center></div></center></br>");%>
    
        
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
<% }
                   else{        
                  
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
                  
                  
                  
                  <% } %>
    
