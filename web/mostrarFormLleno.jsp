<%-- 
    Document   : mostrarFormLleno
    Created on : 12/03/2018, 11:10:53
    Author     : DIEGOPC
--%>


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
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <% 
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            LinkedList<Grupo> listaG = new LinkedList<Grupo>();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<Valores> listaV = new LinkedList<Valores>();
            String NombreF = request.getParameter("Submit");
            //int Cod = Integer.parseInt(NombreF);
            int Cod=1;
            ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS WHERE codigo_UZGTFORMULARIOS_PERSONA = '"+Cod+"'").executeQuery();
            while(rs.next())
            {
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
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTGRUPO WHERE codigo_UZGTFORMULARIOS_PERSONA = '"+Cod+"' order by codigo_UZGTGRUPO ASC").executeQuery();
            while(rs.next())
            {
                Grupo G = new Grupo();
                G.setCodigo_formulario(rs.getInt(1));
                G.setCodigo_grupo(rs.getInt(2));
                G.setNombre_grupo(rs.getString(3));
                G.setDescripcion_grupo(rs.getString(4));
                listaG.add(G);
            }
            rs.close();
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTPREGUNTAS WHERE codigo_UZGTFORMULARIOS = '"+Cod+"' order by codigo_UZGTPREGUNTAS ASC").executeQuery();
            while(rs.next())
            {
               Preguntas P = new Preguntas();
               P.setCodigo_formulario(rs.getInt(1));
               P.setCodigo_grupo(rs.getInt(2));
               P.setCodigo_preguntas(rs.getInt(3));
               P.setCodigo_tipo_pregunta(rs.getInt(7));
               P.setLabel_pregunta(rs.getString(8));
               listaP.add(P);
            }
            rs.close();
            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTVALORES WHERE codigo_UZGTFORMULARIOS = '"+Cod+"' order by codigo_UZGTVALORES").executeQuery();
            while(rs.next())
            {
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
            <!--<div class="col-md-2"><center><img src="espelogo.jpg"/></center></div>-->
            <div class="col-md-8"><center><h1>Gestión de Formularios</h1></center></div>
            <div class="col-md-2"></div>
        </div>
        <ul class="nav nav-tabs" role="tablist">
                <li role="presentation"><a href="mostrarGRes.jsp">Volver</a></li>
            </ul>
        
        <script type="text/javascript">
        function info() {
        pulsado = document.elegir.color;
        for (i=0; i<pulsado.length; i++) {
        valor = pulsado[i].checked;
              if (valor == true) {
                 elegido = pulsado[i].value;
                 }
              }
         cambio = document.getElementById("parrafo")
         cambio.style.color = elegido
         }
         function validarNumero()
         {
             numero1=document.elegir.num1.value;
             numero2=document.elegir.num2.value;
             numero3=document.elegir.num3.value;
             numero4=document.elegir.num4.value;
             if(isNaN(numero1)||isNaN(numero2)||isNaN(numero3)||isNaN(numero4))
             {
                 alert("Debe ingresar valores numericos");
             }
         }
         
         </script>

        <form name="elegir"  method="POST" action="uploadServlet" enctype="multipart/form-data">
        <div class="container">
            <%
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<div class=\"col-md-6\"><center><h4 class=\"text-uppercase\">"+listaF.getFirst().getNombre_formulario()+"</h4></center></div>");
                out.println("</div>");
                out.println("<div class=\"row\">");
                out.println("<div class=\"col-md-3\"></div>");
                out.println("<div class=\"col-md-6\"><h5 class=\"text-success text-uppercase\">"+" *"+listaF.getFirst().getDescripcion_formulario()+"</h5></div>");
                out.println("</div>");
                int numT=0;
                int numC=0;
                int numR=0;
                int numL=0;
                int numFech=0;
                int numN=0;
                int numA=0;
                for(int i=0; i<listaG.size();i++)
                {
                    
                    out.println("<div class=\"row \">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6 panel panel-info panel-heading\"><center><h4 class=\"panel-title\">"+listaG.get(i).getNombre_grupo()+"</h4></center></div>");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("</div>");
                    out.println("<div class=\"row\">");
                    out.println("<div class=\"col-md-3\"></div>");
                    out.println("<div class=\"col-md-6\"><h5 class=\"text-success text-uppercase\">"+" *"+listaG.get(i).getDescripcion_grupo()+"</h5></div>");
                    out.println("</div>");
                   
                    for(int j=0; j<listaP.size();j++)
                    {
                        if(listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo())
                        {
                        out.println("<div class=\"row\">");
                        out.println("<div class=\"col-md-3\"></div>");
                        out.println("<div class=\"col-md-6\"><h4>"+listaP.get(j).getLabel_pregunta()+"</h4></div><br><br>");
                        //////////////////////////////////////////////////////////////////////////////
                        ////////////////////////////////TIPO TEXTO//////////////////////////////////
                        /////////////////////////////////////////////////////////////////////////////
                            if(listaP.get(j).getCodigo_tipo_pregunta()==1)
                            {
                                numT++;
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\"><input id=\"valor\" type=\"text\" name=\"valor"+numT+"\" class=\"form-control\"/></div>");
                                //
                                out.println("</div>");
                            }
                        
                            if(listaP.get(j).getCodigo_tipo_pregunta()==2)
                            {
                                numC++;
                                out.println("</div>");
                                for(int k=0; k<listaV.size();k++)
                                {
                                    if(listaV.get(k).getCodigo_Preguntas()== listaP.get(j).getCodigo_preguntas())
                                    {
                                        
                                        out.println("<div class=\"row\">");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"><label><input type=\"checkbox\" name=\"seleccion"+numC+"\" value=\""+listaV.get(k).getValores()+"\"> "+listaV.get(k).getValores()+"</input></label></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("</div>");
                                    }
                                }
                            }
                            if(listaP.get(j).getCodigo_tipo_pregunta()==3)
                            {
                                numR++;
                                out.println("</div>");
                                for(int k=0; k<listaV.size();k++)
                                {
                                    
                                    if(listaV.get(k).getCodigo_Preguntas()== listaP.get(j).getCodigo_preguntas())
                                    {
                                        
                                        out.println("<div class=\"row\">");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"><input type=\"radio\" name=\"radio"+numR+"\" value=\""+listaV.get(k).getValores()+"\"> "+listaV.get(k).getValores()+"</input></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("<div class=\"col-md-3\"></div>");
                                        out.println("</div>");
                                    }
                                }
                            }
                            if(listaP.get(j).getCodigo_tipo_pregunta()==5)
                            {
                                numL++;
                                out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-3\"><select type=\"text\" name=\"lista"+numL+"\">");
                                for(int k=0; k<listaV.size();k++)
                                {
                                    if(listaV.get(k).getCodigo_Preguntas()== listaP.get(j).getCodigo_preguntas())
                                    {
                                        
                                        out.println("<option>"+listaV.get(k).getValores()+"</option>");
                                        
                                    }
                                }
                                out.println("</select></div>");
                                out.println("</div>");
                            }
                            ////////////////////////////////////////////////////////////////////////////////
                            ////////////////////////////////Guardar Archivo/////////////////////////////////
                            ////////////////////////////////////////////////////////////////////////////////
                            if(listaP.get(j).getCodigo_tipo_pregunta()==6)
                            {
                                numA++;
                                out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<span class=\"btn btn-default btn-file\"><input  type=\"file\" name=\"archivo"+numA+"\" /></span>");
                                out.println("</div><br>");
                                //out.println("</div>");
                            }
                            ////////////////////////////////////////////////////////////////////////////////
                            ////////////////////////TIPO DATE///////////////////////////////////////////////
                            ////////////////////////////////////////////////////////////////////////////////
                            if(listaP.get(j).getCodigo_tipo_pregunta()==7)
                            {
                                numFech++;
                                out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-3\"><label for=\"fechaInicio\" class=\"sr-only\">fechaInicio</label><input id=\"fechaInicio"+numFech+"\" type=\"date\" name=\"fechaInicio"+numFech+"\" class=\"form-control\" placeholder=\"fechaInicio\" required/></div>");
                                out.println("</div><br>");
                                //out.println("</div>");
                            }
                            ///////////////////////////////////////////////////////////////////////////////
                            //////////////////////Tipo Numerico////////////////////////////////////////////
                            ///////////////////////////////////////////////////////////////////////////////
                            if(listaP.get(j).getCodigo_tipo_pregunta()==8)
                            {
                                numN++;
                                out.println("<div class=\"col-md-3\"></div>");
                                out.println("<div class=\"col-md-6\"><input id=\"valor\" type=\"text\" onblur=\"validarNumero()\" name=\"num"+numN+"\" class=\"form-control\"/></div>");
                                out.println("</div>");
                            }
                            ////////////////////////////////////////////////////////////////////////////////
                            if(listaP.get(j).getCodigo_tipo_pregunta()==4)
                            {
                                out.println("</div>");
                                out.println("<div class=\"row\">");
                                out.println("<div class=\"col-md-3\"></div>");
                                ResultSet rs2 = co.prepareStatement("SELECT * FROM UTIC.UZGTMATRIZ WHERE codigo_UZGTPREGUNTAS = '"+listaP.get(j).getCodigo_preguntas()+"'order by codigo_uzgtmatriz ASC").executeQuery();
                                LinkedList<Matriz> ListaMatriz = new LinkedList<Matriz>();
                                LinkedList<Cabecera> ListaCabeceras = new LinkedList<Cabecera>();     
                                while(rs2.next())
                                {
                                    Matriz Mat = new Matriz(rs2.getInt(1),rs2.getInt(2),rs2.getInt(3),rs2.getInt(4),rs2.getInt(5),rs2.getInt(6),rs2.getString(7));
                                    ListaMatriz.add(Mat);                
                                }
                                rs2.close();
                                int mat = ListaMatriz.getFirst().getCodigo_matriz();
                                int filas = ListaMatriz.getFirst().getFila()+1;
                                int columnas = ListaMatriz.getFirst().getColumna()+1;
                                ResultSet rs3 = co.prepareStatement("SELECT * FROM UTIC.UZGTCABECERAS WHERE codigo_UZGTMATRIZ = '"+mat+"' order by codigo_uzgtcabezera ASC").executeQuery();
                                while(rs3.next())
                                {
                                    Cabecera Cab = new Cabecera(rs3.getInt(1),rs3.getInt(2),rs3.getString(3),rs3.getInt(4),rs3.getInt(5));
                                    ListaCabeceras.add(Cab);                
                                }
                                rs3.close();
                                out.println("<div class=\"col-md-6 table-responsive\"><table class=\"table table-bordered\">");
                                int puntero=0;
                                for(int n=0;n<filas;n++)
                                {
                                    out.println("<tr>");
                                    for(int m=0;m<columnas;m++)
                                    {
                                        
                                            if( puntero <ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX()== n && ListaCabeceras.get(puntero).getPosicionY()== m)
                                            {
                                                out.println("<th>"+ListaCabeceras.get(puntero).getValor_cabecera()+"</th>");
                                                puntero++;
                                            }
                                            else
                                            {
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
                
                out.println("<div class=\"row\">");
                out.println("<br><div class=\"col-md-4\"></div>");
                out.println("<div class=\"col-md-4\"><center><button class=\"btn btn-default\" type=\"text\" name=\"Submit\" value='"+Cod+"'>Guardar</button></center></div>"); 
                out.println("</div>");
                con.closeConexion();

            %>
        </div>
        <script type="text/javascript">
        function info() {
        pulsado = document.elegir.radio;
        for (i=0; i<pulsado.length; i++) {
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
                Ventana_Impresion.document.write( ficha.innerHTML );
                Ventana_Impresion.document.close();
                Ventana_Impresion.print( );
                Ventana_Impresion.close();
            } 
         </script>
         <a class="glyphicon glyphicon-print alert alert-info" href="javascript:Imprimir_Contenido()" ></a>

        </form>
        </div>
	<%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>

