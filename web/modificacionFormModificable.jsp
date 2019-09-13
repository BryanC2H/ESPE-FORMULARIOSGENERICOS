<%-- 
    Document   : modificado.jsp
    Created on : 08/01/2018, 10:10:01
    Author     : DIEGOPC
--%>

<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="espe.edu.ec.models.Respuestas"%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page import="espe.edu.ec.models.TipoPreguntas"%>
<%@page import="espe.edu.ec.models.Preguntas"%>
<%@page import="espe.edu.ec.models.Grupo"%>
<%@page import="espe.edu.ec.models.Formulario"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.Matriz"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="espe.edu.ec.models.Cabecera"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificación-Formularios</title>
  
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
      
            java.util.Date date = new java.util.Date();
            long t = date.getTime();
            java.sql.Date sqlDate = new java.sql.Date(t);

            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            LinkedList<Grupo> listaG = new LinkedList<Grupo>();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<Valores> listaV = new LinkedList<Valores>();
            LinkedList<Respuestas> listaR = new LinkedList<Respuestas>();
            String NombreF = request.getParameter("Submit");
            //JOptionPane.showMessageDialog(null, NombreF+"");

            int Cod = Integer.parseInt(NombreF);
            //int Cod=77;
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
            rs = co.prepareStatement("select * from uzgtrespuestas where codigo_uzgtformularios= '" + Cod + "' order by codigo_uzgtpreguntas asc").executeQuery();
            while (rs.next()) {
                Respuestas res = new Respuestas();
                res.setCodigo_formulario(rs.getInt(3));
                res.setCodigo_grupo(rs.getInt(4));
                res.setCodigo_preguntas(rs.getInt(5));
                res.setCodigo_Respuestas(rs.getInt(6));
                res.setValor_Respuestas(rs.getString(7));
                res.setFecha_modif(rs.getDate(17));
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
        <div class="row bg-default">
            <!--<div class="col-md-2"><center><img src="espelogo.jpg"/></center></div>-->
            <div class="col-md-8"><center><h1>Formularios Genéricos</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation"><a href="index.jsp">Volver</a></li>
        </ul>
        <div class="container">
            <%                request.setCharacterEncoding("UTF-8");
                Date Fecha = new Date();
                java.sql.Date FechaSql = new java.sql.Date(Fecha.getYear(), Fecha.getMonth(), Fecha.getDate());

                out.println("<form action=\"\" method=\"POST\" target=\"_self\">");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase\">" + listaF.getFirst().getNombre_formulario() + "</h4></center></div>");
                out.println("</div>");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<div class=\"col-md-6\" align=\"justify\"><h5 class=\"text-success text-uppercase\">" + " *" + listaF.getFirst().getDescripcion_formulario() + "</h5></div>");
                out.println("</div>");

                String nombre = "";

                int numT1 = 0;
                int numC1 = 0;
                int numR1 = 0;
                int numL1 = 0;
                int numFech1 = 0;
                int numN1 = 0;
                int numA = 0;
                int contRM = 0;
                int codR = 0;
                for (int i = 0; i < listaG.size(); i++) {

                    out.println("<div class=\"row \">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6 panel panel-info panel-heading\"><center><h4 class=\"panel-title\">" + listaG.get(i).getNombre_grupo() + "</h4></center></div>");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("</div>");
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6\" align=\"justify\" ><h5 class=\"text-success text-uppercase\">" + " *" + listaG.get(i).getDescripcion_grupo() + "</h5></div>");
                    out.println("</div>");

                    for (int j = 0; j < listaP.size(); j++) {
                        //JOptionPane.showMessageDialog(null, "Codigo pregunta: "+listaP.get(j).getCodigo_preguntas());
                        if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                            out.println("<div class=\"row\">");
                            out.println("<div class=\"col-md-3\"></div>");
                            out.println("<input class=\"col-md-6 panel panel-info panel-heading\"  value=" + "\"" + listaP.get(j).getLabel_pregunta() + "\" disabled/>");
                            out.println("<div class=\"col-md-3\"></div>");
                            out.println("</div>");
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 9) {
                                codR++;
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {
                                numT1++;
                                String val = "text" + numT1;
                                //JOptionPane.showMessageDialog(null, "Entra en texto.. valor request: "+request.getParameter(val)+" nombre que tengo: "+val);
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\">" + request.getParameter("text" + numT1) + "</div>");
                                out.println("<div class=\"col-md-3\"></div></br>");
                                out.println("</div>");
                                try {
                                    co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_VALOR ='" + request.getParameter("text" + numT1) + "' WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas()).executeQuery();
                                    /* PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_FECHA_MODIF= ? WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas());
                                    ps.setDate(1, sqlDate);
                                    ps.executeUpdate(); */
                                    //out.println("texto modificado ");
                                } catch (SQLException ex) {
                                    out.println("texto no modificada" + ex);
                                }
                                codR++;

                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                numC1++;
                                //for(int k=0; k<1;k++)
                                //{
                                //if(listaV.get(k).getCodigo_Preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] select = request.getParameterValues("check" + numC1);
                                for (String tempSelect : select) {
                                    try {

                                        co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_VALOR ='" + request.getParameter("check" + numC1) + "' WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas()).executeQuery();
                                        /* PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_FECHA_MODIF= ? WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas());
                                        ps.setDate(1, sqlDate);
                                        ps.executeUpdate();
                                        // out.println(" modificado");*/
                                    } catch (Exception ex) {
                                        out.println("no modificado" + ex);
                                    }

                                }
                                codR++;

                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                /*int contR=0;
                                numR1++;
                                String val="rad"+numR1;
                                JOptionPane.showMessageDialog(null, "Entra en texto.. valor request: "+request.getParameter(val)+" nombre que tengo: "+val);
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\">"+request.getParameter(val)+"</div>");
                                //
                                out.println("</div>");
                                out.println("</br><div class=\"col-md-3\"></div></br>");
                                out.println("</div>");*/
                                int contR = 0;
                                numR1++;
                                out.println("</div>");
                                for (int k = 0; k < listaV.size(); k++) {

                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                        if (contR < 1) {
                                            out.println("<div class=\"row\">");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-3\"align=\"justify\" >" + request.getParameter("radio" + numR1) + "</div>");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("<div class=\"col-md-3\"></div>");
                                            out.println("</div>");
                                        }
                                        contR++;
                                    }
                                }
                                try {
                                    co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_VALOR ='" + request.getParameter("radio" + numR1) + "' WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas()).executeQuery();
                                    /*   PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_FECHA_MODIF= ? WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas());
                                    ps.setDate(1, sqlDate);
                                    ps.executeUpdate();
                                    out.println("radio modificada "); */
                                } catch (SQLException ex) {
                                    out.println("radio no modificada");
                                }
                                codR++;
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                numL1++;
                                String val = "lista" + numL1;
                                //JOptionPane.showMessageDialog(null, "Entra en texto.. valor request: "+request.getParameter(val)+" nombre que tengo: "+val);
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\" align=\"justify\">" + request.getParameter("lista" + numL1) + "</div>");
                                //
                                out.println("</div>");
                                out.println("</br><div class=\"col-md-3\"></div></br>");
                                out.println("</div>");
                                try {
                                    co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_VALOR ='" + request.getParameter(val) + "' WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas()).executeQuery();
                                    /*  PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_FECHA_MODIF= ? WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas());
                                    ps.setDate(1, sqlDate);
                                    ps.executeUpdate();
                                    out.println("radio modificada ");*/
                                } catch (SQLException ex) {
                                    out.println("radio no modificada");
                                }
                                codR++;
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 7) {
                                numFech1++;
                                String val = "fech" + numFech1;
                                //JOptionPane.showMessageDialog(null, "Entra en fecha.. valor request: "+request.getParameter(val)+" nombre que tengo: "+val);
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\"align=\"justify\">" + request.getParameter("fech" + numFech1) + "</div>");
                                //
                                out.println("</div>");
                                out.println("</br><div class=\"col-md-3\"></div></br>");
                                out.println("</div>");
                                try {
                                    co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_VALOR ='" + request.getParameter(val) + "' WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas()).executeQuery();
                                    /* PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_FECHA_MODIF= ? WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas());
                                    ps.setDate(1, sqlDate);
                                    ps.executeUpdate(); */
                                    //out.println("fecha modificado");
                                } catch (SQLException ex) {
                                    out.println("fecha no modificada");
                                }
                                codR++;
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 8) {
                                numN1++;
                                String val = "num" + numN1;
                                //JOptionPane.showMessageDialog(null, "Entra en NUM.. valor request: "+request.getParameter(val)+" nombre que tengo: "+val);
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\"align=\"justify\">" + request.getParameter("num" + numN1) + "</div>");
                                //
                                out.println("</div>");
                                out.println("</br><div class=\"col-md-3\"align=\"justify\"></div></br>");
                                out.println("</div>");
                                try {
                                    co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_VALOR ='" + request.getParameter(val) + "' WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas()).executeQuery();
                                    /* PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_FECHA_MODIF= ? WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas());
                                    ps.setDate(1, sqlDate);
                                    ps.executeUpdate();*/
                                } catch (SQLException ex) {
                                    out.println("numerica no modificada");
                                }
                                codR++;
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 4) {

                                //out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\" align=\"justify\"></div>");
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
                                                out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Cabeceras\"' disabled></td>");
                                            } else {
                                                //JOptionPane.showMessageDialog(null, "codigo respues: "+listaR.get(j).getCodigo_Respuestas());
                                                //int valor=listaR.get(j).getCodigo_Respuestas()+contRM;
                                                String val = "Texto" + contRM;
                                                out.println("<td><input type=\"text\" name=\"Texto" + contRM + "\" value=\"" + request.getParameter(val) + "\" disabled></td>");
                                                //JOptionPane.showMessageDialog(null, "Codigo Respuesta m: "+codR);
                                                //JOptionPane.showMessageDialog(null, "Nombre casilla: "+"Texto"+contRM);
                                                try {

                                                    co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_VALOR ='" + request.getParameter(val) + "' WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas() + " ").executeQuery();
                                                    /*PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTRESPUESTAS SET UZGTRESPUESTAS_FECHA_MODIF= ? WHERE codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + " and codigo_UZGTRESPUESTAS=" + listaR.get(codR).getCodigo_Respuestas() + " ");
                                                    ps.setDate(1, sqlDate);
                                                    ps.executeUpdate(); */
                                                    // out.println("matriz  modificada ");
                                                } catch (SQLException ex) {
                                                    out.println("matriz no modificada ");
                                                }

                                                codR++;
                                                contRM++;
                                            }
                                        }

                                    }
                                    out.println("</tr>");
                                }
                                out.println("</table></div>");
                                //out.println("<div class=\"col-md-3\"></div>");   verificar
                                out.println("</div>");

                            }
                        }
                    }
                }
                con.closeConexion();
                //modificar preguntas

                //nuevo codigo para modificar el nombre del Formulario

            %>
        </div>
        <%            } catch (Exception ex) {
                out.println(ex);
            }
        %>
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
    <center><a class=" glyphicon glyphicon-print  alert alert-info "  href="javascript:Imprimir_Contenido()" ></a></center>     
    <center><div class="alert alert-success"><strong>Exito!</strong> Se ha guardado correctamente su respuesta.</div></center>

    <center><a href="javascript:Imprimir_Contenido()" class="btn btn-success btn-lg">
            <span class="glyphicon glyphicon-print  /*alert alert-info*/"></span> Print 
        </a><center>
            </body>
            </html>
