<%-- 
    Document   : nuevoValor
    Created on : 13-ago-2016, 22:49:23
    Author     : david
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="FORM.Valores"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Preguntas"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Valor</title>
        <%
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<Valores> ListaVal = new LinkedList<Valores>();
            ResultSet rs3 = co.prepareStatement("SELECT * FROM UTIC.UZGTPREGUNTAS ORDER BY codigo_UZGTPREGUNTAS ASC").executeQuery();
            while(rs3.next())
            {
                Preguntas P = new Preguntas();
                P.setCodigo_formulario(rs3.getInt(1));
                P.setCodigo_grupo(rs3.getInt(2));
                P.setCodigo_preguntas(rs3.getInt(3));
                P.setCodigo_formulario_anidado(rs3.getInt(4));
                P.setCodigo_grupo_anidado(rs3.getInt(5));
                P.setCodigo_pregunta_anidada(rs3.getInt(6));
                P.setCodigo_tipo_pregunta(rs3.getInt(7));
                P.setLabel_pregunta(rs3.getString(8));
                P.setVigente_pregunta(rs3.getString(9));
                listaP.add(P);                
            }
            rs3.close();
            ResultSet rs4 = co.prepareStatement("SELECT * FROM UTIC.UZGTVALORES ORDER BY codigo_UZGTVALORES ASC").executeQuery();
            while(rs4.next())
            {
                Valores Val = new Valores();
                Val.setCodigo_Valores(rs4.getInt(1));
                Val.setCodig_Formularios(rs4.getInt(2));
                Val.setCodigo_Grupo(rs4.getInt(3));
                Val.setCodigo_Preguntas(rs4.getInt(4));
                Val.setValores(rs4.getString(5));
              
        
                ListaVal.add(Val);
            }
            rs4.close();            
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
    try{
            int cod = listaP.getLast().getCodigo_formulario();
            int codg = listaP.getLast().getCodigo_grupo();
            int codp = listaP.getLast().getCodigo_preguntas();
            int codval =0;
            if(ListaVal.isEmpty()){
            codval=1;
            }else{
            codval = ListaVal.getLast().getCodigo_Valores()+1;
            }
            
            String Val = request.getParameter("valor");
                PreparedStatement ps1 = co.prepareStatement("INSERT INTO UTIC.UZGTVALORES(codigo_UZGTVALORES,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS,"
                        + "UZGTTIPOPREGUNTAS_valor)"
                        + " VALUES (?,?,?,?,?)");
		java.util.Date date = new java.util.Date();
                long t = date.getTime();
                java.sql.Date sqlDate = new java.sql.Date(t);
                ps1.setInt(1,codval);
                ps1.setInt(2,cod);
                ps1.setInt(3,codg);
                ps1.setInt(4,codp);
                ps1.setString(5,Val.toUpperCase());
             
                ps1.executeUpdate();               
                ps1.close();
                %>
                <script type="text/javascript">
                    window.location="Valores.jsp";
                </script>
                <%
                }
                catch(Exception ex){
                     out.println(ex);
                }
                con.closeConexion();
    %>
    </body>
</html>
