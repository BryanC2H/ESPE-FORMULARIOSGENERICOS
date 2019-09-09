<%-- 
    Document   : pruebadato
    Created on : 16-oct-2016, 20:25:59
    Author     : david
--%>

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
        <%
            String NombreF = request.getParameter("Submit");
            out.println("<p>"+NombreF+"</p>");
            %>
<%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());
            }
        %>
    </body>
</html>
