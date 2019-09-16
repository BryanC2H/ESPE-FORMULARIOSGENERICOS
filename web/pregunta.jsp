<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="espe.edu.ec.models.datoComun"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.awt.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="espe.edu.ec.models.TipoPreguntas"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <hea
        d>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pregunta</title>
        <%  out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<datoComun> listaDC = new LinkedList<datoComun>();
            ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTIPOPREGUNTAS ORDER BY codigo_UZGTIPOPREGUNTAS").executeQuery();
            while (rs.next()) {
                TipoPreguntas TP = new TipoPreguntas();
                TP.setCodigo_tipopregunta(rs.getInt(1));
                TP.setNombre_tipopregunta(rs.getString(2));
                listaTP.add(TP);
            }
            rs.close();
            ResultSet rs1 = co.prepareStatement("SELECT * FROM UTIC.UZGTDATOSCOMUNES ORDER BY codigo_UZGTDATOSCOMUNES").executeQuery();
            while (rs1.next()) {
                datoComun DC = new datoComun();
                DC.setEtiqueta(rs1.getString(2));
                DC.setQuery(rs1.getString(3));
                listaDC.add(DC);
            }
            rs1.close();
            con.closeConexion();

        %>
    </head>
    <body>
        <style>.navbar-custom {
                color: #58D68D;
                background-color: #239B56;
                border-color: #000
            }</style>
            <%             try {

            %>
        <div class="row bg-">
            <div class="col-md-2"><center><img src="Imagenes/espelogo.jpg"/></center></div>
            <div class="col-md-8"><center><h1>Formularios Genericos</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">
            <li class="navbar navbar-inverse navbar-fixed-top navbar-custom" role="presentation"><a style="color:white;" href="Html/nuevoGrupo.html"><strong><i class="far fa-calendar-plus" style='font-size:24px;color:white'></i>&nbsp Nuevo Grupo</strong></a></li>
            <li class="navbar navbar-inverse navbar-fixed-top navbar-custom" role="presentation"><a style="color:white;" href="mostrarFormulario.jsp"><strong><i class="fas fa-calendar-check" style='font-size:24px;color:white'></i> &nbspFinalizar Formulario</strong></a></li>
        </ul>
        <form action="nuevaPregrunta.jsp" method="POST">          
            <div class="container">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Pregunta: </h4></div>
                    <div class="col-md-3"><center><input id="pregunta" type="text" name="pregunta" class="form-control" placeholder="pregunta" required/></center></div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Pregunta Vigente: </h4></div>
                    <div class="col-md-3"><center><select type = "text" name="vigente" class="form-control" required>
                                <option selected>S</option>
                                <option>N</option>
                            </select></center>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Tipo de Ingreso: </h4></div>
                    <div class="col-md-3"><center><select type = "text" name="vigente" class="form-control" required>
                                <option selected>NINGUNO</option>
                                <option>UPPERCASE</option>
                                <option>LOWERCASE</option>
                            </select></center>
                    </div>
                </div>            
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><h4>Tipo Pregunta: </h4></div>
                    <div class="col-md-3"><center><select type = "text" id="tipo" name="tipo" onchange="yesnoCheck(this);" class="form-control" required>
                                <%                        for (int i = 0; i < listaTP.size(); i++) {

                                        out.println("<option>" + listaTP.get(i).getNombre_tipopregunta() + "</option>");
                                    }
                                %>
                            </select></center>
                    </div>
                    <div id="ifYes" style="display: none;">
                        <div class="col-md-3"><center><select type = "text" id="etiqueta" name="etiqueta"  class="form-control" required>
                                    <%
                                        for (int i = 0; i < listaDC.size(); i++) {

                                            out.println("<option>" + listaDC.get(i).getEtiqueta() + "</option>");
                                        }
                                    %>
                                </select></center>
                        </div>                
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-3"><center><button class="btn btn-success" type="submit" name="Submit" value="guardar">Aceptar</button></center></div>
                </div>
            </div>
        </form>
        <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
    <script>
        function yesnoCheck(that) {
            if (that.value == "DATOS COMUNES") {

                document.getElementById("ifYes").style.display = "block";
            } else {
                document.getElementById("ifYes").style.display = "none";
            }
        }
    </script>
</html>
