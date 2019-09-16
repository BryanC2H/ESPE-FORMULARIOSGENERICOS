<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="espe.edu.ec.models.Usuario"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page import="espe.edu.ec.connection.DB2"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.Formulario"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.decrypt.DecryptSmAtrix"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="espe.edu.ec.models.Respuestas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page import="espe.edu.ec.util.FileUpload"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <title>Mostrar-Formularios</title>
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
            Cookie cookie = null;
            Cookie[] cookies = null;
            String pidm = null;
            String id = null;
            DecryptSmAtrix dec = new DecryptSmAtrix();
            int PIDMG = 0;
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
            PIDMG = Integer.parseInt(pidm);
            int PIDMget = PIDMG;
            try {
                if (id.length() > 0) {
                    DB2 conn = DB2.getInstancia();
                    Connection coo = conn.getConnection();
                    ResultSet res = coo.prepareStatement("SELECT DISTINCT SPRIDEN_PIDM as estPIDM FROM SPRIDEN WHERE SPRIDEN.SPRIDEN_ID = " + id + " AND SPRIDEN.SPRIDEN_CHANGE_IND IS NULL").executeQuery();
                    if (res.next()) {
                        PIDMget = res.getInt(1);
                    }
                    conn.closeConexion();
                } else {
                    PIDMget = Integer.parseInt(id);
                }
            } catch (Exception e) {
                //LOGGER.log(Level.WARNING, "MOSTRAR GRES ", e);

            }
        %>
    </head>
    <body>
        <% try {
        %>
        <p></p>
        <div class="container">
            <nav class="navbar navbar-default" role="tablist">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand"><b>Publicados</b> </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li role="presentation">
                            <a href="NewForm.jsp">
                                <i class="fas fa-">&#xf0fe</i>&nbsp<strong>Nuevo</strong></a>
                        </li>
                        <li role="presentation">
                            <a href="mostrarFormulario.jsp">
                                <i class="fas fa-tools"></i> Gestion</a>
                        </li>
                        <!--<li role="presentation">
                            <a href="mostrarGRes.jsp>
                                <i class="fas fa-chalkboard-teacher"></i> Publicados</a>
                        </li>-->
                        <li role="presentation">
                            <a href="mostrarRespuesta.jsp">
                                <i class="fas fa-file-archive"></i> Respuestas</a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a><% out.print(id);%></a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>
        </div>
        <!-- --------------------------------Fin Navbar superior-------------------------------------------  -->

        <div class="container">
        </center><div class="col-3 .col-md-7" align="center"><h5 class="text alert alert-success">Los formularios se pueden llenar una sola vez, después deberá guardar e imprimir inmediatamente, ya que luego no tendrá opción de cambiar o volver a imprimir.</h5></div></center>
</div>
</div>
<div class="container">
    <center><div class="col-3 .col-md-7"><h3 class="text alert alert-success">Formlarios Obligatorios</h3></div></center>
</div>
</div>   
<%    //FORMULARIOS OBLIGATORIOS
    DB con = DB.getInstancia();
    Connection co = con.getConnection();

    //Query para seleccionar los formularios Obligatorios
    LinkedList<Integer> codForms2 = new LinkedList<Integer>();
    ResultSet resu2 = co.prepareStatement("select p.codigo_uzgtformularios from UTIC.UZGTFORMULARIO_PERSONA p,UTIC.UZGTFORMULARIOS f where p.spriden_pidm =" + PIDMget + "and p.codigo_uzgtformularios = f.codigo_uzgtformularios and (  p.uzgtformularios_estado_llenado ='N' or f.uzgtformularios_estado_llenado ='S' or f.uzgtformularios_estado_llenado ='M' )  ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
    while (resu2.next()) {
        Integer codForm2 = resu2.getInt(1);
        codForms2.add(codForm2);
    }
    resu2.close();
//Query para mostrar los formularios obligatorios y publicados
    LinkedList<Formulario> listaF2 = new LinkedList<Formulario>();
    for (int i = 0; i < codForms2.size(); i++) {
        ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS where UZGTFORMULARIOS_ESTADO = 1 AND codigo_uzgtFormularios=" + codForms2.get(i) + " AND UZGTFORMULARIOS_EO = '1' ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
        while (rs2.next()) {
            Formulario F2 = new Formulario();
            F2.setCodigo_formulario(rs2.getInt(1));
            F2.setNombre_formulario(rs2.getString(2));
            F2.setDescripcion_formulario(rs2.getString(3));
            F2.setFecha_formulario(rs2.getDate(4));
            F2.setObjetivo_formulario(rs2.getString(5));
            F2.setBase_formulario(rs2.getString(6));
            F2.setTipoFormulario(rs2.getString(11));
            listaF2.add(F2);
        }
        rs2.close();
    }
    //Muestra los Formularios Obligatorios del Usuario
    for (int i = 0; i < listaF2.size(); i++) {
        if (codForms2.isEmpty()) {
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-3\"></div>");
            out.println("<div class=\"col-md-6\"><center><h5 class=\"alert alert-info\">" + "No tiene Formularios Obligatorios por llenar" + "</h5></center></div>");
            out.println("</div>");
        } else {
            String cod = "";
            out.print("<form action=\"mostrarForm.jsp\" method=\"POST\" target=\"_self\" style=\"display:inline;\">");
            out.print("<form action=\"mostrarForm.jsp\" method=\"POST\" target=\"_self\" style=\"display:inline;\">");
            out.print("<div class=\"row\">");
            out.print("<div class=\"col-md-4\"></div>");
            out.print("<div class=\"col-md-1\"><center><p id=\"cod\">" + listaF2.get(i).getCodigo_formulario() + "</p></center></div>");
            out.print("<div class=\"col-md-3\"><p name=\"nombre\">" + listaF2.get(i).getNombre_formulario() + "</p></div>");
            out.print("<input type=\"hidden\" name= \"param\" value=\"" + PIDMget + "\" >");
            out.print("<div class=\"col-md-1\"><button class=\"btn btn-outline-info\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Llenar\" \"type=\"text\" name=\"Submit\" onclick=\"this.form.action='mostrarForm.jsp';this.form.submit();\" value='" + cod + listaF2.get(i).getCodigo_formulario() + "'><i class=\"fas fa-\" style='font-size:20px'>	&#xf044;</i></button></div>");
            out.print("<div class=\"col-md-3\"></div>");
            out.print("</div></form>");
        }
    }
%>

<% //Muestra los Formularios llenados del Usuario
    LinkedList<Integer> codForms1 = new LinkedList<Integer>();
    ResultSet resu1 = co.prepareStatement("select p.codigo_uzgtformularios from UTIC.UZGTFORMULARIO_PERSONA p,UTIC.UZGTFORMULARIOS f where p.spriden_pidm =" + PIDMget + "and p.codigo_uzgtformularios = f.codigo_uzgtformularios and (  p.uzgtformularios_estado_llenado ='L' or f.uzgtformularios_estado_llenado ='S' or f.uzgtformularios_estado_llenado ='M' )  ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
    while (resu1.next()) {
        Integer codForm1 = resu1.getInt(1);
        codForms1.add(codForm1);
    }
    resu1.close();
//Muestra los Formularios llenados del Usuario
    LinkedList<Formulario> listaF1 = new LinkedList<Formulario>();
    for (int i = 0; i < codForms1.size(); i++) {
        ResultSet rs1 = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS where UZGTFORMULARIOS_ESTADO = 1 AND codigo_uzgtFormularios=" + codForms1.get(i) + " ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
        while (rs1.next()) {
            Formulario F1 = new Formulario();
            F1.setCodigo_formulario(rs1.getInt(1));
            F1.setNombre_formulario(rs1.getString(2));
            F1.setDescripcion_formulario(rs1.getString(3));
            F1.setFecha_formulario(rs1.getDate(4));
            F1.setObjetivo_formulario(rs1.getString(5));
            F1.setBase_formulario(rs1.getString(6));
            F1.setEstadoPublicacion(rs1.getInt(9));
            F1.setTipoFormulario(rs1.getString(11));
            listaF1.add(F1);
        }
        rs1.close();
    }
    //Muestra los Formularios por llenar del Usuario
    LinkedList<Integer> codForms = new LinkedList<Integer>();
    ResultSet resu = co.prepareStatement("select p.codigo_uzgtformularios from UTIC.UZGTFORMULARIO_PERSONA p,UTIC.UZGTFORMULARIOS f where f.UZGTFORMULARIOS_FECHA_FIN >= to_CHAR(current_Date, 'DD/MM/RRRR') AND p.spriden_pidm ='"+pidm+"' and p.codigo_uzgtformularios = f.codigo_uzgtformularios and p.uzgtformularios_estado_llenado ='N' ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
    while (resu.next()) {
        Integer codForm = resu.getInt(1);
        codForms.add(codForm);
    }
    resu.close();
    //Muestra los Formularios por llenar del Usuario
    LinkedList<Formulario> listaF = new LinkedList<Formulario>();
    for (int i = 0; i < codForms.size(); i++) {
        ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS where UZGTFORMULARIOS_ESTADO = 1 AND codigo_uzgtFormularios=" + codForms.get(i) + " ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
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
    }

    LinkedList<Integer> codForms3 = new LinkedList<Integer>();
    ResultSet resu3 = co.prepareStatement("select p.codigo_uzgtformularios from UTIC.UZGTFORMULARIOS f, UTIC.UZGTFORMULARIO_PERSONA p where p.codigo_uzgtformularios = f.codigo_uzgtformularios and f.UZGTFORMULARIOS_FECHA_FIN >= to_CHAR(current_Date, 'DD/MM/RRRR') and f.uzgtformularios_estado_llenado ='M' AND p.spriden_pidm ='" + PIDMget + "' ORDER BY codigo_UZGTFORMULARIOS ASC ").executeQuery();
    while (resu3.next()) {
        Integer codForm3 = resu3.getInt(1);
        codForms.add(codForm3);
    }
    resu.close();
    LinkedList<Formulario> listaF3 = new LinkedList<Formulario>();
    for (int i = 0; i < codForms3.size(); i++) {
        ResultSet rs3 = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS where UZGTFORMULARIOS_ESTADO = 1 AND codigo_uzgtFormularios=" + codForms.get(i) + " ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
        while (rs3.next()) {
            Formulario F3 = new Formulario();
            F3.setCodigo_formulario(rs3.getInt(1));
            F3.setNombre_formulario(rs3.getString(2));
            F3.setDescripcion_formulario(rs3.getString(3));
            F3.setFecha_formulario(rs3.getDate(4));
            F3.setObjetivo_formulario(rs3.getString(5));
            F3.setBase_formulario(rs3.getString(6));
            F3.setTipoFormulario(rs3.getString(11));
            listaF3.add(F3);
        }
        rs3.close();
    }
%>
<div class="container">
    <center><div class="col-3 .col-md-7"><h3 class="text alert alert-success">Formularios pendientes</h3></div></center>
</div>
</div> 
<center><div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-2"><p name="cod"><b>Código </b></p></div>
        <div class="col-md-2"><p name="nombre"><b>Nombre Formulario</b></p></div>
        <div class="col-md-2"><p name="pidm"><b>Acción</p></b></div>
        <div class="col-md-3"></div>
    </div></center>
<hr>

<%            //Muestra los Formularios por llenar del Usuario
    if (listaF.isEmpty()) {
        out.println("<div class=\"row\">");
        out.println("<div class=\"container-fluid\">");
        out.println("<center><div class=\"col-3 .col-md-7\"><h5 class=\"alert alert-success\">" + "No tiene Formularios por llenar" + "</h5></div></center>");
        out.println("</div>");
    } else {
        for (int i = 0; i < listaF.size(); i++) {

            String cod = "";
            out.print("<form action=\"mostrarForm.jsp\" method=\"POST\" target=\"_self\" style=\"display:inline;\">");
            out.print("<div class=\"row\">");
            out.print("<div class=\"col-md-4\"></div>");
            out.print("<td><div class=\"col-md-1\"><p id=\"cod\">" + listaF.get(i).getCodigo_formulario() + "</p></div>");
            out.print("<div class=\"col-md-3\" align=\"justify\"><p name=\"nombre\">" + listaF.get(i).getNombre_formulario() + "</p></div>");
            out.print("<input type=\"hidden\" name= \"param\" value=\"" + PIDMget + "\" >");
            out.print("<div class=\"col-md-1\"><button class=\"btn btn-info\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Llenar\" \"type=\"text\" name=\"Submit\" onclick=\"this.form.action='mostrarForm.jsp';this.form.submit();\" value='" + cod + listaF.get(i).getCodigo_formulario() + "'><i class=\"fas fa-\" style='font-size:20px'>	&#xf044;</i></button></div>");
            out.print("<div class=\"col-md-3\"></div>");
            out.print("</div></form>");

        }
    }
%>

<%
    for (int i = 0; i < listaF3.size(); i++) {
        String cod = "";
        out.print("<form action=\"mostrarForm.jsp\" method=\"POST\" target=\"_self\" style=\"display:inline;\">");
        out.print("<div class=\"row\">");
        out.print("<div class=\"col-md-4\"></div>");
        out.print("<div class=\"col-md-1\"><center><p id=\"cod\">" + listaF3.get(i).getCodigo_formulario() + "</p></center></div>");
        out.print("<div class=\"col-md-3\"><p name=\"nombre\">" + listaF3.get(i).getNombre_formulario() + "</p></div>");
        out.print("<input type=\"hidden\" name= \"param\" value=\"" + PIDMget + "\" >");
        out.print("<div class=\"col-md-1\"><button class=\"btn btn-info\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Llenar\" \"type=\"text\" name=\"Submit\" onclick=\"this.form.action='mostrarForm.jsp';this.form.submit();\" value='" + cod + listaF.get(i).getCodigo_formulario() + "'><i class=\"fas fa-\" style='font-size:20px'>	&#xf044;</i></button></div>");
        out.print("<div class=\"col-md-3\"></div>");
        out.print("</div></form>");
    }
%>


<p></p><div class="container">

    <center><div class="col-3 .col-md-7"><h3 class="text alert alert-success">Formularios Llenos.</h3></div></center>
</div>
</div>   
<%
    LinkedList<Formulario> listaF5 = new LinkedList<Formulario>();
    ResultSet rs5 = co.prepareStatement("SELECT DISTINCT F.CODIGO_UZGTFORMULARIOS, F.UZGTFORMULARIOS_NOMBRE FROM UTIC.UZGTFORMULARIOS F JOIN UTIC.UZGTFORMULARIO_PERSONA FP ON F.CODIGO_UZGTFORMULARIOS = FP.CODIGO_UZGTFORMULARIOS WHERE FP.UZGTFORMULARIOS_ESTADO_LLENADO ='L' AND FP.SPRIDEN_PIDM =" + PIDMget + " ORDER BY F.codigo_UZGTFORMULARIOS ASC").executeQuery();
    while (rs5.next()) {
        Formulario F5 = new Formulario();
        F5.setCodigo_formulario(rs5.getInt(1));
        F5.setNombre_formulario(rs5.getString(2));

        listaF5.add(F5);
    }
    rs5.close();
%>

<center><div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-2"><p name="cod"><b>Código </b></p></div>
        <div class="col-md-2"><p name="nombre"><b>Nombre Formulario</b></p></div>
        <div class="col-md-2"><p name="pidm"><b>Acción</p></b></div>
        <div class="col-md-3"></div>
    </div></center>
<hr>
<%
//Muestra los Formularios Llenados por el Usuario
    if (listaF5.isEmpty()) {

        out.println("<div class=\"col-md-3\"></div>");
        out.println("<center><div class=\"col-md-6\"><h5 class=\"alert alert-info\">" + "No tiene Formularios por llenar" + "</h5></div></center>");
        out.println("</div>");
    } else {
        for (int i = 0; i < listaF5.size(); i++) {

            String cod = "";
            out.print("<form action=\"\" method=\"POST\" target=\"_self\" style=\"display:inline;\">");
            out.println("</div>");
            out.print("<div class=\"row\">");
            out.print("<div class=\"col-md-4\"></div>");
            out.print("<div class=\"col-md-1\"><p id=\"cod\">" + listaF5.get(i).getCodigo_formulario() + "</p></div>");
            out.print("<div class=\"col-md-3\" align=\"justify\"><p name=\"nombre\">" + listaF5.get(i).getNombre_formulario() + "</p></div>");
            out.print("<div class=\"col-md-1\"><button class=\"btn btn-info\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Ver\" class=\"btn btn-default\" type=\"text\" name=\"Submit\" onclick=\"this.form.action='mostrarFormularioUsuario_1.jsp';this.form.submit();\" value='" + cod + listaF5.get(i).getCodigo_formulario() + "'><i class=\"fas fa-eye\" style='font-size:20px'></i></button></div>");
            out.print("<div class=\"col-md-3\"></div>");
            out.print("</div></form>");
        }
    }
    con.closeConexion();
%></table>

<%             } catch (Exception e) {
        System.out.println("error." + e.getMessage());

    }
%>
</body>
</html>


