
<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%-- 
    Document   : almacenarR.jsp
    Created on : 22/01/2018, 19:16:07
    Author     : DIEGOPC
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="espe.edu.ec.models.Respuestas"%>
<%@page import="java.sql.SQLException"%>
<%@page import="espe.edu.ec.models.Cabecera"%>
<%@page import="espe.edu.ec.models.Matriz"%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page import="espe.edu.ec.models.TipoPreguntas"%>
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
        <title>Respuestas Almacenada</title>
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>

        <%
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            LinkedList<Grupo> listaG = new LinkedList<Grupo>();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<Valores> listaV = new LinkedList<Valores>();
            LinkedList<Respuestas> listaR = new LinkedList<Respuestas>();
            String NombreF = request.getParameter("Submit");
            int Cod = Integer.parseInt(NombreF);
            int usPidm = Integer.parseInt(request.getParameter("param"));
            String mensaje = request.getParameter("Message");
            //JOptionPane.showMessageDialog(null, mensaje + "Se guardó la Respuesta");
            ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "'").executeQuery();
            while (rs.next()) {
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
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTVALORES WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' order by codigo_UZGTVALORES ASC").executeQuery();
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
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTRESPUESTAS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' AND SPRIDEN_PIDM=" + usPidm + "  order by codigo_UZGTRESPUESTAS ASC").executeQuery();
            while (rs.next()) {
                Respuestas res = new Respuestas();
                res.setPidm_usuario(usPidm);
                res.setCodigo_persona(rs.getInt(2));
                res.setCodigo_formulario(rs.getInt(3));
                res.setCodigo_grupo(rs.getInt(4));
                res.setCodigo_preguntas(rs.getInt(5));
                res.setCodigo_Respuestas(rs.getInt(6));
                res.setValor_Respuestas(rs.getString(7));
                listaR.add(res);
            }
            rs.close();

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
        <div id="imprimir">
            <div class="row bg-default">
                <div class="col-md-2"><center><img src="espelogo.jpg"/></center></div> 
                <!--   <div class="col-md-8"><center><h1>Gestión de Formularios</h1></center></div> -->
                <div class="col-md-2"></div>
            </div>
            <ul class="nav nav-tabs" role="tablist">
                <!-- <li role="presentation"><a href="mostrarGRes.jsp>Volver</a></li> -->
                <li class="col-md-1" align="center"><button align="center" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Volver"><a href="mostrarGRes.jsp"><i class='fas fa-arrow-left' style='font-size:40px;color:white'></i></a></button><li>
            </ul>



            <div class="container">

                <!--PARTE AGREGADA PARA PROBAR IMPRESION JUNTO CON RESPUESTAS-->
                <form name="elegir"  method="POST">
                    <div class="container">
                        <%                out.println("<div class=\"row\">");
                            out.println("<div class=\"col-md-3\"></div>");
                            out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase\">" + listaF.getFirst().getNombre_formulario() + "</h4></center></div>");
                            out.println("</div>");
                            out.println("<div class=\"row\">");
                            out.println("<div class=\"col-md-3\"></div>");
                            out.println("<div class=\"col-md-6\" align=\"justify\"><h5 class=\"text-success text-uppercase\">" + " *" + listaF.getFirst().getDescripcion_formulario() + "</h5></div>");
                            out.println("</div>");
                            int numT1 = 0;
                            int numC1 = 0;
                            int numR1 = 0;
                            int numL1 = 0;
                            int numFech1 = 0;
                            int numN1 = 0;
                            int numA = 0;
                            int numM = 0;
                            int contRM = 1;
                            int numDC = 0;
                            for (int i = 0; i < listaG.size(); i++) {

                                out.println("<div class=\"row \">");
                                out.println("<div class=\"col-md-3\"><center></div>");
                                out.println("<div class=\"col-md-6 panel panel-info panel-heading\"><center><h4 class=\"panel-title\">" + listaG.get(i).getNombre_grupo() + "</h4></center></div>");
                                out.println("<div class=\"col-md-3\"><center></div>");
                                out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\"align=\"justify\"><h5 class=\"text-success text-uppercase\">" + " *" + listaG.get(i).getDescripcion_grupo() + "</h5></div>");
                                out.println("</div><br>");

                                for (int j = 0; j < listaP.size(); j++) {
                                    //JOptionPane.showMessageDialog(null, "cont pregunta " + j);
                                    if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                                        out.println("<div class=\"row\">");
                                        out.println("<div class=\"col-md-3\"><center></div>");
                                        out.println("<div class=\"col-md-6\"align=\"justify\"><h4>" + listaP.get(j).getLabel_pregunta() + "</h4></div><br><br>");
                                        /*DATOS COMUNES*/
                                        if (listaP.get(j).getCodigo_tipo_pregunta() == 9) {
                                            numDC++;

                                            out.println("<div class=\"col-md-3\"><center></div>");
                                            out.println("<div class=\"col-md-6 offset-md-3\" align=\"justify\" >" + request.getParameter("text" + numDC) + "</div>");
                                            out.println("<div class=\"col-md-3\"><center></div>");
                                            out.println("</div>");
                                        }

                                        /////////////////////////////////////////////////////////////////////////////////////FIN DATOS COMUNES
                                        //////////////////////////////////////////////////////////////////////////////
                                        ////////////////////////////////TIPO TEXTO//////////////////////////////////
                                        /////////////////////////////////////////////////////////////////////////////
                                        if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {
                                            numT1++;
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-6 col-md-offset-3\">" + request.getParameter("valor" + numT1) + "</div>");
                                            //
                                            out.println("</div>");
                                        }

                                        if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                            int contC = 0;
                                            numC1++;
                                            String[] select = request.getParameterValues("seleccion" + numC1);
                                            for (String tempSelect : select) {
                                                //out.println("</div>");

                                                for (int k = 0; k < listaV.size(); k++) {
                                                    if (contC < 1) {
                                                        if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                                            out.println("<div class=\"row\">");
                                                            out.println("<div class=\"col-md-3\"></div>");
                                                            out.println("<div class=\"col-md-3\" align=\"justify\">" + tempSelect + "</div>");
                                                            out.println("<div class=\"col-md-3\"></div>");
                                                            out.println("<div class=\"col-md-3\"></div>");
                                                            out.println("</div>");
                                                            //contC++;
                                                        }
                                                    }
                                                    contC++;
                                                }
                                            }//cierre for del select
                                        }//cierre del combobox
                                        if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                            int contR = 0;
                                            numR1++;
                                            out.println("</div>");
                                            for (int k = 0; k < listaV.size(); k++) {

                                                if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                                    if (contR < 1) {
                                                        out.println("<div class=\"row\">");
                                                        out.println("<div class=\"col-md-3\"></div>");
                                                        out.println("<div class=\"col-md-3\" align=\"justify\" >" + request.getParameter("radio" + numR1) + "</div>");
                                                        out.println("<div class=\"col-md-3\"></div>");
                                                        out.println("<div class=\"col-md-3\"></div>");
                                                        out.println("</div>");
                                                    }
                                                    contR++;
                                                }
                                            }
                                        }
                                        if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                            numL1++;
                                            out.println("</div>");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-3\" align=\"justify\" >" + request.getParameter("lista" + numL1) + "");
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
                                            out.println("<div class=\"col-md-3\" align=\"justify\"></div>");
                                            out.println("<span class=\"btn btn-default btn-file\"><input  type=\"file\" name=\"archivo\" /></span>");
                                            out.println("</div><br>");
                                            //out.println("</div>");
                                        }
                                        ////////////////////////////////////////////////////////////////////////////////
                                        ////////////////////////TIPO DATE///////////////////////////////////////////////
                                        ////////////////////////////////////////////////////////////////////////////////
                                        if (listaP.get(j).getCodigo_tipo_pregunta() == 7) {
                                            numFech1++;
                                            out.println("</div>");
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-3\" align=\"justify\">" + request.getParameter("fechaInicio" + numFech1) + "</div>");
                                            out.println("</div><br>");
                                            //out.println("</div>");
                                        }
                                        ///////////////////////////////////////////////////////////////////////////////
                                        //////////////////////Tipo Numerico////////////////////////////////////////////
                                        ///////////////////////////////////////////////////////////////////////////////
                                        if (listaP.get(j).getCodigo_tipo_pregunta() == 8) {
                                            numN1++;
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-6 col-md-offset-3\" align=\"justify\">" + request.getParameter("num" + numN1) + "</div>");
                                            out.println("</div>");
                                        }

                                        ////////////////////////////////////////////////////////////////////////////////MATRIZ
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
                                            out.println("<div class=\"col-md-6 table-responsive\" align=\"justify\"><table class=\"table table-bordered\" name=\"matriz" + numM + "\">");
                                            int puntero = 0;

                                            for (int n = 0; n < filas; n++) {
                                                out.println("<tr>");
                                                for (int m = 0; m < columnas; m++) {

                                                    if (puntero < ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX() == n && ListaCabeceras.get(puntero).getPosicionY() == m) {
                                                        out.println("<th>" + ListaCabeceras.get(puntero).getValor_cabecera() + "</th>");
                                                        puntero++;
                                                    } else {
                                                        //out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Texto\"'></td>");
                                                        if (n == 0 && m == 0) {
                                                            out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Item\"' disabled></td>");
                                                        } else {
                                                            out.println("<td><input type=\"text\" name=\"Texto" + contRM + "\" placeholder=\"" + request.getParameter("Texto" + contRM) + "\"' disabled></td>");
                                                            contRM++;
                                                        }

                                                    }
                                                }
                                                out.println("</tr>");
                                            }
                                            out.println("</table></div>");
                                            out.println("</div>");

                                        }
                                    }
                                }
                            }

                            out.println("<div class=\"row\">");
                            out.println("<br><div class=\"col-md-4\"></div>");
                            //out.println("<div class=\"col-md-4\"><center><button class=\"btn btn-default\" type=\"text\" name=\"Submit\" value='"+Cod+"'>Guardar</button></center></div>"); 
                            out.println("</div>");

                            //    out.println("<h:form>");
                            //    out.println("<br />");
                            //    out.println("");
                            //    out.println("</h:form>");            
                            con.closeConexion();
                        %>
                    </div>
                    <script type="text/javascript">
                        function info() {
                            pulsado = document.elegir.radio;
                            for (i = 0; i < pulsado.length; i++) {
                                valor = pulsado[i].checked;
                                if (valor == true) {
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
                    <center><a href="javascript:Imprimir_Contenido()" class="btn btn-success btn-lg">
                            <span  class="d-inline-block" tabindex="0" data-toggle="tooltip" title="Imprimir" class="glyphicon glyphicon-print  /*alert alert-info*/">
                                <i class='fas fa-print'style='font-size:35px' ></i></span>  
                        </a><center>
                            </form>
                            </div>
                            <%             } catch (Exception e) {
                                    System.out.println("error." + e.getMessage());

                                }
                            %>
                            </body>
                            </html>
