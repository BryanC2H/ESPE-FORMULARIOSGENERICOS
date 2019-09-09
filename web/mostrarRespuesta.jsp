<%-- 
    Document   : mostrarFormulario
    Created on : 14-ene-2018, 21:55:20
    Author     : D4ve
--%>

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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script> $(document).ready(function ()
    {
        $(
                '[data-toggle="tooltip"]'
                ).tooltip();
    });
</script>
<%
    DB con = DB.getInstancia();
    Connection co = con.getConnection();
    LinkedList<Formulario> listaF = new LinkedList<Formulario>();
    ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
    while (rs.next()) {
        Formulario F = new Formulario();
        F.setCodigo_formulario(rs.getInt(1));
        F.setNombre_formulario(rs.getString(2));
        F.setDescripcion_formulario(rs.getString(3));
        F.setFecha_formulario(rs.getDate(4));
        F.setObjetivo_formulario(rs.getString(5));
        F.setBase_formulario(rs.getString(6));
        listaF.add(F);
    }
    rs.close();

%>

</head>

<style>.navbar-custom {
        color: #58D68D;
        background-color:#239B56;
        border-color: #000
    } 
    .mr {
        align-content: center;
        background-color: red;    

    }</style>
    <%--<li role="presentation"><a  href="mostrarGRes.jsp" >Volver</a></li>--%>
</br></ul>
<%out.print("<center><div class=\"col-3 .col-md-7\"><h4 class=\"text alert alert-success\"><strong>" + "Respuestas de Formularios</strong></h4></center></div></center></br>");%>


<form action="LoginServlet" method="POST">
    <br><div class="row">
        <div class="col-md-3"></div>

        <div class="col-md-3"></div>
    </div>
    <%

        for (int i = 0; i < listaF.size(); i++) {

            String cod = "";
            out.print("<form action=\"\" method=\"POST\" target=\"_self\" id=\"mr\"style=\"display:inline;\">");
            out.println("</div>");

            out.print("<center><div class=\"row\">");
            out.print("<div class=\"col-md-4\"></div>");

            out.print("<div class=\"col-md-1\" align=\"justify\"><p id=\"cod\">" + listaF.get(i).getCodigo_formulario() + "</p></div>");
            out.print("<div class=\"col-md-3\" align=\"justify\"><p name=\"nombre\">" + listaF.get(i).getNombre_formulario() + "</p></div>");

            out.print("<div class=\"col-md-1\"><button class=\"btn btn-outline-info\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Ver\" class=\"btn btn-default\" type=\"text\" name=\"Submit\" onclick=\"this.form.action='mostrarFormularioUsuario.jsp';this.form.submit();\" value='" + cod + listaF.get(i).getCodigo_formulario() + "'><i class=\"fas fa-eye\" style='font-size:20px'></i></button></div>");
            out.print("<div class=\"col-md-3\"></div>");
            out.print("</center></div></form>");
            //out.print("<form action=\"publicarUsuario.jsp\" method=\"POST\" target=\"_self\" style=\"display: inline;\">");
            //out.print("<div class=\"row\">");
            //out.print("<div class=\"col-md-3\"><button class=\"btn btn-default\" type=\"text\" name=\"enviar\" value='"+cod+listaF.get(i).getCodigo_formulario()+"'>Publicar</button></div>");
            //out.print("</div></form>");
        }
        con.closeConexion();
        /*
         for(int i=0; i<listaF.size();i++)
         {
                            
         String cod = "";
         out.println("<form action=\"publicarUsuario.jsp\" method=\"POST\" target=\"_self\">");
         out.println("<div class=\"col-md-4\"><button class=\"btn btn-default\" type=\"text\" name=\"enviar\" value='"+cod+listaF.get(i).getCodigo_formulario()+"'>Publicar</button></div>");
         out.println("</div></form>");
         }*/

    %>
</form>  
<% } else {

%>

<html>
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
