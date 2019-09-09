<%-- 
    Document   : nuevaMatriz
    Created on : 09/09/2016, 12:24:46 PM
    Author     : Jorge
--%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page import="espe.edu.ec.util.TipoPreguntas"%>
<%@page import="espe.edu.ec.models.Preguntas"%>
<%@page import="espe.edu.ec.models.Grupo"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page import="espe.edu.ec.models.ParametrosBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
   
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
        <!AQUI SE TRAE LOS CODIGOS DE CADA GRUPO,PREGUNTA, ETC>
    <%      request.setCharacterEncoding("UTF-8");
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            String codigoTP=request.getParameter("tipo");
            LinkedList<Grupo> listaG = new LinkedList<Grupo>();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<Integer> ListaMatriz = new LinkedList<Integer>();
            LinkedList<Integer> ListaCabeceras = new LinkedList<Integer>();
            ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTGRUPO ORDER BY codigo_UZGTGRUPO ASC").executeQuery();
            while(rs2.next())
            {
                Grupo G = new Grupo();
                G.setCodigo_formulario(rs2.getInt(1));
                G.setCodigo_grupo(rs2.getInt(2));
                G.setNombre_grupo(rs2.getString(3));
                G.setDescripcion_grupo(rs2.getString(4));
                listaG.add(G);
            }
            rs2.close();
            rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTPREGUNTAS ORDER BY codigo_UZGTPREGUNTAS ASC").executeQuery();
            while(rs2.next())
            {
                Preguntas P = new Preguntas();
                P.setCodigo_formulario(rs2.getInt(1));
                P.setCodigo_grupo(rs2.getInt(2));
                P.setCodigo_preguntas(rs2.getInt(3));
                //P.setCodigo_formulario_anidado(rs3.getInt(4));
                //P.setCodigo_grupo_anidado(rs3.getInt(5));
                //P.setCodigo_pregunta_anidada(rs3.getInt(6));
                P.setCodigo_tipo_pregunta(rs2.getInt(7));
                P.setLabel_pregunta(rs2.getString(8));
                P.setVigente_pregunta(rs2.getString(9));
              
                listaP.add(P);                
            }
            rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ ORDER BY codigo_UZGTMATRIZ ASC").executeQuery();
            while(rs2.next())
            {
                int Mat = rs2.getInt(1);
                ListaMatriz.add(Mat);                
            }
            rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTCABECERAS ORDER BY codigo_UZGTCABEZERA ASC").executeQuery();
            while(rs2.next())
            {
                int Cab = rs2.getInt(1);
                ListaCabeceras.add(Cab);                
            }
            rs2.close();
            // <div align="center">
            //<input name="btnDibujar" class="btn btn-default" value="Generar Matriz" onclick="valMatriz(filas.value, columnas.value)"/>                        
            //</div>
     %>
        <div class="row bg-default">
            <!--<div class="col-md-2"><center><img src="espelogo.jpg"/></center></div>-->
            <div class="col-md-8"><center><h1>Servicios</h1></center></div>
            <div class="col-md-2"></div>
        </div>
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="pregunta.jsp">Nueva Pregunta</a></li>
                <li role="presentation"><a href="index.jsp">Volver</a></li>
            </ul>
    <!AQUI gUARDO>
    <%      request.setCharacterEncoding("UTF-8");
            int fila = Integer.parseInt(request.getParameter("filas"));
            int columna = Integer.parseInt(request.getParameter("columnas"));
            
            String Descripcion = request.getParameter("descripcion");
            int mat = 0;
            if(ListaMatriz.isEmpty()){
                mat = 1;
            }else{
            mat = ListaMatriz.getLast()+1;

            }
            //int cab = ListaCabeceras.getLast()+1;
            //int cod = listaG.getLast().getCodigo_formulario();
            //int codg = listaG.getLast().getCodigo_grupo();
            //int codp = listaP.getLast().getCodigo_preguntas();
            //int mat = 1;
            int cab = 1;
            int cod = listaG.getLast().getCodigo_formulario();
            int codg = listaG.getLast().getCodigo_grupo();
            int codp = listaP.getLast().getCodigo_preguntas();
            
            try{
                PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTMATRIZ (codigo_UZGTMATRIZ,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS,"
                        + "UZGTMATRIZ_columna,UZGTMATRIZ_fila,UZGTMATRIZ_descripcion)"
                        + " VALUES (?,?,?,?,?,?,?)");
		java.util.Date date = new java.util.Date();
            	long t = date.getTime();
            	java.sql.Date sqlDate = new java.sql.Date(t);
                ps.setInt(1,mat);
                ps.setInt(2,cod);
                ps.setInt(3,codg);
                ps.setInt(4,codp);
                ps.setInt(5,columna);
                ps.setInt(6,fila);
                ps.setString(7,Descripcion);
            	
                ps.executeUpdate();               
                ps.close();  
                con.closeConexion();
            }
            catch (Exception ex)
            {
                out.println(ex);
            } 
            con.closeConexion();
%>
    <script type="text/javascript">
        window.location="cabeceras.jsp";
    </script>
 <%             } catch (Exception e) {
            System.out.println("error." + e.getMessage());
        }
    %>
    </body>
</html>
