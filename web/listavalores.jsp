<%-- 
    Document   : listavalores
    Created on : 21-oct-2016, 10:39:16
    Author     : david
--%>

<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="espe.edu.ec.connection.DB2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page import="espe.edu.ec.models.Preguntas"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            DB2 con2 = DB2.getInstancia();
            Connection co2 = con2.getConnection();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<Valores> ListaVal = new LinkedList<Valores>();
            LinkedList<String> ListaDatos = new LinkedList<String>();
            ResultSet rs3 = co.prepareStatement("SELECT * FROM UTIC.UZGTPREGUNTAS ORDER BY codigo_UZGTPREGUNTAS ASC").executeQuery();
            while (rs3.next()) {
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
            while (rs4.next()) {
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

            /*  Connection conec=null;
            String server = "10.1.0.113";
            String port = "1521";
            String database = "PAS8";
            String user = "BANINST1";
            String password = "m4nt4";
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conec =(Connection)DriverManager.getConnection("jdbc:oracle:thin:@"+server+':'+port+':'+database, user, password);
        }
        catch(Exception ex)
        {
        }*/
            request.setCharacterEncoding("UTF-8");
            //String query=request.getParameter("query"); //para probar
            //String tabla = request.getParameter("tabla");
            //String columna = request.getParameter("columna"); 
            String sql = request.getParameter("query");
            //ResultSet rs5 = co.prepareStatement(query).executeQuery();
            ResultSet rs5 = co2.prepareStatement(sql).executeQuery();
            while (rs5.next()) {
                String valor = rs5.getString(1);
                ListaDatos.add(valor);
            }
            rs5.close();
            try {
                int cod = listaP.getLast().getCodigo_formulario();
                int codg = listaP.getLast().getCodigo_grupo();
                int codp = listaP.getLast().getCodigo_preguntas();
                int codval = ListaVal.getLast().getCodigo_Valores() + 1;
                for (int i = 0; i < ListaDatos.size(); i++) {
                    PreparedStatement ps1 = co.prepareStatement("INSERT INTO UTIC.UZGTVALORES(codigo_UZGTVALORES,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS,"
                            + "UZGTTIPOPREGUNTAS_valor)"
                            + " VALUES (?,?,?,?,?)");
                    java.util.Date date = new java.util.Date();
                    long t = date.getTime();
                    java.sql.Date sqlDate = new java.sql.Date(t);
                    ps1.setInt(1, codval);
                    ps1.setInt(2, cod);
                    ps1.setInt(3, codg);
                    ps1.setInt(4, codp);
                    ps1.setString(5, ListaDatos.get(i).toUpperCase());
                    ps1.executeUpdate();
                    // ps1.setInt(1,codval);
                    codval++;
                    ps1.close();
                    codval++;

                }
                con.closeConexion();
                con2.closeConexion();
        %>
        <script type="text/javascript">
            window.location = "pregunta.jsp";
        </script>
        <%
            } catch (Exception ex) {
                out.println(ex);
            }
        %>
    </body>
</html>
