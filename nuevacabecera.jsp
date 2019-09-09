<%-- 
    Document   : nuevacabecera
    Created on : 16-oct-2016, 18:49:16
    Author     : david
--%>

<%@page import="FORM.Cabecera"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Matriz"%>
<%@page import="java.sql.Connection"%>
<%@page import="FORM.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cabecera-Formularios</title>
    </head>
    <body>
<%@page import="org.apache.log4j.Logger"%>
        <%! static Logger logger = Logger.getLogger("bitacora.subnivel.Control");%>
        <%logger.info("esta es la prueba."); %>
        <%logger.debug("Demostracion del mensaje");%>
        <%logger.warn("Show WARN message");%>
        <%logger.error("Show ERROR message");%>
        <%logger.fatal("Show FATAL message"); %>
<%             try{
    

        %>
        <% request.setCharacterEncoding("UTF-8");
 	    java.util.Date date = new java.util.Date();
            long t = date.getTime();
            java.sql.Date sqlDate = new java.sql.Date(t);

            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            String codigoTP=request.getParameter("tipo");
            LinkedList<Matriz> ListaMatriz = new LinkedList<Matriz>();
            LinkedList<Cabecera> ListaCabeceras = new LinkedList<Cabecera>();            
            ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ ORDER BY codigo_UZGTMATRIZ ASC").executeQuery();
            while(rs2.next())
            {
                Matriz Mat = new Matriz(rs2.getInt(1),rs2.getInt(2),rs2.getInt(3),rs2.getInt(4),rs2.getInt(5),rs2.getInt(6),rs2.getString(7));
                ListaMatriz.add(Mat);                
            }
            rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTCABECERAS ORDER BY codigo_UZGTCABEZERA ASC").executeQuery();
            while(rs2.next())
            {
                Cabecera Cab = new Cabecera(rs2.getInt(1),rs2.getInt(2),rs2.getString(3),rs2.getInt(4),rs2.getInt(5));
                ListaCabeceras.add(Cab);                
            }
            rs2.close();
            int cab =0;
            if(ListaCabeceras.isEmpty()){
            cab=1;
            }else{
                cab = ListaCabeceras.getLast().getCodigo_cabecera()+1;
            } 
            int mat = ListaMatriz.getLast().getCodigo_matriz();
            int columna = 0;
            int fila = 0;
            for(int i=0; i<ListaMatriz.getLast().getColumna();i++)
            {
                String cabecera = request.getParameter("V"+i);
                columna = i+1;
                try{
                PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTCABECERAS (codigo_UZGTCABEZERA,codigo_UZGTMATRIZ,UZGTCABECERAS_valor,"
                        + "UZGTCABECERA_POSICIONX,UZGTCABECERA_POSICIONY)"
                        + " VALUES (?,?,?,?,?)");
                ps.setInt(1,cab);
                ps.setInt(2,mat);
                ps.setString(3,cabecera);
                ps.setInt(4,fila);
                ps.setInt(5,columna);
                ps.executeUpdate();               
                ps.close();        
                
            }
            catch (Exception ex)
            {
                out.println(ex);
            }   
                cab++;
            }
            columna =0;
            for(int i=0; i<ListaMatriz.getLast().getFila();i++)
            {
                String cabecera = request.getParameter("H"+i);
                fila = i+1;
                 try{
                PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTCABECERAS (codigo_UZGTCABEZERA,codigo_UZGTMATRIZ,UZGTCABECERAS_valor,"
                        + "UZGTCABECERA_POSICIONX,UZGTCABECERA_POSICIONY)"
                        + " VALUES (?,?,?,?,?)");
                ps.setInt(1,cab);
                ps.setInt(2,mat);
                ps.setString(3,cabecera);
                ps.setInt(4,fila);
                ps.setInt(5,columna);
                ps.executeUpdate();               
                ps.close();        
                
            }
            catch (Exception ex)
            {
                out.println(ex);
            }   
                cab++;
            }
            con.closeConexion();
            %>
            <script type="text/javascript">
                window.location="pregunta.jsp";
            </script>
            <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
