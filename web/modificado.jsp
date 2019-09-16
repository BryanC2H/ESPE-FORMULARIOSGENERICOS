<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
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
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            Date Fecha = new Date();
            java.sql.Date FechaSql = new java.sql.Date(Fecha.getYear(), Fecha.getMonth(), Fecha.getDate());
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            LinkedList<Grupo> listaG = new LinkedList<Grupo>();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<Valores> listaV = new LinkedList<Valores>();
            String NombreF = request.getParameter("Submit");
            int Cod = Integer.parseInt(NombreF);
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
        %>
    </head>
    <body>
        <style>.navbar-custom {
                color: #58D68D;
                background-color: #239B56;
                border-color: #000
            }</style>
        <div class="row bg-default">
            <div class="col-md-2"><center><img src="espelogo.jpg"/></center></div>
            <div class="col-md-8"><center><h1>Formularios Genéricos</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">
            <%
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white\" href=\"NewForm.jsp\"><i class=\"fas fa-\" style=\'font-size:24px\'>&#xf0fe;</i><strong> Nuevo </strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white\" href=\"mostrarFormulario.jsp\"><i class=\"fas fa-eye\" style=\'font-size:24px\'></i><strong> Mostrar </strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white\" href=\"modificarFormulario.jsp\"><i class=\"fas fa-pencil-alt\" style=\'font-size:24px\'></i><strong> modificar</strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white\" href=\"eliminarFormulario.jsp\"><i class=\"fas fa-trash-alt\" style=\'font-size:24px\'></i><strong>  Eliminar</strong></a></li>");
                out.print("<li class=\"navbar navbar-inverse navbar-fixed-top navbar-custom\" role=\"presentation\"><a style=\"color:white\" href=\"mostrarFormulario.jsp\"><strong><i class=\"fas fa-arrow-left\" style=\'font-size:24px\'></i></strong></a></li></br>");
            %>
        </ul>
        <div class="container">
            <%
                java.util.Date date = new java.util.Date();
                long t = date.getTime();
                java.sql.Date sqlDate1 = new java.sql.Date(t);
                request.setCharacterEncoding("UTF-8");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<input type=\"text\" class=\"col-md-6 panel panel-info panel-heading\"  value=" + "\"" + request.getParameter("nombreF") + "\" name=\"nombF\"/>");
                out.println("</div>");

                String nombre = "";
                try {
                    request.setCharacterEncoding("UTF-8");
                    nombre = request.getParameter("nombF");
                    co.prepareStatement("UPDATE UTIC.UZGTFORMULARIOS SET UZGTFORMULARIOS_nombre='" + request.getParameter("nombreF") + "' WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario()).executeUpdate();
                    /*  PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTFORMULARIOS SET UZGTFORMULARIOS_FECHA_MODIF= ? WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario());
                    ps.setDate(1, sqlDate1);
                    ps.executeUpdate(); */
                    //out.println("Formulario modificado.");

                } catch (SQLException ex) {
                    //out.println("Formulario no modificado" + ex.getMessage() + "\n");
                }

                for (int i = 0; i < listaG.size(); i++) {
                    out.println("<div class=\"row \">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<input class=\"col-md-6 panel panel-info panel-heading\"  value=" + "\"" + listaG.get(i).getNombre_grupo() + "\"/>");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("</div>");

                    for (int j = 0; j < listaP.size(); j++) {
                        if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                            out.println("<div class=\"row\">");
                            out.println("<div class=\"col-md-3\"></div>");
                            out.println("<input class=\"col-md-6 panel panel-info panel-heading\"  value=" + "\"" + listaP.get(j).getLabel_pregunta() + "\"/></br>");
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {
                                //out.println("</br><div class=\"col-md-3\"><input id=\"valor\" type=\"text\" name=\"valor\" class=\"form-control\"/></div>");
                                out.println("</br><div class=\"col-md-3\"></div></br>");
                                out.println("</div>");
                            }

                            if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                out.println("</div>");
                                for (int k = 0; k < listaV.size(); k++) {
                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                        out.println("<div class=\"row\">");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"><label><input type=\"checkbox\" name=\"Seleccion\">" + listaV.get(k).getValores() + "</input></label></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("</div>");
                                    }
                                }
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                out.println("</div>");
                                for (int k = 0; k < listaV.size(); k++) {
                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {
                                        out.println("<div class=\"row\">");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"><input type=\"radio\" name=\"seleccion\">" + listaV.get(k).getValores() + "</input></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("</div>");
                                    }
                                }
                            }
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-3\"><select type=\"text\" name=\"lista\">");
                                for (int k = 0; k < listaV.size(); k++) {
                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                        out.println("<option>" + listaV.get(k).getValores() + "</option>");

                                    }
                                }
                                out.println("</select></div>");
                                out.println("</div>");
                            }
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
                                            out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Texto\"'></td>");
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
                //modifcar grupos
                for (int i = 0; i < listaG.size(); i++) {

                    try {
                        request.setCharacterEncoding("UTF-8");
                        String num = "nomG" + i;

                        nombre = request.getParameter("nombF");
                        co.prepareStatement("UPDATE UTIC.UZGTGRUPO SET UZGTGRUPO_nombre='" + request.getParameter(num) + "' WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario() + "AND codigo_UZGTGRUPO=" + listaG.get(i).getCodigo_grupo()).executeUpdate();
                        /* PreparedStatement ps = co.prepareStatement("UPDATE UTIC.UZGTGRUPO SET UZGTGRUPO_FECHA_MODIF= ? WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario() + "AND codigo_UZGTGRUPO=" + listaG.get(i).getCodigo_grupo());
                            ps.setDate(1, sqlDate1);
                            ps.executeUpdate(); */
                        //out.println("Grupo modificado."+num);

                    } catch (SQLException ex) {
                        //out.println("Grupo no modificado");
                    }
                    ////////////////////////////////////////////////////////////////////////////////////
                    //////////////////////PREGUNTAS/////////////////////////////////////////////////////
                    for (int j = 0; j < listaP.size(); j++) {
                        if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                            try {
                                request.setCharacterEncoding("UTF-8");

                                String num = "nomP" + j;

                                nombre = request.getParameter("nombF");
                                co.prepareStatement("UPDATE UTIC.UZGTPREGUNTAS SET UZGTPREGUNTAS_pregunta='" + request.getParameter(num) + "'  WHERE codigo_UZGTFORMULARIOS =" + listaP.get(j).getCodigo_formulario() + " AND  codigo_UZGTGRUPO=" + listaP.get(j).getCodigo_grupo() + "AND codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas()).executeUpdate();
                                //out.println("UPDATE1 PREGUNTA modificado." + num);

                                //out.println("UPDATE FECHA PREGUNTA modificado." + num);
                                //co.prepareStatement("UPDATE UTIC.UZGTGRUPO SET UZGTGRUPO_nombre='" + request.getParameter(num) + "' WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario() + "AND codigo_UZGTGRUPO=" + listaG.get(i).getCodigo_grupo()).executeUpdate();
                                //out.println("Pregunta modificado." + num);
                            } catch (SQLException ex) {
                                String num = "nomP" + j;
                                out.println("Pregunta no modificado." + num + ex.getMessage() + "\n");
                            }
                            /////////////////////////////////////////////////////////////////////////////////////////////
                            ////////////////////CHECKBOX/////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                for (int k = 0; k < listaV.size(); k++) {
                                    if (listaV.get(k).getCodigo_Preguntas() == listaP.get(j).getCodigo_preguntas()) {

                                        request.setCharacterEncoding("UTF-8");

                                        String num = "Seleccion" + j;

                                        nombre = request.getParameter("nombF");
                                        co.prepareStatement("UPDATE UTIC.UZGTVALORES SET UZGTTIPOPREGUNTAS_valor='" + request.getParameter(num) + "' WHERE codigo_UZGTFORMULARIOS =" + listaF.getFirst().getCodigo_formulario() + "AND codigo_UZGTGRUPO=" + listaG.get(i).getCodigo_grupo() + "AND codigo_UZGTPREGUNTAS=" + listaP.get(j).getCodigo_preguntas() + "AND codigo_UZGTVALORES=" + listaV.get(j).getCodigo_Valores()).executeUpdate();
                                        // out.println("Check modificado.\n" + num);

                                    }
                                }
                            }
                        }

                    }
                }

                //modificar preguntas
                //nuevo codigo para modificar el nombre del Formulario
                con.closeConexion();
            %>
        </div>
    </body>
</html>
