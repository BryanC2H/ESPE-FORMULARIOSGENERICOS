<%-- 
    Document   : testQuery
    Created on : 22/03/2018, 12:56:53
    Author     : Tefii
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.FormPersona"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.DB"%>
<%@page import="javax.swing.JOptionPane"%>
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

        <h1>Hello World!</h1>
        <%
         try{
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<FormPersona> listaFP=new LinkedList<FormPersona>();
            int usPidm=4000;
            int codFP=0;
            String NombreF = request.getParameter("Submit");
            int Cod = 64;
            
            String estadoLL = null;
             ResultSet rs1 = co.prepareStatement("SELECT CODIGO_UZGTFORMULARIOS_PERSONA,UZGTFORMULARIOS_ESTADO_LLENADO FROM UTIC.UZGTFORMULARIO_PERSONA WHERE codigo_UZGTFORMULARIOS= '"+Cod+"' AND SPRIDEN_PIDM="+usPidm).executeQuery();
            while(rs1.next())
            {
                FormPersona fp = new FormPersona();
                fp.setCodFormP(rs1.getInt(1));
                fp.setEstadoLlenado(rs1.getString(2));
                codFP=rs1.getInt(1);
                estadoLL=rs1.getString(2);
                listaFP.add(fp);
            }
            rs1.close();
           JOptionPane.showMessageDialog(null, Cod+" "+usPidm+" "+listaFP.getFirst().getCodFormP()+listaFP.getFirst().getEstadoLlenado() +" VALE "+ codFP + estadoLL);
           co.prepareStatement(" UPDATE UZGTFORMULARIO_PERSONA SET UZGTFORMULARIOS_ESTADO_LLENADO ='L'  WHERE CODIGO_UZGTFORMULARIOS ='"+Cod+"' AND SPRIDEN_PIDM="+usPidm).executeUpdate();
           con.closeConexion();
         }catch(Exception e)
         {JOptionPane.showMessageDialog(null,e.getMessage());
         }
        %>
    </body>
</html>
