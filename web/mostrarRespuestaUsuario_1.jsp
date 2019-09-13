<%--
    Document   : mostrarFormularioUsuario
    Created on : 15/03/2018, 11:11:21
    Author     : DIEGOPC
--%>

<%@page import="espe.edu.ec.models.Respuestas"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="espe.edu.ec.models.Formulario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="espe.edu.ec.models.Usuario"%> <!-- import de Usuario -->
<%@page session="true" %> <!-- Se agrega a modo de validacion -->
<!DOCTYPE html>
<% Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser")); //Recibe el atributo de sesion del Servlet
/*Si el atributo es diferente de nulo muestra la pagina */if (currentUser!=null){ %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario-Formulario</title>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
       <div class="row bg-default">
           <!-- <div class="col-md-2"><center><img src="Logo_ESPE.png"  WIDTH="160" HEIGHT="100"/></center></div> -->
            <div class="col-md-8"><center><h1>Servicios</h1></center></div>
            <div class="col-md-2"></div>
        </div>
            <ul class="nav nav-tabs" role="tablist">
               <!-- <li role="presentation" ><a href="NewForm.jsp"><img src="n.png"/> Nuevo Formulario</a></li> 
                <li role="presentation"><a href="mostrarFormulario.jsp"><img src="m.png"/> Gestión Formulario</a></li>
                <li role="presentation"><a href="mostrarGRes.jsp><img src="pm.png"/> Formularios Publicados</a></li> -->
                <li role="presentation"><a href="mostrarRespuesta.jsp"><img src="Imagenes/a.png"/> Mostrar Respuestas</a></li>
                
               
            </ul>
    </head>
    <body>
        <%
            try{
            %>
        <%
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            LinkedList<Usuario> listaU = new LinkedList<Usuario>();
            LinkedList<Respuestas> listaR = new LinkedList<Respuestas>();
            String NombreF = request.getParameter("Submit");
            int Cod = Integer.parseInt(NombreF);
            ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS WHERE codigo_UZGTFORMULARIOS = '"+Cod+"'").executeQuery();
            while(rs.next())
            {
                Formulario F = new Formulario();
                F.setCodigo_formulario(rs.getInt(1));
                F.setNombre_formulario(rs.getString(2));
                F.setDescripcion_formulario(rs.getString(3));
                F.setFecha_formulario(rs.getDate(4));
                F.setObjetivo_formulario(rs.getString(5));
                F.setBase_formulario(rs.getString(6));
                F.setTipoFormulario(rs.getString(11));
                listaF.add(F);
            }
            rs.close();
            
            /*Recogo los pidm para mostrarlos segun su usuario*/
            ResultSet rs1 = co.prepareStatement("select * from UTIC.UZGTFORMULARIO_PERSONA P, SATURN.SPRIDEN S "
                    + "WHERE S.SPRIDEN_PIDM = P.SPRIDEN_PIDM "
                    + "AND S.SPRIDEN_CHANGE_IND IS NULL "
                    + "AND P.UZGTFORMULARIOS_ESTADO_LLENADO <> 'N' "
                    + "AND P.codigo_UZGTFORMULARIOS ='"+Cod+"'"
                    + "ORDER BY S.SPRIDEN_LAST_NAME").executeQuery();
            while(rs1.next())
            {
                Usuario usuario=new Usuario();
                
                
                usuario.setPIDM(rs1.getInt(1));
                usuario.setEstLn(rs1.getString(6)); 
                usuario.setIdEst(rs1.getString(8)); 
                usuario.setNombreUsuario(rs1.getString(9)+' '+rs1.getString(10)); 
                listaU.add(usuario);
                //JOptionPane.showMessageDialog(null, rs1.getInt(1));
            }
            rs1.close();
            rs1 = co.prepareStatement("SELECT UZGTRESPUESTAS_ITERACION FROM UTIC.UZGTRESPUESTAS WHERE CODIGO_UZGTFORMULARIOS="+Cod+" GROUP BY UZGTRESPUESTAS_ITERACION order by uzgtrespuestas_iteracion asc").executeQuery();
            while(rs1.next())
            {
                Respuestas res=new Respuestas();
                res.setIteracionRespuesta(rs1.getInt(1));
                listaR.add(res);
            }
            rs1.close();
            
            rs1.close();
            if(listaU.isEmpty())
            {
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<div class=\"col-md-6\"><center><h4 class=\"alert alert-info\">"+"No existen Pidms asignados a este formulario"+"</h4></center></div>");
                out.println("</div>");
            }
            else{
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase alert alert-info\">"+"Formulario: "+listaF.getFirst().getNombre_formulario()+"</h4></center></div>");
                out.println("</div>");
                out.print("<div class=\"row\">");
                out.print("<div class=\"col-md-1\"></div>");
               // out.print("<div class=\"col-md-2\"><p name=\"cod\">Codigo Formulario</p></div>");
               // out.print("<div class=\"col-md-2\"><p name=\"nombre\">Usuario</p></div>");
                out.print("<div class=\"col-md-2\"><p name=\"pidm\">PIDM</p></div>");
                out.print("<div class=\"col-md-2\"><p name=\"id\">ID</p></div>");
                out.print("<div class=\"col-md-4\"><p name=\"nombres\">Nombres</p></div>");
                out.print("<div class=\"col-md-2\">Opciones</div>");
                out.print("</div></form>");
                out.print("<hr>");
                /*muestro los codigo de formulario, el usuario y su "pidm"*/
        
        if(listaF.getFirst().getTipoFormulario().equals("N")||listaF.getFirst().getTipoFormulario().equals("M")){
            //out.print("<div class=\"col-md-2\"><input type=\"hidden\" name=\"iter\" value='"+listaR.getFirst().getIteracionRespuesta()+"' readonly></div>");
            for(int i=0; i<listaU.size(); i++)
            {
               
               // out.print("<form action=\"mostrarRespuestaUsuario_1.jsp\" method=\"POST\" target=\"_self\">");
                out.print("<form action=\"mostrarRespuestaUsuario.jsp\" method=\"POST\" target=\"_self\">");
                out.print("<div class=\"row\">");
                out.print("<div class=\"col-xs-1\"></div>");
                //out.print("<div class=\"col-md-2\"><input class=\"panel panel-info panel-heading\" size='6' type=\"text\" name=\"cod\" value='"+Cod+"' readonly></div>");
                //JOptionPane.showMessageDialog(null, "iteracion: "+listaR.getFirst().getIteracionRespuesta());
                //
                //out.print("<div class=\"col-md-3\"><input class=\"panel panel-info panel-heading\" size='6' type=\"text\" name=\"nombre\" value='Usuario' readonly></div>");
                out.print("<div class=\"col-xs-2\"><input type=\"text\" style='heigth : 1px' size='10' class=\"form-control input-sm\" name=\"pidm\" value='"+listaU.get(i).getPIDM()+"' readonly></div>");
                out.print("<div class=\"col-xs-2\"><input type=\"text\" style='heigth : 1px' size='10' class=\"form-control input-sm\" name=\"id\" value='"+listaU.get(i).getIdEst()+"' readonly></div>");
                out.print("<div class=\"col-xs-4\"><input type=\"text\" style='heigth : 1px' size='60' class=\"form-control input-sm\" name=\"nombres\" value='"+listaU.get(i).getNombreUsuario()+"' readonly></div>");
                out.print("<div class=\"col-xs-2\"><button class=\"btn btn-xs btn-primary\" type=\"text\" name=\"Submit\" value='"+Cod+"'>Ver</button>");
                out.print("<button class=\"btn btn-xs btn-danger\" type=\"text\" name=\"Borrar\" value='"+Cod+"'>Borrar</button></div>");
                out.print("</div></form>");
                //JOptionPane.showMessageDialog(null, listaU.get(i).getPIDM()+": "+listaU.size());
            }//cierra for para mostrar resultados
        }//cierre if modificable y no modificable
        if(listaF.getFirst().getTipoFormulario().equals("S"))
        {
            int aux=0;
            for(int i=0; i<listaR.size(); i++)
            {
                for(int j=0; j<listaU.size();j++){
                if(aux!=listaR.get(i).getIteracionRespuesta()){
                    if(listaU.get(j).getEstLn().equals("L"))
                    {
                      //  out.print("<form action=\"mostrarRespuestaUsuario_1.jsp\" method=\"POST\" target=\"_self\">");
                        out.print("<form action=\"mostrarRespuestaUsuario.jsp\" method=\"POST\" target=\"_self\">");
                        out.print("<div class=\"row\">");
                        out.print("<div class=\"col-md-2\"></div>");
                        //out.print("<div class=\"col-md-1\"><input type=\"text\" class=\"panel panel-info panel-heading\" name=\"cod\" value='"+Cod+"' readonly></div>");
                        out.print("<div class=\"col-md-1\"><input type=\"text\" class=\"panel panel-info panel-heading\" name=\"iter\" value='"+listaR.get(i).getIteracionRespuesta()+"' readonly></div>");
                        //out.print("<div class=\"col-md-3\"><input class=\"panel panel-info panel-heading\" size='20' type=\"text\" name=\"nombre\" value='Usuario' readonly></div>");
                        out.print("<div class=\"col-md-1\"><input type=\"text\" class=\"panel panel-info panel-heading\" name=\"pidm\" value='"+listaU.get(j).getPIDM()+"' readonly></div>");
                        out.print("<div class=\"col-md-1\"><input type=\"text\" class=\"panel panel-info panel-heading\" name=\"id\" value='"+listaU.get(j).getIdEst()+"' readonly></div>");
                        out.print("<div class=\"col-md-1\"><input type=\"text\" class=\"panel panel-info panel-heading\" name=\"nombres\" value='"+listaU.get(j).getNombreUsuario()+"' readonly></div>");
                        //out.print("<input type=\"hidden\"  name=\"pidm\" value='"+listaU.get(j).getPIDM()+"' readonly></div>");
                        out.print("<div class=\"col-md-3\"><button class=\"btn btn-default\" type=\"text\" name=\"Submit\" value='"+Cod+"'>Ver</button></div>");
                        out.print("<div class=\"col-md-4\"><button class=\"btn btn-default\" type=\"text\" name=\"Borrar\" value='"+Cod+"'>Borrar</button></div>");
                        out.print("</div></form>");
                        aux=listaR.get(i).getIteracionRespuesta();
                        
                    }//if llenados
                    
                    /*
                    else{
                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("<div class=\"col-md-6\"><center><h4 class=\"alert alert-info\">"+"No existen usuarios que hayan llenado este formulario"+"</h4></center></div>");
                        out.println("</div>");
                    }*/
                }
                }//cierre for lista pidm
            }//cierra for para mostrar resultados por iteracion
        }//cierre del else if secuencial
            }//cierre de lista usuario con elementos
            con.closeConexion();
        %>
        
                  <% }
catch(Exception e){
System.out.println("error." + e.getMessage());
}
                  
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
        <ul class="nav nav-tabs" role="tablist">
             
                

                    
            <div class="col-md-4">Error! Usuario no autorizado</div>

                    
                </form>
                
                
            </ul>
    </body>
</html>
                  
                  
                  
                  <% } 
                  
                  %>