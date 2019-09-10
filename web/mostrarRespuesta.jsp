<%-- 
    Document   : mostrarFormulario
    Created on : 14-ene-2018, 21:55:20
    Author     : D4ve
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.Formulario"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.models.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser")); //Recibe el atributo de sesion del Servlet
/*Si el atributo es diferente de nulo muestra la pagina */
    if (currentUser != null) { %>
<head> 
    </br></br></br>
<ul class="nav nav-tabs " role="tablist" >

    <%        out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\"  href=\"NewForm.jsp\"><i class=\"fas fa-\" style='font-size:24px'>&#xf0fe;</i><strong> Nuevo </strong></a></li>");
        out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\" href=\" mostrarFormulario.jsp\"><i class=\"fas fa-tools\" style='font-size:24px'></i><strong> Gestión </strong></a></li>");
        out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\" href=\"mostrarGRes.jsp?param=\"null\"\"><i class=\"fas fa-chalkboard-teacher\" style='font-size:24px'></i>&nbsp<strong>Publicados</strong></a></li>");
        //out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white ;\" href=\"mostrarRespuesta.jsp\"><i class=\"fas fa-\" style='font-size:24px'>&#xf15c;</i><strong> Respuestas</strong></a></li></br>");
    %>
</ul>

<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>Mostrar-Formularios</title>
<link href="css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <!-- Link de archivos CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
              integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
              integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <!-- Link de archivos js -->
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
                integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
        <script src="js/dataoracle.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script> $(document).ready(function ()
    {
        $(
                '[data-toggle="tooltip"]'
                ).tooltip();
    });
</script>
</head>

<body>
<style>.navbar-custom {
        color: #58D68D;
        background-color:#239B56;
        border-color: #000
    } 
    .mr {
        align-content: center;
        background-color: red;    

    }</style>
</br>
<%out.print("<center><div class=\"col-3 .col-md-7\"><h4 class=\"text alert alert-success\"><strong>" + "Respuestas de Formularios</strong></h4></center></div></center></br>");%>
<form action="LoginServlet" method="POST">
    <br><div class="row">
        <div class="col-md-3"></div>

        <div class="col-md-3"></div>
    </div>
    <center> <div class="container" class= "col-3 .col-md-7">
    <table id="example" class="table table-striped table-bordered" >
                <thead>
                    <tr >
                        <th class="text-center">CODIGO</th>
                        <th class="text-center">NOMBRE</th>
                        <th class="text-center">OPCIONES</th>
                    </tr>
                </thead>
                <tbody>
<%
    DB con = DB.getInstancia();
    Connection co = con.getConnection();
 
 PreparedStatement st;
                ResultSet ts;
                st = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS ORDER BY codigo_UZGTFORMULARIOS ASC");
                ts = st.executeQuery();
    //      Formularios_Connection con = F
     while (ts.next()) {
         String cod = "";
%>
 
    <form action="" method="POST" target="_self" id="mr" style="display:inline;">

    
       <tr>
                        <td class="text-center"><%= ts.getInt("CODIGO_UZGTFORMULARIOS")%> </td>
                        <td class="text-center"><%= ts.getString("UZGTFORMULARIOS_NOMBRE")%> </td>
                        <td>
                            <div class="btn-toolbar text-center" role="toolbar">
                                <div class="row">
                                    <div class="col-md-4 center-block"></div>
                                    <div class="btn-group col-md-12">
                                        <center><div class="col-md-1"><button class="btn btn-outline-info" data-toggle="tooltip" data-placement="top" title="Ver" class="btn btn-default" type="text" name="Submit" onclick="this.form.action='mostrarFormularioUsuario.jsp';this.form.submit();" value="<%= ts.getInt("CODIGO_UZGTFORMULARIOS")%>"><i class="fas fa-eye" style='font-size:20px'></i></button></div></center>
                                    </div>
                                    <div class="col-md-4 center-block"></div>
                                </div>
                            </div>
                        </td>
       </tr>
</form> 
    <% }   ts.close();
        con.closeConexion();
         %> 
                </tbody>
            </table>
                </center>
        </div>
                  </form>  
         </body>
       
<% } else {

%>

<html>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet"></link>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>No Autorizado</title>
    </head>
    <body>
        <%@page import="org.apache.log4j.Logger"%>
        <%! static Logger logger = Logger.getLogger("bitacora.subnivel.Control");%>
        <%logger.info("esta es la prueba."); %>
        <%logger.debug("Demostracion del mensaje");%>
        <%logger.warn("Show WARN message");%>
        <%logger.error("Show ERROR message");%>
        <%logger.fatal("Show FATAL message"); %>
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
