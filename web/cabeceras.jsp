<%-- 
    Document   : cabeceras
    Created on : 16-oct-2016, 17:28:03
    Author     : david
--%>

<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="espe.edu.ec.connection.DB2"%>
<%@page import="espe.edu.ec.models.Matriz"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <div class="row bg-default">
            <!--<div class="col-md-2"><center><img src="espelogo.jpg"/></center></div> -->
            <div class="col-md-8"><center><h1>Servicios</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <%      request.setCharacterEncoding("UTF-8");
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            String codigoTP = request.getParameter("tipo");
            LinkedList<Matriz> ListaMatriz = new LinkedList<Matriz>();
            LinkedList<Integer> ListaCabeceras = new LinkedList<Integer>();
            ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ ORDER BY codigo_UZGTMATRIZ ASC").executeQuery();
            while (rs2.next()) {
                Matriz Mat = new Matriz(rs2.getInt(1), rs2.getInt(2), rs2.getInt(3), rs2.getInt(4), rs2.getInt(5), rs2.getInt(6), rs2.getString(7));
                ListaMatriz.add(Mat);
            }
            rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTCABECERAS ORDER BY codigo_UZGTCABEZERA ASC").executeQuery();
            while (rs2.next()) {
                int Cab = rs2.getInt(1);
                ListaCabeceras.add(Cab);
            }
            rs2.close();
            out.println("<form action=\"nuevacabecera.jsp\" method=\"POST\">");
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-3\"></div>");
            out.println("<div class=\"col-md-3\"><h4>Item columna</h4></div>");
            out.println("</div>");
            for (int i = 0; i < ListaMatriz.getLast().getColumna(); i++) {
                String cabecera = "V";
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<div class=\"col-md-3\"><input type=\"text\" name='" + cabecera + i + "' required/  placeholder='" + cabecera + i + "'></div>");
                out.println("</div>");
            }
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-3\"></div>");
            out.println("<div class=\"col-md-3\"><h4>Item fila</h4></div>");
            out.println("</div>");
            for (int i = 0; i < ListaMatriz.getLast().getFila(); i++) {
                String cabecera = "H";
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<div class=\"col-md-3\"><input type=\"text\" name='" + cabecera + i + "' required/ placeholder='" + cabecera + i + "'> </div>");
                out.println("</div>");
            }
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-3\"></div>");
            out.println("<div class=\"col-md-3\"><button class=\"btn btn-success\" type=\"submit\" name=\"Submit\" value=\"guardar\"><strong>Aceptar</strong></button></div>");
            out.println("</div>");
            out.println("</form>");
            con.closeConexion();
        %>
        <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
