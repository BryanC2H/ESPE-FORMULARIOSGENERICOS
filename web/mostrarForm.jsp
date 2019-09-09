<%-- 
Document   : mostrar
Created on : 14-ene-2018, 12:10:38
Author     : Gabii
--%>


<%@page import="espe.edu.ec.connection.DB2"%>
<%@page import="espe.edu.ec.models.datoComun"%>
<%@page import="espe.edu.ec.models.Usuario"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="espe.edu.ec.models.Respuestas"%>
<%@page import="espe.edu.ec.models.FormPersona"%>
<%@page import="espe.edu.ec.models.Cabecera"%>
<%@page import="espe.edu.ec.models.Matriz"%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page import="espe.edu.ec.util.TipoPreguntas"%>
<%@page import="espe.edu.ec.models.Preguntas"%>
<%@page import="espe.edu.ec.models.Grupo"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="espe.edu.ec.models.Formulario"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Llenar Formulario</title>
        <link href="css/bootstrap3.min.css" rel="stylesheet"/>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


        <%
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            DB2 con2 = DB2.getInstancia();
            Connection co2 = con2.getConnection();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            LinkedList<Grupo> listaG = new LinkedList<Grupo>();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<Valores> listaV = new LinkedList<Valores>();
            LinkedList<Respuestas> listaR = new LinkedList<Respuestas>();
            String NombreF = request.getParameter("Submit");

            /*DATOS COMUNES*/
            LinkedList<datoComun> listaDC = new LinkedList<datoComun>();
            LinkedList<String> valoresDC = new LinkedList<String>();
            /////////////////////////////////////////////////////////////////////

            //JOptionPane.showConfirmDialog(null, pidm);
            //int pidm= Integer.parseInt(request.getParameter("param"));
            //Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser"));
            //int pidm= currentUser.getPIDM();
            Usuario currentUser = (Usuario) (session.getAttribute("currentSessionUser"));
            int pidm = 0;

            /*if (currentUser != null) {
                pidm = currentUser.getPIDM();
            } else {
                currentUser = (Usuario) (session.getAttribute("userSessionUser"));
                pidm = currentUser.getPIDM();
            } */
            pidm = 2401;
            //pidm = 348249;
            //pidm = 7683;

            int Cod = Integer.parseInt(NombreF);

            ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "'").executeQuery();
            try {
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
                rs = co.prepareStatement("SELECT * FROM UTIC.UZGTGRUPO WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' order by codigo_UZGTGRUPO ASC").executeQuery();
                while (rs.next()) {
                    Grupo G = new Grupo();
                    G.setCodigo_formulario(rs.getInt(1));
                    G.setCodigo_grupo(rs.getInt(2));
                    G.setNombre_grupo(rs.getString(3));
                    G.setDescripcion_grupo(rs.getString(4));
                    listaG.add(G);
                }
                rs.close();
                rs = co.prepareStatement("SELECT * FROM UTIC.UZGTPREGUNTAS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' order by codigo_UZGTPREGUNTAS ASC").executeQuery();
                while (rs.next()) {
                    Preguntas P = new Preguntas();
                    P.setCodigo_formulario(rs.getInt(1));
                    P.setCodigo_grupo(rs.getInt(2));
                    P.setCodigo_preguntas(rs.getInt(3));
                    P.setCodigo_tipo_pregunta(rs.getInt(7));
                    P.setLabel_pregunta(rs.getString(8));
                    listaP.add(P);
                }
                rs.close();
                rs = co.prepareStatement("SELECT * FROM UTIC.UZGTVALORES WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' order by codigo_UZGTVALORES").executeQuery();
                while (rs.next()) {
                    Valores Val = new Valores();
                    Val.setCodigo_Valores(rs.getInt(1));
                    Val.setCodig_Formularios(rs.getInt(2));
                    Val.setCodigo_Grupo(rs.getInt(3));
                    Val.setCodigo_Preguntas(rs.getInt(4));
                    Val.setValores(rs.getString(5));
                    listaV.add(Val);
                }
                rs.close();
                /*DATOS COMUNES*/
                ResultSet rs1 = co.prepareStatement("SELECT * FROM UTIC.UZGTDATOSCOMUNES ORDER BY codigo_UZGTDATOSCOMUNES").executeQuery();
                while (rs1.next()) {
                    datoComun DC = new datoComun();
                    DC.setEtiqueta(rs1.getString(2));
                    DC.setQuery(rs1.getString(3));
                    listaDC.add(DC);
                }
                rs1.close();
            } catch (Exception e) {
                System.out.println("Hubo un error");
            }
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
            try {

        %>
        <div class="row bg-default">
            <div class="col-md-2"><center><img src="Imagenes/espelogo.jpg"/></center></div>
            <div class="col-md-2"></div>
        </div>

        <ul class="nav nav-tabs" role="tablist">
            <%--<li role="presentation"><a  href="mostrarGRes.jsp" >Volver</a></li>--%>

            <li class="col-md-1" align="center"><button align="center" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Volver"><a href="mostrarGRes.jsp?param="><i class='fas fa-arrow-left' style='font-size:40px;color:white'></i></a></button><li>
                <br>
        </ul>

        <script type="text/javascript">
            function info() {
                pulsado = document.elegir.color;
                for (i = 0; i < pulsado.length; i++) {
                    valor = pulsado[i].checked;
                    if (valor === true) {
                        elegido = pulsado[i].value;
                    }
                }
                cambio = document.getElementById("parrafo");
                cambio.style.color = elegido;
            }
            function validarNumero()
            {
                numero1 = document.elegir.num1.value;
                numero2 = document.elegir.num2.value;
                numero3 = document.elegir.num3.value;
                numero4 = document.elegir.num4.value;
                if (isNaN(numero1) || isNaN(numero2) || isNaN(numero3) || isNaN(numero4))
                {
                    alert("Debe ingresar valores numericos");
                }
            }


            function nombre(fic) {
                fic = fic.split('\\');
                var name = fic[fic.length - 1];
                // alert(fic[fic.length-1]);
                document.getElementById('fileN').value = '' + name;
            }
        </script>


        <div class="container">
            <%                /*if en caso de ser no modificable o secuencial*/
                if (listaF.getFirst().getTipoFormulario().equals("N") || listaF.getFirst().getTipoFormulario().equals("S")) {
            %>
            <form name="elegir1"  method="POST" action="uploadServlet" enctype="multipart/form-data">
                <%
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase\">" + listaF.getFirst().getNombre_formulario() + "</h4></center></div>");

                    out.println("</div>");
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-7\"><center><h5 class=\"text-success text-uppercase\">" + " *" + listaF.getFirst().getDescripcion_formulario() + "</h5></center></div>");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("</div>");
                    int numT = 0;
                    int numC = 0;
                    int numR = 0;
                    int numL = 0;
                    int numFech = 0;
                    int numN = 0;
                    int numA = 0;
                    int numM = 0;
                    int contRM = 1;
                    int numDC = 0;
                    for (int i = 0; i < listaG.size(); i++) {

                        out.println("<br>");
                        out.println("<div class=\"row \">");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("<div class=\"col-md-7 panel panel-info panel-heading\"><center><h4 class=\"panel-title\">" + listaG.get(i).getNombre_grupo() + "</h4></center></div>");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("</div>");
                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("<div class=\"col-md-6\"><center><h5 class=\"text-success text-uppercase\">" + " *" + listaG.get(i).getDescripcion_grupo() + "</h5><center></div>");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("</div>");

                        for (int j = 0; j < listaP.size(); j++) {
                            if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\"><h4>" + listaP.get(j).getLabel_pregunta() + "</h4></div>");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("</div>");

                                //////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////DATO COMUN//////////////////////////////////
                                /////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 9) {
                                    numDC++;
                                    //JOptionPane.showMessageDialog(null, "QUERY: " +listaDC.getFirst().getQuery()+ " PIDM: "+ pidm  + "NUEVO VALOR: "+nuevo);
                                    String dato = "";
                                    //JOptionPane.showMessageDialog(null, "listaValores " + listaV.size());

                                    for (int cont1 = 0; cont1 < listaDC.size(); cont1++) {
                                        for (int dc = 0; dc < listaV.size(); dc++) {
                                            if (listaV.get(dc).getValores().equals(listaDC.get(cont1).getEtiqueta()) && listaV.get(dc).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                                //JOptionPane.showMessageDialog(null, "ETIQUETA: " + listaDC.get(cont1).getEtiqueta() + " VALOR:"+ listaV.get(dc).getValores()+" Contador " + dc);
                                                String valquery = listaDC.get(cont1).getQuery();
                                                String nuevo = valquery.replace(":PAR_PIDM", "" + pidm);
                                                ResultSet rs2 = co2.prepareStatement(nuevo).executeQuery();
                                                while (rs2.next()) {
                                                    dato = rs2.getString(1);
                                                    valoresDC.add(dato);
                                                }
                                                rs2.close();
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("<div class=\"col-md-7 col-md-offset-3\"><input id=\"valor\" type=\"text\" name =\"text" + numDC + "\" value=\"" + dato + "\" class=\"form-control\" readonly/></div>");
                                                out.println("</div><br><br>");
                                                //JOptionPane.showMessageDialog(null, "Valor " +numDC);
                                            }
                                        }
                                    }

                                }

                                //////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////TIPO TEXTO//////////////////////////////////
                                /////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {
                                    numT++;
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-7 col-md-offset-3\"><input id=\"valor\" type=\"text\" name=\"valor" + numT + "\" class=\"form-control\"/></div>");
                                    //
                                    out.println("</div>");
                                }

                                if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                    numC++;
                                    out.println("</div>");
                                    for (int k = 0; k < listaV.size(); k++) {
                                        if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-3\"><label><input type=\"checkbox\" name=\"seleccion" + numC + "\" value=\"" + listaV.get(k).getValores() + "\"> " + listaV.get(k).getValores() + "</input></label></div>");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("</div>");
                                        }
                                    }
                                }
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                    numR++;
                                    out.println("</div>");
                                    for (int k = 0; k < listaV.size(); k++) {

                                        if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-3\"><input type=\"radio\" name=\"radio" + numR + "\" value=\"" + listaV.get(k).getValores() + "\"> " + listaV.get(k).getValores() + "</input></div>");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("</div>");
                                        }
                                    }
                                }
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                    numL++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-3\"><select type=\"text\" name=\"lista" + numL + "\">");
                                    for (int k = 0; k < listaV.size(); k++) {
                                        if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                            out.println("<option>" + listaV.get(k).getValores() + "</option>");

                                        }
                                    }
                                    out.println("</select></div>");
                                    out.println("</div>");
                                }
                                ////////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////Guardar Archivo/////////////////////////////////
                                ////////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 6) {
                                    numA++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<span class=\"btn btn-success btn-file\" ><input  type=\"file\"  name=\"archivo" + numA + "\" id= \"fileName\" onchange=\"nombre(this.value)\" /></span>");
                                    out.println("<input  type=\"hidden\" name=\"fileN\" id=\"fileN\" />");
                                    // out.println("<button type=\"button\"  name=\"bt\" onclick=\"alerta()\"/>");
                                    //   out.println("<progress id=\"progressBar\" value=\"0\" max=\"100\" style=\"width:300px;\"></progress>");
                                    //  out.println("<h3 id=\"status\"></h3>");
                                    //out.println("<p id=\"loaded_n_total\"></p>");
                                    out.println("</div><br>");
                                    //out.println("</div>");
                                }
                                ////////////////////////////////////////////////////////////////////////////////
                                ////////////////////////TIPO DATE///////////////////////////////////////////////
                                ////////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 7) {
                                    numFech++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-3\"><label for=\"fechaInicio\" class=\"sr-only\">fechaInicio</label><input id=\"fechaInicio" + numFech + "\" type=\"date\" name=\"fechaInicio" + numFech + "\" class=\"form-control\" placeholder=\"fechaInicio\" required/></div>");
                                    out.println("</div><br>");
                                    //out.println("</div>");
                                }
                                ///////////////////////////////////////////////////////////////////////////////
                                //////////////////////Tipo Numerico////////////////////////////////////////////
                                ///////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 8) {
                                    numN++;
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-7 col-md-offset-3\"><input id=\"valor\" type=\"number\" onblur=\"validarNumero()\" name=\"num" + numN + "\" class=\"form-control\"/></div>");
                                    out.println("</div>");
                                }

                                ////////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 4) {

                                    numM++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ WHERE codigo_UZGTPREGUNTAS = '" + listaP.get(j).getCodigo_preguntas() + "'order by codigo_uzgtmatriz ASC").executeQuery();
                                    LinkedList<Matriz> ListaMatriz = new LinkedList<Matriz>();
                                    LinkedList<Cabecera> ListaCabeceras = new LinkedList<Cabecera>();
                                    while (rs2.next()) {
                                        Matriz Mat = new Matriz(rs2.getInt(1), rs2.getInt(2), rs2.getInt(3), rs2.getInt(4), rs2.getInt(5), rs2.getInt(6), rs2.getString(7));
                                        ListaMatriz.add(Mat);
                                    }
                                    rs2.close();
                                    int mat = ListaMatriz.getFirst().getCodigo_matriz();
                                    int filas = ListaMatriz.getFirst().getFila() + 1;
                                    int columnas = ListaMatriz.getFirst().getColumna() + 1;
                                    ResultSet rs3 = co.prepareStatement("SELECT * FROM UTIC.UZGTCABECERAS WHERE codigo_UZGTMATRIZ = '" + mat + "' order by codigo_uzgtcabezera ASC").executeQuery();
                                    while (rs3.next()) {
                                        Cabecera Cab = new Cabecera(rs3.getInt(1), rs3.getInt(2), rs3.getString(3), rs3.getInt(4), rs3.getInt(5));
                                        ListaCabeceras.add(Cab);
                                    }
                                    rs3.close();

                                    out.println("<div class=\"col-md-6 table-responsive\"><table class=\"table table-bordered\" name=\"matriz" + numM + "\">");
                                    //JOptionPane.showMessageDialog(null, numM);
                                    int puntero = 0;

                                    for (int n = 0; n < filas; n++) {
                                        out.println("<tr>");
                                        for (int m = 0; m < columnas; m++) {

                                            if (puntero < ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX() == n && ListaCabeceras.get(puntero).getPosicionY() == m) {
                                                out.println("<th>" + ListaCabeceras.get(puntero).getValor_cabecera() + "</th>");
                                                puntero++;
                                            } else {
                                                if (n == 0 && m == 0) {
                                                    out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Item\"' disabled></td>");
                                                } else {
                                                    //JOptionPane.showMessageDialog(null, request.getParameter("Texto"+contRM));
                                                    out.println("<td><input type=\"text\" name=\"Texto" + contRM + "\" placeholder=\"Texto\"'></td>");
                                                    contRM++;
                                                }
                                            }
                                        }
                                        out.println("</tr>");
                                    }
                                    out.println("</table></div>");
                                    out.println("</div>");
                                }//FIN IF MATRIZ
                            }
                        }
                    }

                    out.println("<div class=\"row\">");
                    out.println("<br><div class=\"col-md-4\"></div>");
                    out.print("<input type=\"hidden\" name= \"param\" value=\"" + pidm + "\" >");

                    out.println("<div class=\"col-md-4\"><center><button class=\"btn btn-success\" type=\"text\" name=\"Submit\" value='" + Cod + "' >Guardar</button></center></div>");
                    out.println("</div><br>");
                %>
            </form>
            <%
            } else {//else en caso de ser modificable
                FormPersona fp = new FormPersona();
                //  int pidm=66;
                ResultSet rse = co.prepareStatement("select * from uzgtrespuestas where codigo_uzgtformularios=" + Cod + " and spriden_pidm=" + pidm).executeQuery();
                while (rse.next()) {

                    fp.setCodFormP(rse.getInt(2));
                }
                rse.close();
                rs = co.prepareStatement("select * from uzgtrespuestas where codigo_UZGTFORMULARIOS=" + Cod + " and codigo_uzgtformularios_persona=" + fp.getCodFormP() + " and spriden_pidm=" + pidm + " and uzgtrespuestas_iteracion=0 order by codigo_uzgtrespuestas asc").executeQuery();
                while (rs.next()) {
                    Respuestas res = new Respuestas();
                    res.setPidm_usuario(pidm);
                    res.setCodigo_persona(rs.getInt(2));
                    res.setCodigo_formulario(rs.getInt(3));
                    res.setCodigo_grupo(rs.getInt(4));
                    res.setCodigo_preguntas(rs.getInt(5));
                    res.setCodigo_Respuestas(rs.getInt(6));
                    res.setValor_Respuestas(rs.getString(7));
                    listaR.add(res);
                }
                rs.close();%>
            <%
                /*if en caso que este vacio el formulario*/
                if (listaR.isEmpty()) {
            %>
            <form name="elegir"  method="POST" action="uploadServlet" enctype="multipart/form-data">
                <%
                    out.print("<div class=\"container\">");
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase\">" + listaF.getFirst().getNombre_formulario() + "</h4></center></div>");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("</div>");
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6\"><h5 class=\"text-success text-uppercase\">" + " *" + listaF.getFirst().getDescripcion_formulario() + "</h5></div>");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("</div>");
                    int numT = 0;
                    int numC = 0;
                    int numR = 0;
                    int numL = 0;
                    int numFech = 0;
                    int numN = 0;
                    int numA = 0;
                    int numM = 0;
                    int contRM = 1;
                    int numDC = 0;
                    for (int i = 0; i < listaG.size(); i++) {

                        out.println("<div class=\"row \">");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("<div class=\"col-md-6 panel panel-info panel-heading\"><center><h4 class=\"panel-title\">" + listaG.get(i).getNombre_grupo() + "</h4></center></div>");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("</div>");
                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("<div class=\"col-md-6\"><h5 class=\"text-success text-uppercase\">" + " *" + listaG.get(i).getDescripcion_grupo() + "</h5></div>");
                        out.println("</div>");

                        for (int j = 0; j < listaP.size(); j++) {
                            if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\"><h4>" + listaP.get(j).getLabel_pregunta() + "</h4></div>");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("</div>");
                                //////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////TIPO TEXTO//////////////////////////////////
                                /////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 9) {
                                    numDC++;
                                    //JOptionPane.showMessageDialog(null, "QUERY: " +listaDC.getFirst().getQuery()+ " PIDM: "+ pidm  + "NUEVO VALOR: "+nuevo);
                                    String dato = "";
                                    //JOptionPane.showMessageDialog(null, "listaValores " + listaV.size());

                                    for (int cont1 = 0; cont1 < listaDC.size(); cont1++) {
                                        for (int dc = 0; dc < listaV.size(); dc++) {
                                            if (listaV.get(dc).getValores().equals(listaDC.get(cont1).getEtiqueta()) && listaV.get(dc).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas() && listaV.get(dc).getCodigo_Grupo() == listaP.get(j).getCodigo_grupo()) {
                                                //JOptionPane.showMessageDialog(null, "ETIQUETA: " + listaDC.get(cont1).getEtiqueta() + " VALOR:"+ listaV.get(dc).getValores()+" Contador " + dc);
                                                String valquery = listaDC.get(cont1).getQuery();
                                                String nuevo = valquery.replace(":PAR_PIDM", "" + pidm);
                                                ResultSet rs2 = co2.prepareStatement(nuevo).executeQuery();
                                                while (rs2.next()) {
                                                    dato = rs2.getString(1);
                                                    valoresDC.add(dato);
                                                    cont1 = 0;
                                                }
                                                rs2.close();
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("<div class=\"col-md-6 col-md-offset-3\"><input id=\"valor\" type=\"text\" name =\"text" + numDC + "\" value=\"" + dato + "\" class=\"form-control\" readonly/></div>");
                                                out.println("</div>");
                                                //JOptionPane.showMessageDialog(null, "Valor " +numDC);
                                            }
                                        }

                                    }

                                }
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {
                                    numT++;
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-6 col-md-offset-3\"><input id=\"valor\" type=\"text\" name=\"valor" + numT + "\" class=\"form-control\"/></div>");
                                    out.println("</div>");
                                }

                                if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                    numC++;
                                    out.println("</div>");
                                    for (int k = 0; k < listaV.size(); k++) {
                                        if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-3\"><label><input type=\"checkbox\" name=\"seleccion" + numC + "\" value=\"" + listaV.get(k).getValores() + "\"> " + listaV.get(k).getValores() + "</input></label></div>");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("</div>");
                                        }
                                    }
                                }
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                    numR++;
                                    out.println("</div>");
                                    for (int k = 0; k < listaV.size(); k++) {

                                        if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-3\"><input type=\"radio\" name=\"radio" + numR + "\" value=\"" + listaV.get(k).getValores() + "\"> " + listaV.get(k).getValores() + "</input></div>");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("</div>");
                                        }
                                    }
                                }
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                    numL++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-3\"><select type=\"text\" name=\"lista" + numL + "\">");
                                    for (int k = 0; k < listaV.size(); k++) {
                                        if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                            out.println("<option>" + listaV.get(k).getValores() + "</option>");

                                        }
                                    }
                                    out.println("</select></div>");
                                    out.println("</div>");
                                }
                                ////////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////Guardar Archivo/////////////////////////////////
                                ////////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 6) {
                                    numA++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<span class=\"btn btn-default btn-file\" ><input  type=\"file\"  name=\"archivo" + numA + "\" id= \"fileName\" onchange=\"nombre(this.value)\" /></span>");
                                    out.println("<input  type=\"hidden\" name=\"fileN\" id=\"fileN\" />");
                                    // out.println("<button type=\"button\"  name=\"bt\" onclick=\"alerta()\"/>");
                                    //   out.println("<progress id=\"progressBar\" value=\"0\" max=\"100\" style=\"width:300px;\"></progress>");
                                    //  out.println("<h3 id=\"status\"></h3>");
                                    //out.println("<p id=\"loaded_n_total\"></p>");
                                    out.println("</div><br>");
                                    //out.println("</div>");
                                }
                                ////////////////////////////////////////////////////////////////////////////////
                                ////////////////////////TIPO DATE///////////////////////////////////////////////
                                ////////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 7) {
                                    numFech++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-3\"><label for=\"fechaInicio\" class=\"sr-only\">fechaInicio</label><input id=\"fechaInicio" + numFech + "\" type=\"date\" name=\"fechaInicio" + numFech + "\" class=\"form-control\" placeholder=\"fechaInicio\" required/></div>");
                                    out.println("</div><br>");
                                    //out.println("</div>");
                                }
                                ///////////////////////////////////////////////////////////////////////////////
                                //////////////////////Tipo Numerico////////////////////////////////////////////
                                ///////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 8) {
                                    numN++;
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-6 col-md-offset-3\"><input id=\"valor\" type=\"number\" onblur=\"validarNumero()\" name=\"num" + numN + "\" class=\"form-control\"/></div>");
                                    out.println("</div>");
                                }
                                ////////////////////////////////////////////////////////////////////////////////
                                //JOptionPane.showMessageDialog(null,"ENTRA EN EL MODIFICABLE" );
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 4) {

                                    numM++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ WHERE codigo_UZGTPREGUNTAS = '" + listaP.get(j).getCodigo_preguntas() + "'order by codigo_uzgtmatriz ASC").executeQuery();
                                    LinkedList<Matriz> ListaMatriz = new LinkedList<Matriz>();
                                    LinkedList<Cabecera> ListaCabeceras = new LinkedList<Cabecera>();
                                    while (rs2.next()) {
                                        Matriz Mat = new Matriz(rs2.getInt(1), rs2.getInt(2), rs2.getInt(3), rs2.getInt(4), rs2.getInt(5), rs2.getInt(6), rs2.getString(7));
                                        ListaMatriz.add(Mat);
                                    }
                                    rs2.close();
                                    int mat = ListaMatriz.getFirst().getCodigo_matriz();
                                    int filas = ListaMatriz.getFirst().getFila() + 1;
                                    int columnas = ListaMatriz.getFirst().getColumna() + 1;
                                    ResultSet rs3 = co.prepareStatement("SELECT * FROM UTIC.UZGTCABECERAS WHERE codigo_UZGTMATRIZ = '" + mat + "' order by codigo_uzgtcabezera ASC").executeQuery();
                                    while (rs3.next()) {
                                        Cabecera Cab = new Cabecera(rs3.getInt(1), rs3.getInt(2), rs3.getString(3), rs3.getInt(4), rs3.getInt(5));
                                        ListaCabeceras.add(Cab);
                                    }
                                    rs3.close();

                                    out.println("<div class=\"col-md-6 table-responsive\"><table class=\"table table-bordered\" name=\"matriz" + numM + "\">");
                                    //JOptionPane.showMessageDialog(null, numM);
                                    int puntero = 0;

                                    for (int n = 0; n < filas; n++) {
                                        out.println("<tr>");
                                        for (int m = 0; m < columnas; m++) {
                                            if (puntero < ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX() == n && ListaCabeceras.get(puntero).getPosicionY() == m) {
                                                //JOptionPane.showConfirmDialog(null, "Cabeceras" + ListaCabeceras.get(puntero).getValor_cabecera());
                                                out.println("<th>" + ListaCabeceras.get(puntero).getValor_cabecera() + "</th>");
                                                puntero++;
                                            } else {
                                                if (n == 0 && m == 0) {
                                                    out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Item\"' disabled></td>");
                                                } else {
                                                    //JOptionPane.showMessageDialog(null, request.getParameter("Texto"+contRM));
                                                    out.println("<td><input type=\"text\" name=\"Texto" + contRM + "\" placeholder=\"Texto\"'></td>");
                                                    contRM++;
                                                }
                                            }
                                        }
                                        out.println("</tr>");
                                    }
                                    out.println("</table></div>");
                                    out.println("</div>");
                                }//FIN IF MATRIZ
                            }
                        }
                    }

                    out.println("<div class=\"row\">");
                    out.println("<br><div class=\"col-md-4\"></div>");
                    out.print("<input type=\"hidden\" name= \"param\" value=\"" + pidm + "\" >");

                    out.println("<div class=\"col-md-4\"><center><button class=\"btn btn-default\" type=\"text\" name=\"Submit\" value='" + Cod + "'  >Guardar</button></center></div>");
                    out.println("</div>");
                %>
            </form> 
            <%
            } else {//cuando existen respuestas por parte del usuario
                //JOptionPane.showMessageDialog(null, "Entra cuando existen ya respuestas");
                ///////////////////////para mostrar respuestas en caso que existan 
            %>
            <form action="" method="POST" name="modifcar" target="_self">
                <%
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");

                    out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase\">" + listaF.getFirst().getNombre_formulario() + "</h4></center></div>");
                    out.println("</div>");
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6\"><h5 class=\"text-success text-uppercase\">" + " *" + listaF.getFirst().getDescripcion_formulario() + "</h5></div>");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("</div>");
                    int numT1 = 0;
                    int numC1 = 0;
                    int numR1 = 0;
                    int numL1 = 0;
                    int numFech1 = 0;
                    int numN1 = 0;
                    int numA = 0;
                    int numM = 0;
                    int contRM = 0;
                    int codR = 0;
                    int numDC = 0;
                    /////
                    int contRes = 0;
                    for (int i = 0; i < listaG.size(); i++) {
                        out.println("<div class=\"row \">");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("<div class=\"col-md-6 panel panel-info panel-heading\"><center><h4 class=\"panel-title\">" + listaG.get(i).getNombre_grupo() + "</h4></center></div>");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("</div>");
                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("<div class=\"col-md-6\"><h5 class=\"text-success text-uppercase\">" + " *" + listaG.get(i).getDescripcion_grupo() + "</h5></div>");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("</div>");

                        for (int j = 0; j < listaP.size(); j++) {
                            if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\"><h4>" + listaP.get(j).getLabel_pregunta() + "</h4></div>");
                                int codP = listaP.get(j).getCodigo_preguntas();
                                //////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////TIPO TEXTO//////////////////////////////////
                                /////////////////////////////////////////////////////////////////////////////
                                //for(int r=0;r<listaR.size();r++)
                                //{
                                //if(listaR.get(r).getCodigo_preguntas()==listaP.get(j).getCodigo_preguntas()){  
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 9) {
                                    numDC++;
                                    //JOptionPane.showMessageDialog(null, "QUERY: " +listaDC.getFirst().getQuery()+ " PIDM: "+ pidm  + "NUEVO VALOR: "+nuevo);
                                    String dato = "";
                                    //JOptionPane.showMessageDialog(null, "listaValores " + listaV.size());
                                    for (int cont1 = 0; cont1 < listaDC.size(); cont1++) {
                                        for (int dc = 0; dc < listaV.size(); dc++) {
                                            if (listaV.get(dc).getValores().equals(listaDC.get(cont1).getEtiqueta()) && listaV.get(dc).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas() && listaV.get(dc).getCodigo_Grupo() == listaP.get(j).getCodigo_grupo()) {
                                                //JOptionPane.showMessageDialog(null, "ETIQUETA: " + listaDC.get(cont1).getEtiqueta() + " VALOR:"+ listaV.get(dc).getValores()+" Contador " + dc);
                                                String valquery = listaDC.get(cont1).getQuery();
                                                String nuevo = valquery.replace(":PAR_PIDM", "" + pidm);
                                                ResultSet rs2 = co2.prepareStatement(nuevo).executeQuery();
                                                while (rs2.next()) {
                                                    dato = rs2.getString(1);
                                                    valoresDC.add(dato);
                                                    cont1 = 0;
                                                }
                                                rs2.close();
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("<div class=\"col-md-6 col-md-offset-3\"><input id=\"valor\" type=\"text\" name =\"text" + numDC + "\" value=\"" + dato + "\" class=\"form-control\" readonly/></div>");
                                                out.println("</div>");
                                                //JOptionPane.showMessageDialog(null, "Valor " +numDC);
                                            }
                                        }

                                    }
                                    codR++;
                                }
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {

                                    numT1++;
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<input class=\"col-md-6 col-md-offset-3 panel panel-info panel-heading\" name=\"text" + numT1 + "\" type=\"text\" value='" + listaR.get(codR).getValor_Respuestas() + "'>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    //JOptionPane.showMessageDialog(null, "Nombre: text"+numT1+"valor aqui: "+listaR.get(codR).getValor_Respuestas());
                                    //JOptionPane.showMessageDialog(null, "Codigo Respuesta t: "+codR);
                                    codR++;
                                }

                                if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {

                                    numC1++;
                                    //codR=17;
                                    int contC = 0;
                                    //JOptionPane.showMessageDialog(null, "Entra en tipo checkbox ");
                                    /*
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<input class=\"col-md-6 panel panel-info panel-heading\" name=\"rad"+numR1+"\" type=\"text\" value='"+listaR.get(j).getValor_Respuestas()+"'>");
                                out.println("</div>");*/
                                    contRes = listaR.get(codR).getCodigo_preguntas();
                                    for (int k = 0; k < listaV.size(); k++) {

                                        if (listaV.get(k).getCodigo_Preguntas() == listaR.get(codR).getCodigo_preguntas()) {

                                            //recorrer lista de respuestas
                                            //JOptionPane.showMessageDialog(null, "valor respuesta: "+listaR.get(codR).getValor_Respuestas()+" valor valores: "+listaV.get(k).getValores());
                                            if (listaV.get(k).getValores().equals(listaR.get(codR).getValor_Respuestas())) {
                                                out.println("<div class=\"row\">");
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("<div class=\"col-md-6 col-md-offset-3\"><input type=\"checkbox\" name=\"check" + numC1 + "\" checked>" + listaV.get(k).getValores() + "</input></div>");
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("</div>");
                                                codR++;
                                            } else {
                                                out.println("<div class=\"row\">");
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("<div class=\"col-md-6 col-md-offset-3\"><input type=\"checkbox\" name=\"check" + numC1 + "\">" + listaV.get(k).getValores() + "</input></div>");
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("</div>");
                                            }

                                        }

                                        contRes++;
                                    }
                                    //codR++;
                                }//cierre del combobox
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                    numR1++;

                                    /*
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<input class=\"col-md-6 panel panel-info panel-heading\" name=\"rad"+numR1+"\" type=\"text\" value='"+listaR.get(j).getValor_Respuestas()+"'>");
                                out.println("</div>");*/
                                    //contRes=listaR.get(r).getCodigo_Respuestas();
                                    for (int k = 0; k < listaV.size(); k++) {
                                        if (listaV.get(k).getCodigo_Preguntas() == listaR.get(codR).getCodigo_preguntas()) {
                                            //recorrer lista de respuestas
                                            //JOptionPane.showMessageDialog(null, "codigo resp: "+codR+" valor respuesta: "+listaR.get(codR).getValor_Respuestas()+" valor valores: "+listaV.get(k).getValores());
                                            //JOptionPane.showMessageDialog(null, "Nombre: "+"radio"+numR1);
                                            if (listaV.get(k).getValores().equals(listaR.get(codR).getValor_Respuestas())) {
                                                //JOptionPane.showMessageDialog(null, "Entra en igualdad");
                                                out.println("<div class=\"row\">");
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("<div class=\"col-md-6 col-md-offset-3\"><input type=\"radio\" name=\"radio" + numR1 + "\" value=\"" + listaV.get(k).getValores() + "\" checked>" + listaV.get(k).getValores() + "</input></div>");
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("</div>");

                                            } else {
                                                out.println("<div class=\"row\">");
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("<div class=\"col-md-6 col-md-offset-3\"><input type=\"radio\" name=\"radio" + numR1 + "\" value=\"" + listaV.get(k).getValores() + "\" >" + listaV.get(k).getValores() + "</input></div>");
                                                out.println("<div class=\"col-md-3\"></div>");
                                                out.println("</div>");
                                            }

                                        }
                                        contRes++;
                                    }

                                    codR++;

                                }
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {

                                    numL1++;
                                    //out.print("</div>");
                                    out.print("<div class='row'>");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"col-md-6 col-md-offset-3\"><select type=\"text\" name=\"lista" + numL1 + "\">");
                                    for (int k = 0; k < listaV.size(); k++) {
                                        if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                            if (listaV.get(k).getValores().equals(listaR.get(codR).getValor_Respuestas())) {
                                                out.println("<option selected>" + listaV.get(k).getValores() + "</option>");
                                            }
                                            out.println("<option>" + listaV.get(k).getValores() + "</option>");

                                        }
                                    }
                                    out.println("</select></div>");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("</div>");
                                    //out.println("</div>");
                                    codR++;
                                }
                                ////////////////////////////////////////////////////////////////////////////////
                                ////////////////////////////////Guardar Archivo/////////////////////////////////
                                ////////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 6) {
                                    numA++;

                                    out.println("<form name = \"asd\" action=\"downloadFileServlet\" method=\"POST\" >");
                                    out.println("<input type=\"hidden\" name=\"codigo\" value=\"" + Cod + "\">");
                                    out.println("<input type=\"hidden\" name=\"codForm\" value=\"" + fp.getCodFormP() + "\">");
                                    out.println("<input type=\"hidden\" name=\"pidm\" value=\"" + pidm + "\">");
                                    out.println("<input type=\"hidden\" name=\"pregunta\" value=\"" + listaP.get(j).getCodigo_preguntas() + "\">");
                                    out.println("<div ><center><button class=\"btn btn-default\"type=\"submit\" name=\"archivo\">Descargar</button></center></div>");
                                    out.println("</form>");
                                    //out.println("</div>");
                                    codR++;
                                }
                                ////////////////////////////////////////////////////////////////////////////////
                                ////////////////////////TIPO DATE///////////////////////////////////////////////
                                ////////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 7) {

                                    numFech1++;
                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<input class=\"col-md-6 panel panel-info panel-heading\" name=\"fech" + numFech1 + "\" type=\"text\" value='" + listaR.get(codR).getValor_Respuestas() + "'>");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("</div><br>");
                                    codR++;
                                    //out.println("</div>");
                                }
                                ///////////////////////////////////////////////////////////////////////////////
                                //////////////////////Tipo Numerico////////////////////////////////////////////
                                ///////////////////////////////////////////////////////////////////////////////
                                if (listaP.get(j).getCodigo_tipo_pregunta() == 8) {

                                    numN1++;
                                    out.println("<div class=\"col-md-3\"></div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-6 col-md-offset-3\"><input id=\"valor\" type=\"number\" name=\"num" + numN1 + "\" class=\"form-control\" value='" + listaR.get(codR).getValor_Respuestas() + "'/></div>");
                                    out.println("</div>");
                                    out.println("</div>");
                                    //JOptionPane.showMessageDialog(null, "Nombre: num"+numN1+"valor aqui: "+listaR.get(codR).getValor_Respuestas());
                                    //JOptionPane.showMessageDialog(null, "Codigo Respuesta n: "+codR);
                                    codR++;
                                }
                                ////////////////////////////////////////////////////////////////////////////////

                                if (listaP.get(j).getCodigo_tipo_pregunta() == 4) {

                                    out.println("</div>");
                                    out.println("<div class=\"row\">");
                                    out.println("<div class=\"col-md-3\"></div>");
                                    ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ WHERE codigo_UZGTPREGUNTAS = '" + listaP.get(j).getCodigo_preguntas() + "'order by codigo_uzgtmatriz ASC").executeQuery();
                                    LinkedList<Matriz> ListaMatriz = new LinkedList<Matriz>();
                                    LinkedList<Cabecera> ListaCabeceras = new LinkedList<Cabecera>();
                                    while (rs2.next()) {
                                        Matriz Mat = new Matriz(rs2.getInt(1), rs2.getInt(2), rs2.getInt(3), rs2.getInt(4), rs2.getInt(5), rs2.getInt(6), rs2.getString(7));
                                        ListaMatriz.add(Mat);
                                    }
                                    rs2.close();
                                    int mat = ListaMatriz.getFirst().getCodigo_matriz();
                                    int filas = ListaMatriz.getFirst().getFila() + 1;
                                    int columnas = ListaMatriz.getFirst().getColumna() + 1;
                                    ResultSet rs3 = co.prepareStatement("SELECT * FROM UTIC.UZGTCABECERAS WHERE codigo_UZGTMATRIZ = '" + mat + "' order by codigo_uzgtcabezera ASC").executeQuery();
                                    while (rs3.next()) {
                                        Cabecera Cab = new Cabecera(rs3.getInt(1), rs3.getInt(2), rs3.getString(3), rs3.getInt(4), rs3.getInt(5));
                                        ListaCabeceras.add(Cab);
                                    }
                                    rs3.close();
                                    out.println("<div class=\"col-md-6 table-responsive\"><table class=\"table table-bordered\">");
                                    int puntero = 0;
                                    for (int n = 0; n < filas; n++) {
                                        out.println("<tr>");
                                        for (int m = 0; m < columnas; m++) {

                                            if (puntero < ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX() == n && ListaCabeceras.get(puntero).getPosicionY() == m) {
                                                out.println("<th>" + ListaCabeceras.get(puntero).getValor_cabecera() + "</th>");
                                                puntero++;
                                            } else {
                                                if (n == 0 && m == 0) {
                                                    out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Item\"' disabled></td>");
                                                } else {
                                                    //JOptionPane.showMessageDialog(null, "codigo respues: "+listaR.get(j).getCodigo_Respuestas());
                                                    //int valor=listaR.get(j).getCodigo_Respuestas()+contRM;
                                                    out.println("<td><input type=\"text\" name=\"Texto" + contRM + "\" value=\"" + listaR.get(codR).getValor_Respuestas() + "\"></td>");
                                                    //JOptionPane.showMessageDialog(null, "Codigo Respuesta m: "+codR);
                                                    //JOptionPane.showMessageDialog(null, "Nombre casilla: "+"Texto"+contRM);

                                                    //if(contRM!=0)
                                                    codR++;
                                                    contRM++;
                                                }
                                            }
                                        }
                                        out.println("</tr>");
                                    }
                                    out.println("</table></div>");
                                    out.println("</div>");

                                }//cierre if de la matriz
                                //cierre if respuestas
                                //}//cierre for respuestas
                            }
                        }
                    }
                    out.println("<div class=\"row\">");
                    out.println("<br><div class=\"col-md-4\"></div>");
                    out.println("<div class=\"col-md-4\"><center><button class=\"btn btn-default\" name=\"Submit\" onclick=\"this.form.action='modificacionFormModificable.jsp';this.form.submit();\" value=\"" + Cod + "\">Modificar</button></center></div>");
                    out.println("</div>");
                    con.closeConexion();
                    con2.closeConexion();
                %>
            </form>
            <%
                    }//cierre else en caso de modificable con respuesta

                }//cierre else para modificables
            %>

            <script type="text/javascript">
                function info() {
                    pulsado = document.elegir.radio;
                    for (i = 0; i < pulsado.length; i++) {
                        valor = pulsado[i].checked;
                        if (valor === true) {
                            elegido = pulsado[i].value;
                        }
                    }
                }
                function Imprimir_Contenido()
                {
                    var ficha = document.getElementById("imprimir");
                    var Ventana_Impresion = window.open(' ', 'popimpr');
                    Ventana_Impresion.document.write(ficha.innerHTML);
                    Ventana_Impresion.document.close();
                    Ventana_Impresion.print( );
                    Ventana_Impresion.close();
                }
            </script>


        </form>
    </div>
    <%             } catch (Exception e) {
            System.out.println("error." + e.getMessage());

        }
    %>
</body>
</html>
