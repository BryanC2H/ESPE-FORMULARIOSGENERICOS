<%-- 
    Document   : mostrarPlanificacion
    Created on : 14/06/2019, 09:23:24 AM
    Author     : aetorres
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.PlanificacionTutorias"%>
<%@page import="FORM.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser")); //Recibe el atributo de sesion del Servlet
/*Si el atributo es diferente de nulo muestra la pagina */if (currentUser!=null){ %>

<head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <title>Mostrar-Planificacion</title>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <% 
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<PlanificacionTutorias> listaP = new LinkedList<PlanificacionTutorias>();
            ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZTPLANIF ORDER BY codigo_PLANIF ASC").executeQuery();
            while(rs.next())
            {
                PlanificacionTutorias P = new PlanificacionTutorias();
                P.setCodigo_planificacion(rs.getInt(1));
                P.setCodigo_formularios(rs.getInt(2));
                P.setFecha_formulario(rs.getString(3));
                P.setTipoPersona(rs.getString(4));
                P.setTipoTutoria(rs.getString(5));
                P.setSpridenPidm(rs.getInt(6));
                P.setTema(rs.getString(7));
                P.setPublico(rs.getString(8));
                P.setNrc(rs.getString(9));
                P.setAsignatura(rs.getString(10));
                P.setPeriodo(rs.getString(11));
                P.setNivel(rs.getString(12));
                listaP.add(P);
            }
            rs.close();
            con.closeConexion();
     

        %>
        
    </head>

    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
