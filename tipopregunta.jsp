<%-- 
    Document   : tipopregunta.jsp
    Created on : 10-ago-2016, 22:51:58
    Author     : david
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.DB"%>
<%@page import="FORM.TipoPreguntas"%>
<%@page import="FORM.ParametrosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            String seleccion=request.getParameter("seleccion");
            String codigo = request.getParameter("codigo");
            int cod = Integer.parseInt(codigo);
            try
            {
                 PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTIPOPREGUNTAS (codigo_UZGTIPOPREGUNTAS,codigo_UZGTIPOPREGUNTAS_RESPUESTA) VALUES (?,?)");
                ps.setInt(1, Integer.parseInt(codigo));
                ps.setString(2, seleccion);
                ps.executeUpdate();
                out.println("CREADO TIPO PREGUNTA");            
        %>
        <h1>FUNCIONO</h1>
        <%
            }
            catch (javax.xml.ws.WebServiceException ex)
            {
                out.println("No hay conexión con el webservice");
            }
            catch (Exception ex)
            {
                out.println(ex);
            }
            con.closeConexion();
    %>
    </body>
</html>
