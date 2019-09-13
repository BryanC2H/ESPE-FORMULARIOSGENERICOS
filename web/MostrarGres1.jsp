<%-- 
    Document   : mostrarFormulario
    Created on : 14-ene-2018, 21:55:20
    Author     : D4ve
--%>

<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="FORM.Usuario"%>
<%@page import="FORM.DB2"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Formulario"%>
<%@page import="FORM.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="Decrypt.DecryptSmAtrix"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="FORM.Respuestas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FORM.Valores"%>
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
        %>

        <%
            Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser"));
            Logger LOGGER = Logger.getLogger("bitacora.subnivel.Control");
            // int PIDMget = 0;

            int PIDMget = 2401;

            //int PIDMget = 348249;
            //int PIDMget = 7683;
            String param = "bccd67a1d7973a4109ab65c82680c115";

            try {
                DecryptSmAtrix dec = new DecryptSmAtrix();
                String id = request.getParameter("param");
                //String id = "L00347668";
                //String id = "L00368786";

                LOGGER.log(Level.INFO, "MOSTRAR GRES ID: ", id);
                if (id.length() > 0) {
                    //JOptionPane.showMessageDialog(null, "entro al if");   
                    id = new String(dec.decrypt(id));

                    LOGGER.log(Level.INFO, "MOSTRAR GRES ID: ", id);
                    DB2 conn = DB2.getInstancia();
                    Connection coo = conn.getConnection();

                    // JOptionPane.showMessageDialog(null, "PIDM: "+user.getPIDM());
                    ResultSet res = coo.prepareStatement("SELECT DISTINCT SPRIDEN_PIDM as estPIDM FROM SPRIDEN WHERE SPRIDEN.SPRIDEN_ID = '" + id + "' AND SPRIDEN.SPRIDEN_CHANGE_IND IS NULL").executeQuery();
                    LOGGER.log(Level.INFO, "MOSTRAR GRES res: ", res);
                    if (res.next()) {
                        LOGGER.log(Level.INFO, "MOSTRAR GRES res: ", res);
                        PIDMget = res.getInt(1);
                    }
                    conn.closeConexion();
                } else {

                    PIDMget = currentUser.getPIDM();
                    LOGGER.log(Level.INFO, "MOSTRAR GRES PIDMget:  ", PIDMget);

                }
            } catch (Exception e) {
                LOGGER.log(Level.WARNING, "MOSTRAR GRES ", e);

            }

            // JOptionPane.showMessageDialog(null, "PIDM: "+PIDMget);
        %>
    </head>
    <body>
        <%LOGGER.info("esta es la prueba."); %>

        <%
            try {
        %>
        <style>.navbar-custom {
                color: #58D68D;
                background-color: #239B56 ;
                border-color: #000
            }</style>

        </br></br></br>

        <ul class="nav nav-tabs " role="tablist" >
            <%        out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\"  href=\"NewForm.jsp\"><i class=\"fas fa-\" style='font-size:24px'>&#xf0fe;</i><strong> Nuevo </strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\" href=\" mostrarFormulario.jsp\"><i class=\"fas fa-tools\" style='font-size:24px'></i><strong> Gestión </strong></a></li>");
                //out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white;\" href=\"mostrarGRes.jsp\"null\"\"><i class=\"fas fa-chalkboard-teacher\" style='font-size:24px'></i>&nbsp<strong>Publicados</strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white ;\" href=\"mostrarRespuesta.jsp\"><i class=\"fas fa-\" style='font-size:24px'>&#xf15c;</i><strong> Respuestas</strong></a></li></br>");
            %>
        </ul>


        <div class="container-fluid">
        </center><div class="col-md-6 offset-md-3" align="center"><h5 class="text alert alert-success">Los formularios se pueden llenar una sola vez, después deberá guardar e imprimir inmediatamente, ya que luego no tendrá opción de cambiar o volver a imprimir.</h5></div></center>
</div> </br>

<div class="container-fluid">
    <center><div class="col-3 .col-md-7"><h3 class="text alert alert-success">Formularios Obligatorios</h3></div></center>
</div>

<%  DB con = DB.getInstancia();
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
            listaF2.add(F2);
        }
        rs2.close();
    }
    //Muestra los Formularios Obligatorios del Usuario
    for (int i = 0; i < listaF2.size(); i++) {
        String cod = "";
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
%>
<div class="container-fluid">
    <center><div class="col-3 .col-md-7"><h3 class="text alert alert-success">Formularios por Llenar</h3></div></center>
</div>


<div class="container">
    <center><table id="example" class="table table-striped table-bordered" style="width:100%">
            <thead>
                <tr >
                    <th class="text-center">CODIGO</th>
                    <th class="text-center">NOMBRE</th>
                    <th class="text-center">OPCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%
                    //Muestra los Formularios por llenar del Usuario
                    LinkedList<Integer> codForms = new LinkedList<Integer>();
                    ResultSet resu = co.prepareStatement("select p.codigo_uzgtformularios from UTIC.UZGTFORMULARIO_PERSONA p,UTIC.UZGTFORMULARIOS f where f.UZGTFORMULARIOS_FECHA_FIN >= to_CHAR(current_Date, 'DD/MM/RRRR') AND p.spriden_pidm =" + PIDMget + "and p.codigo_uzgtformularios = f.codigo_uzgtformularios and ( p.uzgtformularios_estado_llenado ='N' or f.uzgtformularios_estado_llenado ='S' or f.uzgtformularios_estado_llenado ='M' )  ORDER BY codigo_UZGTFORMULARIOS ASC").executeQuery();
                    while (resu.next()) {
                        Integer codForm = resu.getInt(1);
                        codForms.add(codForm);
                    }
                    resu.close();
                    //Muestra los Formularios por llenar del Usuario
                    LinkedList<Formulario> listaF = new LinkedList<Formulario>();
                    for (int i = 0; i < codForms.size(); i++) {
                        PreparedStatement st;
                        ResultSet ts;
                        st = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS where UZGTFORMULARIOS_ESTADO = 1 AND codigo_uzgtFormularios=" + codForms.get(i) + " ORDER BY codigo_UZGTFORMULARIOS ASC");
                        ts = st.executeQuery();

                        while (ts.next()) {
                %>
                <tr>
                    <td class="text-center"><%= ts.getInt("CODIGO_UZGTFORMULARIOS")%> </td>
                    <td class="text-center"><%= ts.getString("UZGTFORMULARIOS_NOMBRE")%> </td>
                    <td>
                        <div class="btn-toolbar text-center" role="toolbar">
                            <div class="row">
                                <div class="col-md-2 center-block"></div>
                                <div class="btn-group col-md-8">
                                    <button type="button" class="btn btn-default">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </button>                             
                                </div>
                                <div class="col-md-4 center-block"></div>
                            </div>
                        </div>
                    </td>
                </tr>
                <% }
                        ts.close();
                    }
                    con.closeConexion();
                %>
            </tbody>
        </table>
    </center>
</div>
<%             } catch (Exception e) {
        System.out.println("error." + e.getMessage());

    }
%>
</body>
</html>


