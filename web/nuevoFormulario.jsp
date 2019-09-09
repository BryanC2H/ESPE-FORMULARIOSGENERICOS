<%-- 
    Document   : nuevoFormulario
    Created on : 11-ago-2016, 12:04:01
    Author     : david
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="espe.edu.ec.models.Formulario"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="espe.edu.ec.models.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->
<!DOCTYPE html>
<% Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser")); //Recibe el atributo de sesion del Servlet
/*Si el atributo es diferente de nulo muestra la pagina */if (currentUser!=null){ %>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Nuevo Formulario</title>
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
        <% 
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
            while(rs.next())
            {
                Formulario F = new Formulario();
                F.setCodigo_formulario(rs.getInt(1));
                F.setNombre_formulario(rs.getString(2));
                F.setDescripcion_formulario(rs.getString(3));
                F.setFecha_formulario(rs.getDate(4));
                F.setObjetivo_formulario(rs.getString(5));
                F.setBase_formulario(rs.getString(6));
                listaF.add(F);
            }
            rs.close();
        %>
        <div class="row bg-default">
            <!--<div class="col-md-2"><center><img src="espelogo.jpg"/></center></div>-->
            <div class="col-md-8"><center><h1>Servicios</h1></center></div>
            <div class="col-md-2"></div>
        </div>
            <ul class="nav nav-tabs" role="tablist">
               
                <li role="presentation"><a href="NewForm.jsp">Finalizar Formulario</a></li>

            </ul>
        <%
            
            int cod =0;
            if(listaF.isEmpty()){
                cod=1;
            }else{
                cod = listaF.getLast().getCodigo_formulario()+1;
            }
            request.setCharacterEncoding("UTF-8");

            String nombreF= request.getParameter("nombre");            
            String descripcionF = request.getParameter("descripcion");
            String objetivoF = request.getParameter("objetivo");
            String Base = request.getParameter("seleccion");
            String tipoFormulario=request.getParameter("seleccionTipo");
            
            Date Fecha = new Date();
            java.sql.Date FechaSql = new java.sql.Date(Fecha.getYear(),Fecha.getMonth(),Fecha.getDate());
            
            try
            {
                PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTFORMULARIOS (codigo_UZGTFORMULARIOS,UZGTFORMULARIOS_nombre,UZGTFORMULARIOS_descripcion"
                        + ",UZGTFORMULARIOS_FECHA,UZGTFORMULARIOS_objetivo,UZGTFORMULARIOS_base_datos, UZGTFORMULARIOS_FECHA_INICIO, UZGTFORMULARIOS_FECHA_FIN, UZGTFORMULARIOS_ESTADO, UZGTFORMULARIOS_EO, UZGTFORMULARIOS_ESTADO_LLENADO)"
                        + " VALUES (?,?,?,?,?,?,?,?,?,?,?)");
                ps.setInt(1, cod);
                ps.setString(2,nombreF);
                ps.setString(3, descripcionF);
                ps.setString(5, objetivoF);
                ps.setDate(4,FechaSql);
                ps.setString(6, Base);
                ps.setString(7, null);
                ps.setString(8, null);
                ps.setInt(9, 0);
                ps.setInt(10, 0);
                ps.setString(11, tipoFormulario);
                ps.executeUpdate();               
        %>    
        <script type="text/javascript">
        window.location="Html/nuevoGrupo.html";
        </script>
        <%
            }
            catch (Exception ex)
            {
                out.println(ex);
            }
           con.closeConexion();
    %>
    </body>
</html>
<% }
                   else{        
                  
                  %>
                  
  <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet"></link>
        <title>No Autorizado</title>
    </head>
    <body>
	<%             try {

        %>
        <ul class="nav nav-tabs" role="tablist">
             
          
                    
            <div class="col-md-4">Error! Usuario no autorizado</div>

                    
                </form>
                
                
            </ul>
 <%             } catch (Exception e) {
            System.out.println("error." + e.getMessage());

        }
    %>
    </body>
</html>
                  
                  
                  
                  <% } %>
