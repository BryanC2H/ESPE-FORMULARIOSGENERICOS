<%@page import="espe.edu.ec.constant.ConstantesForm"%>
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
<%Cookie cookie = null;
    Cookie[] cookies = null;
    String pidm = null;
    String id = null;
    cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            if (cookie.getName().equals("pidm")) {
                pidm = cookie.getValue();
            } else if (cookie.getName().equals("id")) {
                id = cookie.getValue();
            }
        }
    } else {
        out.println("<h2>No cookies founds</h2>");
    }
    String currentUser = pidm;
    if (currentUser != null) { %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario-Formulario</title>
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>
    <div class="row bg-default">
        <div class="col-md-8"><center><h1>Formularios</h1></center></div>
        <div class="col-md-2"></div>
    </div>
    <ul class="nav nav-tabs" role="tablist">      
        <button align="center" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Volver"> <div class="col-md-3"><a href="GRes_Usuarios.jsp" ><i class='	fas fa-arrow-left' style='font-size:40px;color:white'></i></a></button>
    </ul>
</head>
<style>.navbar-custom {
        color: #58D68D;
        background-color: #239B56;
        border-color: #000
    }</style>
<body>

    <%
        DB con = DB.getInstancia();
        Connection co = con.getConnection();
        LinkedList<Formulario> listaF = new LinkedList<Formulario>();
        LinkedList<Usuario> listaU = new LinkedList<Usuario>();
        LinkedList<Respuestas> listaR = new LinkedList<Respuestas>();
        int Cod = 0;
        String NombreF = request.getParameter("Submit");
        if (NombreF != null) {
            Cod = Integer.parseInt(NombreF);
        }
        
        ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "'").executeQuery();
        while (rs.next()) {
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
                + "AND P.SPRIDEN_PIDM ='"+pidm+"'"
                + "AND S.SPRIDEN_CHANGE_IND IS NULL "
                + "AND P.UZGTFORMULARIOS_ESTADO_LLENADO <> 'N' "
                + "AND P.codigo_UZGTFORMULARIOS ='" + Cod + "'"
                + "ORDER BY S.SPRIDEN_LAST_NAME").executeQuery();
        while (rs1.next()) {
            Usuario usuario = new Usuario();
            usuario.setPIDM(rs1.getInt(1));
            usuario.setEstLn(rs1.getString(6));
            usuario.setIdEst(rs1.getString(8));
            usuario.setNombreUsuario(rs1.getString(9) + ' ' + rs1.getString(10));
            listaU.add(usuario);
            //JOptionPane.showMessageDialog(null, rs1.getInt(1));
        }

        rs1 = co.prepareStatement("SELECT UZGTRESPUESTAS_ITERACION FROM UTIC.UZGTRESPUESTAS WHERE CODIGO_UZGTFORMULARIOS=" + Cod + " GROUP BY UZGTRESPUESTAS_ITERACION order by uzgtrespuestas_iteracion asc").executeQuery();
        while (rs1.next()) {
            Respuestas res = new Respuestas();
            res.setIteracionRespuesta(rs1.getInt(1));
            listaR.add(res);
        }
        rs1.close();
        if (listaU.isEmpty()) {
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-3\"></div>");
            out.println("<div class=\"col-md-6\"><center><h4 class=\"alert alert-success\">" + "No existen Pidms asignados a este formulario" + "</h4></center></div>");
            out.println("</div>");
        } else {
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-3\"></div>");
            out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase alert alert-success\">" + "Formulario: " + listaF.getFirst().getNombre_formulario() + "</h4></center></div>");
            out.println("</div>");
            out.print("<div class=\"row\">");
            out.print("<div class=\"col-md-3\"></div>");
            out.print("<div class=\"col-md-1\"><p name=\"pidm\">PIDM</p></div>");
            out.print("<div class=\"col-md-1\"><p name=\"id\">ID</p></div>");
            out.print("<div class=\"col-md-3\"><p name=\"nombres\">Nombres</p></div>");
            out.print("<div class=\"col-md-1\">Opciones</div>");
            out.print("</div></form>");
            out.print("<hr>");
            /*muestro los codigo de formulario, el usuario y su "pidm"*/

            if (listaF.getFirst().getTipoFormulario().equals("N") || listaF.getFirst().getTipoFormulario().equals("M")) {
                //out.print("<div class=\"col-md-2\"><input type=\"hidden\" name=\"iter\" value='"+listaR.getFirst().getIteracionRespuesta()+"' readonly></div>");
                for (int i = 0; i < listaU.size(); i++) {

                    // out.print("<form action=\"mostrarRespuestaUsuario_1.jsp\" method=\"POST\" target=\"_self\">");
                    out.print("<form action=\"mostrarRespuestaUsuario_1.jsp\" method=\"POST\" target=\"_self\">");
                    out.print("<div class=\"row\">");
                    out.print("<div class=\"col-xs-3\"></div>");
                    //out.print("<div class=\"col-md-2\"><input class=\"panel panel-info panel-heading\" size='6' type=\"text\" name=\"cod\" value='"+Cod+"' readonly></div>");
                    //JOptionPane.showMessageDialog(null, "iteracion: "+listaR.getFirst().getIteracionRespuesta());
                    //
                    //out.print("<div class=\"col-md-3\"><input class=\"panel panel-info panel-heading\" size='6' type=\"text\" name=\"nombre\" value='Usuario' readonly></div>");
                    out.print("<div class=\"col-xs-1\"><input type=\"text\" style='heigth : 1px' size='10' class=\"form-control input-sm\" name=\"pidm\" value='" + listaU.get(i).getPIDM() + "' readonly></div>");
                    out.print("<div class=\"col-xs-1\"><input type=\"text\" style='heigth : 1px' size='10' class=\"form-control input-sm\" name=\"id\" value='" + listaU.get(i).getIdEst() + "' readonly></div>");
                    out.print("<div class=\"col-xs-3\"><input type=\"text\" style='heigth : 1px' size='60' class=\"form-control input-sm\" name=\"nombres\" value='" + listaU.get(i).getNombreUsuario() + "' readonly></div>");
                    out.print("<div class=\"col-xs-2\"><button class=\"btn btn-info\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Ver \" class=\"btn btn-xs btn-info\" type=\"text\" name=\"Submit\" value='" + Cod + "'><i class=\"fas fa-eye\" style='font-size:20px'></i></button>");
                    out.print("<button class=\"btn btn-danger\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Borrar\" class=\"btn btn-xs btn-danger\" type=\"text\" name=\"Borrar\" value='" + Cod + "'><i class=\"fas fa-trash\" style='font-size:20px'></i></button></div>");
                    out.print("</div></form>");
                    //JOptionPane.showMessageDialog(null, listaU.get(i).getPIDM()+": "+listaU.size());
                }//cierra for para mostrar resultados
            }//cierre if modificable y no modificable
            if (listaF.getFirst().getTipoFormulario().equals("S")) {
                int aux = 0;
                for (int i = 0; i < listaR.size(); i++) {
                    for (int j = 0; j < listaU.size(); j++) {
                        if (aux != listaR.get(i).getIteracionRespuesta()) {
                            if (listaU.get(j).getEstLn().equals("L")) {
                                // out.print("<form action=\"mostrarRespuestaUsuario_1.jsp\" method=\"POST\" target=\"_self\">");
                                out.print("<form action=\"mostrarRespuestaUsuario_1.jsp\" method=\"POST\" target=\"_self\">");
                                out.print("<div class=\"row\">");
                                out.print("<div class=\"col-md-3\"></div>");
                                //out.print("<div class=\"col-md-2\"><input class=\"panel panel-info panel-heading\" size='6' type=\"text\" name=\"cod\" value='"+Cod+"' readonly></div>");
                                //JOptionPane.showMessageDialog(null, "iteracion: "+listaR.getFirst().getIteracionRespuesta());
                                //
                                //out.print("<div class=\"col-md-3\"><input class=\"panel panel-info panel-heading\" size='6' type=\"text\" name=\"nombre\" value='Usuario' readonly></div>");
                                out.print("<div class=\"col-md-1\"><input type=\"text\" style='heigth : 1px' size='5' class=\"form-control input-sm\" name=\"pidm\" value='" + listaU.get(j).getPIDM() + "' readonly></div>");
                                out.print("<div class=\"col-md-1\"><input type=\"text\" style='heigth : 1px' size='10' class=\"form-control input-sm\" name=\"id\" value='" + listaU.get(j).getIdEst() + "' readonly></div>");
                                out.print("<div class=\"col-md-3\"><input type=\"text\" style='heigth : 1px' size='10' class=\"form-control input-sm\" name=\"nombres\" value='" + listaU.get(j).getNombreUsuario() + "' readonly></div>");
                                out.print("<div class=\"col-md-2\"><button class=\"btn btn-info\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Ver \" class=\"btn btn-xs btn-info\" type=\"text\" name=\"Submit\" value='" + Cod + "'><i class=\"fas fa-eye\" style='font-size:20px'></i></button>");
                                out.print("<button class=\"btn btn-danger\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Borrar \" class=\"btn btn-xs btn-info\" type=\"text\" name=\"Borrar\" value='" + Cod + "'><i class=\"fas fa-trash\" style='font-size:20px'></i></button>");
                                out.print("</div>");
                                out.print("</div></form>");
                                aux = listaR.get(i).getIteracionRespuesta();

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
</body>
</html>
<% } else {

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