<%-- 
    Document   : prueba
    Created on : 30/01/2018, 9:07:10
    Author     : DIEGOPC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.DB2"%>
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

        <%             try {

        %>
        <h1>Hello World!</h1>
        <%
            DB2 con = DB2.getInstancia();
            Connection co = con.getConnection();
            ResultSet rs = co.prepareStatement("SELECT SFRSTCR_PIDM FROM SFRSTCR WHERE SFRSTCR_TERM_CODE = '201720' AND SFRSTCR_CRN = '1070'   ").executeQuery();
            co.close();
            con.closeConexion();
        %>
<%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
