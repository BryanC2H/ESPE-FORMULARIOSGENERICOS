<%-- 
    Document   : eliminar
    Created on : 21-oct-2016, 8:47:46
    Author     : david
--%>

<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="espe.edu.ec.models.Respuestas"%>
<%@page import="java.sql.SQLException"%>
<%@page import="espe.edu.ec.models.Cabecera"%>
<%@page import="espe.edu.ec.models.Matriz"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="espe.edu.ec.models.Valores"%>
<%@page import="espe.edu.ec.models.TipoPreguntas"%>
<%@page import="espe.edu.ec.models.Preguntas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.Grupo"%>
<%@page import="espe.edu.ec.models.Formulario"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        
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
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTRESPUESTAS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' order by codigo_UZGTRESPUESTAS ASC").executeQuery();
            while (rs.next()) {
                Respuestas res = new Respuestas();
                res.setPidm_usuario(1234);
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
        <div class="row bg-default">
            <!--<div class="col-md-2"><center><img src="espelogo.jpg"/></center></div> -->
            <div class="col-md-8"><center><h1>Servicios</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">

            <li role="presentation"><a href="mostrarFormulario.jsp">Volver</a></li>
        </ul>
        <div class="container">
            <%
                ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ WHERE codigo_UZGTFORMULARIOS = '" + listaF.getFirst().getCodigo_formulario() + "'order by codigo_uzgtmatriz ASC").executeQuery();
                LinkedList<Matriz> ListaMatriz = new LinkedList<Matriz>();
                LinkedList<Cabecera> ListaCabeceras = new LinkedList<Cabecera>();
                while (rs2.next()) {
                    Matriz Mat = new Matriz(rs2.getInt(1), rs2.getInt(2), rs2.getInt(3), rs2.getInt(4), rs2.getInt(5), rs2.getInt(6), rs2.getString(7));
                    ListaMatriz.add(Mat);
                }
                rs2.close();
                for (int m = 0; m < ListaMatriz.size(); m++) {
                    try {
                        co.prepareStatement("DELETE FROM UTIC.UZGTCABECERAS WHERE codigo_UZGTMATRIZ = '" + ListaMatriz.get(m).getCodigo_matriz() + "'").executeQuery();
                    } catch (SQLException ex) {
                        out.println("cabecera no eliminado.");
                    }
                    try {
                        co.prepareStatement("DELETE FROM UTIC.UZGTMATRIZ WHERE codigo_UZGTMATRIZ = '" + ListaMatriz.get(m).getCodigo_matriz() + "'").executeQuery();
                    } catch (SQLException ex) {
                        out.println("matriz no eliminado.");
                    }
                }
                try {
                    co.prepareStatement("DELETE FROM UTIC.UZGTRESPUESTAS WHERE codigo_UZGTFORMULARIOS ='" + listaF.getFirst().getCodigo_formulario() + "'").executeUpdate();
                    //out.println("Respuesta eliminada");
                } catch (SQLException ex) {
                    out.println("valor no eliminado.");
                }
                try {
                    co.prepareStatement("DELETE FROM UTIC.UZGTVALORES WHERE codigo_UZGTFORMULARIOS ='" + listaF.getFirst().getCodigo_formulario() + "'").executeUpdate();
                    //out.println("Valor eliminado.");
                } catch (SQLException ex) {
                    out.println("valor no eliminado.");
                }
                try {
                    co.prepareStatement("DELETE FROM UTIC.UZGTPREGUNTAS WHERE codigo_UZGTFORMULARIOS ='" + listaF.getFirst().getCodigo_formulario() + "'").executeUpdate();
                    //out.println("pregunta eliminado.");
                } catch (SQLException ex) {
                    out.println("pregunta no eliminado.");
                }
                try {
                    co.prepareStatement("DELETE FROM UTIC.UZGTGRUPO WHERE codigo_UZGTFORMULARIOS ='" + listaF.getFirst().getCodigo_formulario() + "'").executeUpdate();
                    //out.println("grupo eliminado.");
                } catch (SQLException ex) {
                    out.println("grupo no eliminado.");
                }
                try {
                    co.prepareStatement("DELETE FROM UTIC.UZGTFORMULARIO_PERSONA WHERE codigo_UZGTFORMULARIOS ='" + listaF.getFirst().getCodigo_formulario() + "'").executeUpdate();
                    //out.println("grupo eliminado.");
                } catch (SQLException ex) {
                    out.println("fp no eliminado.");
                }
                try {
                    co.prepareStatement("DELETE FROM UTIC.UZGTFORMULARIOS WHERE codigo_UZGTFORMULARIOS ='" + listaF.getFirst().getCodigo_formulario() + "'").executeUpdate();
                    out.println("<center><div class=\"alert alert-success\"><strong>Exito!</strong> Se borro correctamente el formulario</div></center>");
                } catch (SQLException ex) {
                    out.println("<center><div class=\"alert alert-warning\"><strong>Error!</strong> No se logró eliminar el formulario " + listaF.getFirst().getNombre_formulario() + "</div></center>");
                }
                con.closeConexion();
                response.sendRedirect("mostrarFormulario.jsp");

            %>
        </div>
    </body>
</html>
