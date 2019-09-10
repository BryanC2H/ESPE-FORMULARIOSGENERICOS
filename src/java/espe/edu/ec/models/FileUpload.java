/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package espe.edu.ec.models;

import espe.edu.ec.connection.DB;
import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.swing.JOptionPane;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUpload extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String message = "";

        HttpSession session = request.getSession();

        try {
            DB con = DB.getInstancia();
            Connection co = con.getConnection();
            LinkedList<Formulario> listaF = new LinkedList<Formulario>();
            LinkedList<Grupo> listaG = new LinkedList<Grupo>();
            LinkedList<Preguntas> listaP = new LinkedList<Preguntas>();
            LinkedList<TipoPreguntas> listaTP = new LinkedList<TipoPreguntas>();
            LinkedList<Valores> listaV = new LinkedList<Valores>();
            LinkedList<Respuestas> listaR = new LinkedList<Respuestas>();
            LinkedList<FormPersona> listaFP = new LinkedList<FormPersona>();
            int usPidm = Integer.parseInt(request.getParameter("param"));

            int codFP = 0;
            String NombreF = request.getParameter("Submit");
            int Cod = Integer.parseInt(NombreF);
            //JOptionPane.showMessageDialog(null, "PIDM "+usPidm);
            ResultSet rs = co.prepareStatement("SELECT * FROM UTIC.UZGTFORMULARIOS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "'").executeQuery();
            while (rs.next()) {
                Formulario F = new Formulario();
                F.setCodigo_formulario(rs.getInt(1));
                F.setNombre_formulario(rs.getString(2));
                F.setDescripcion_formulario(rs.getString(3));
                F.setFecha_formulario(rs.getDate(4));
                F.setObjetivo_formulario(rs.getString(5));
                F.setBase_formulario(rs.getString(6));
                F.setEstadoLlenado(rs.getString(11));
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

            rs = co.prepareStatement("SELECT * FROM UTIC.UZGTRESPUESTAS WHERE codigo_UZGTFORMULARIOS = '" + Cod + "' AND SPRIDEN_PIDM=" + usPidm + " order by codigo_UZGTRESPUESTAS ASC").executeQuery();
            while (rs.next()) {
                Respuestas res = new Respuestas();
                res.setPidm_usuario(usPidm);
                res.setCodigo_persona(rs.getInt(2));
                res.setCodigo_formulario(rs.getInt(3));
                res.setCodigo_grupo(rs.getInt(4));
                res.setCodigo_preguntas(rs.getInt(5));
                res.setCodigo_Respuestas(rs.getInt(6));
                res.setValor_Respuestas(rs.getString(7));
                res.setIteracionRespuesta(rs.getInt(9));
                res.setFecha_crea(rs.getDate(10));
                res.setUsua_crea(rs.getString(11));
                listaR.add(res);
            }
            rs.close();
            co.close();
            co = con.getConnection();
            //SELECT DEL CODIGO FORMULARIO_PERSONA
            String estadoLL = null;
            ResultSet rs1 = co.prepareStatement("SELECT CODIGO_UZGTFORMULARIOS_PERSONA,UZGTFORMULARIOS_ESTADO_LLENADO FROM UTIC.UZGTFORMULARIO_PERSONA WHERE codigo_UZGTFORMULARIOS= '" + Cod + "' AND SPRIDEN_PIDM=" + usPidm).executeQuery();
            while (rs1.next()) {
                FormPersona fp = new FormPersona();
                fp.setCodFormP(rs1.getInt(1));
                fp.setEstadoLlenado(rs1.getString(2));
                codFP = rs1.getInt(1);
                estadoLL = rs1.getString(2);
                listaFP.add(fp);

            }
            rs1.close();
            rs1.clearWarnings();
            //JOptionPane.showMessageDialog(null,"cf: " Cod+"pidm: "+usPidm+" "+listaFP.getFirst().getCodFormP()+listaFP.getFirst().getEstadoLlenado() +" VALE "+ listaFP.getFirst().getCodFormP() + estadoLL);
            //System.out.println("imprime prro");
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //System.out.println("pasa selects");

            /////////////////////////////////////////////////////////////////////////////////////
            request.setCharacterEncoding("UTF-8");
            //int codR=listaR.getLast().getCodigo_Respuestas();
            int codR;
            if (listaR.isEmpty()) {
                codR = 1;
            } else {
                codR = listaR.getLast().getCodigo_Respuestas() + 1;
            }
            request.setCharacterEncoding("UTF-8");
            int numT = 0;
            int numR = 0;
            int numC = 0;
            int numL = 0;
            int numFech = 0;//num fecha
            int numN = 0;
            int numA = 0;
            int codPre;
            int numM = 0;
            int numDC = 0;
            int contRM = 0;
            int contC = 0;
            //ingreso respuestas
            ///grupo
            //  JOptionPane.showMessageDialog(null, "Tipo: "+listaF.getFirst().getTipoFormulario());
            /*FORMULARIOS NO MODIFICABLES*/
            if (listaF.getFirst().getEstadoLlenado().equals("N") && listaFP.getFirst().getEstadoLlenado().equals("N")) {
                for (int i = 0; i < listaG.size(); i++) {
                    ////////////////////////////////////////////////////////////////////////////////////
                    //////////////////////RESPUESTAS/////////////////////////////////////////////////////
                    for (int j = 0; j < listaP.size(); j++) {
                        if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {
                            /*RESPUESTAS DATOS COMUNES*/
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 9) {

                                try {
                                    numDC++;
                                    String num = "text" + numDC;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num));
                                    ps.setInt(8, 0);
                                  
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println("Error en tipo texto " + ex.getMessage());
                                }

                            }/*FIN IF DATO COMUNES*/
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {

                                try {
                                    numT++;
                                    String num = "valor" + numT;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num));
                                    ps.setInt(8, 0);
                                    
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            }
                            /////////////////////////////////////////////////////////////////////////////////////////////
                            ////////////////////CHECKBOX/////////////////////////////////////////////////////////////////
                            ////////////////////////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                numC++;
                                //for(int k=0; k<1;k++)
                                //{
                                //if(listaV.get(k).getCodigo_Preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] select = request.getParameterValues("seleccion" + numC);
                                for (String tempSelect : select) {
                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        java.util.Date date = new java.util.Date();
                                        long t = date.getTime();
                                        java.sql.Date sqlDate = new java.sql.Date(t);
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelect);
                                        ps.setInt(8, 0);
                                       
                                        //codPre++;//sube codigo pregunta
                                        codR++;
                                        ps.executeUpdate();

                                    } catch (Exception ex) {
                                        out.println(ex);
                                    }

                                }
                                //}
                                //}
                            }
                            ////////////////////////////////////////////////////////////////////////////
                            //////////////////RADIO////////////////////////////////////////////////////
                            ///////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                numR++;
                                //out.println("</div>");
                                //for(int k=0; k<;k++)
                                //{

                                //if(listaP.get(i).getCodigo_preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] selecte = request.getParameterValues("radio" + numR);
                                for (String tempSelecte : selecte) {

                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        java.util.Date date = new java.util.Date();
                                        long t = date.getTime();
                                        java.sql.Date sqlDate = new java.sql.Date(t);
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelecte);
                                        ps.setInt(8, 0);
                                        
                                        codR++;
                                        ps.executeUpdate();
                                        //numR++;
                                    } catch (Exception ex) {
                                        out.print(ex.getMessage());
                                    }

                                }
                                //}
                                //}
                            }
                            ///////////////////////////////////////////////////////////////////////
                            /////////////////////////////COMBO BOX////////////////////////////////
                            ///////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                numL++;
                                //out.println("</div>");
                                //for(int k=0; k<;k++)
                                //{

                                //if(listaP.get(i).getCodigo_preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] selecte = request.getParameterValues("lista" + numL);
                                for (String tempSelecte : selecte) {

                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        java.util.Date date = new java.util.Date();
                                        long t = date.getTime();
                                        java.sql.Date sqlDate = new java.sql.Date(t);
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelecte);
                                        ps.setInt(8, 0);
                                      
                                        codR++;
                                        ps.executeUpdate();
                                        //numR++;
                                    } catch (Exception ex) {
                                        out.print(ex.getMessage());
                                    }

                                }
                                //}
                                //}
                            }
                            ///////////////////////////////////////
                            //ARCHIVOS
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 6) {

                                try {

                                    numA++;
                                    InputStream inputStream = null; // input stream of the upload file

                                    // obtains the upload file part in this multipart request
                                    Part filePart = request.getPart("archivo" + numA);
                                    String nombre = request.getParameter("fileN");
                                    if (filePart != null) {
                                        // prints out some information for debugging
                                        System.out.println(filePart.getName());
                                        System.out.println(filePart.getSize());
                                        System.out.println(filePart.getContentType());

                                        // obtains input stream of the upload file
                                        inputStream = filePart.getInputStream();

                                    }

                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTARCHIVO_valor, uzgtrespuestas_iteracion, uzgtmime)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, nombre);
                                    //ps.setString(7, filePart.getSubmittedFileName());
                                    ps.setBlob(8, filePart.getInputStream(), filePart.getSize());
                                    ps.setInt(9, 0);
                                    ps.setString(10, filePart.getContentType());
                                
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            }//fin ciclo numerico
                            /////////////////////////////////////////////////////////////////////////
                            /////////////////////FECHA GUARDAR///////////////////////////////////////
                            /////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 7) {

                                try {
                                    numFech++;
                                    String num = "fechaInicio" + numFech;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num + ""));
                                    ps.setInt(8, 0);
                                    
                                    //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            }//fin ciclo fecha
                            ////////////////////////////////////////////////////////////////////
                            //////////////////////////////TIPO NUMERICO/////////////////////////
                            ////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 8) {

                                try {
                                    numN++;
                                    String num = "num" + numN;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num + ""));
                                    ps.setInt(8, 0);
                                 
                                    //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            }//fin ciclo numerico
                            /*
                                        
                                         if(listaP.get(j).getCodigo_tipo_pregunta()==8)
                                        {

                                            try
                                            {
                                            numN++;
                                            String num="num"+numN;
                                            PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor,UZGTRESPUESTAS_FECHA_CREA,UZGTRESPUESTAS_USUA_CREA)"
                                            + " VALUES (?,?,?,?,?,?,?,?,?)");
                                            java.util.Date date = new java.util.Date();
                                            long t = date.getTime();
                                            java.sql.Date sqlDate = new java.sql.Date(t);
                                            ps.setInt(1, usPidm);
                                            ps.setInt(2, listaFP.getFirst().getCodFormP());
                                            ps.setInt(3, Cod);
                                            ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                            ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                            ps.setInt(6, codR);
                                            ps.setString(7, request.getParameter(num+""));
                                            ps.setDate(8, sqlDate);
                                            ps.setInt(9, usPidm);
                                            //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                            codR++;
                                            ps.executeUpdate();

                                            }
                                            catch (Exception ex)
                                            {
                                                out.println(ex);
                                            }

                                        }fin ciclo numerico
                             */

/////////////////////////////////////////MATRIZ
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 4) {
                                numM++;
                                //contador++ ;
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
                                //out.println("<div class=\"col-md-6 table-responsive\"><table class=\"table table-bordered\" name=\"matriz"+numM+"\">");

                                int puntero = 0;

                                //String num = request.getParameter("matriz"+numM);
                                //int contador = Integer.parseInt(num);
                                //String aux="matriz"+numM+contador;
                                //JOptionPane.showMessageDialog(null,request.getParameter(aux)+contador);
                                for (int n = 0; n < filas; n++) {
                                    for (int m = 0; m < columnas; m++) {

                                        if (puntero < ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX() == n && ListaCabeceras.get(puntero).getPosicionY() == m) {
                                            //out.println("<th>"+ListaCabeceras.get(puntero).getValor_cabecera()+"</th>");
                                            puntero++;
                                        } else {
                                            if (n == 0 && m == 0) {
                                                //out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Texto\"' disabled></td>");
                                            } else {
                                                //JOptionPane.showMessageDialog(null, request.getParameter("Texto"+contRM));
                                                try {
                                                    //numN++;
                                                    //String num="num"+numN;
                                                    //JOptionPane.showMessageDialog(null,request.getParameter("Texto"+contRM));
                                                    contRM++;
                                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION, CODIGO_UZGTCABECERA, CODIGO_UZGTMATRIZ, CODIGO_POSICIONX, CODIGO_POSICIONY)"
                                                            + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
                                                    java.util.Date date = new java.util.Date();
                                                    long t = date.getTime();
                                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                                    ps.setInt(1, usPidm);
                                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                                    ps.setInt(3, Cod);
                                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                                    ps.setInt(6, codR);
                                                    ps.setString(7, request.getParameter("Texto" + contRM));
                                                    ps.setInt(8, 0);
                                                    ps.setInt(9, ListaCabeceras.get(puntero - 1).getCodigo_cabecera());
                                                    ps.setInt(10, ListaCabeceras.get(puntero - 1).getCodigo_matriz());
                                                    ps.setInt(11, ListaCabeceras.get(puntero - 1).getPosicionX());
                                                    ps.setInt(12, m);
                                                   
                                                    //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                                    codR++;
                                                    contC++;
                                                    ps.executeUpdate();

                                                } catch (Exception ex) {
                                                    out.println(ex);
                                                }
                                            }
                                        }
                                    }
                                    //out.println("</tr>");
                                }
                                //out.println("</table></div>");
                                //out.println("</div>");
                            }//FIN IF MATRIZ
                        }
                    }
                }//for para guardar respuestas
                java.util.Date date = new java.util.Date();
                long t = date.getTime();
                java.sql.Date sqlDate = new java.sql.Date(t);
                co.prepareStatement("UPDATE UZGTFORMULARIO_PERSONA SET UZGTFORMULARIOS_ESTADO_LLENADO ='L' WHERE CODIGO_UZGTFORMULARIOS =" + Cod + " AND SPRIDEN_PIDM=" + usPidm).executeUpdate();
               
          
            }//if para formularios no modificables (llenado unico)

            //FORMULARIO MODIFICABLE
            if (listaF.getFirst().getEstadoLlenado().equals("M")) {
                for (int i = 0; i < listaG.size(); i++) {
                    ////////////////////////////////////////////////////////////////////////////////////
                    //////////////////////RESPUESTAS/////////////////////////////////////////////////////
                    for (int j = 0; j < listaP.size(); j++) {
                        if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {

                            /*RESPUESTAS DATOS COMUNES*/
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 9) {

                                try {
                                    numDC++;
                                    String num = "text" + numDC;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num));
                                    ps.setInt(8, 0);
                                
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println("Error en tipo texto " + ex.getMessage());
                                }

                            }/*FIN IF DATO COMUNES*/


                            if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {

                                try {
                                    numT++;
                                    String num = "valor" + numT;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");

                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num));
                                    ps.setInt(8, 0);
                                    
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            }
                            /////////////////////////////////////////////////////////////////////////////////////////////
                            ////////////////////CHECKBOX/////////////////////////////////////////////////////////////////
                            ////////////////////////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                numC++;
                                //for(int k=0; k<1;k++)
                                //{
                                //if(listaV.get(k).getCodigo_Preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] select = request.getParameterValues("seleccion" + numC);
                                for (String tempSelect : select) {
                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        java.util.Date date = new java.util.Date();
                                        long t = date.getTime();
                                        java.sql.Date sqlDate = new java.sql.Date(t);
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelect);
                                        ps.setInt(8, 0);
                                       
                                        //codPre++;//sube codigo pregunta
                                        codR++;
                                        ps.executeUpdate();

                                    } catch (Exception ex) {
                                        out.println(ex);
                                    }

                                }
                                //}
                                //}
                            }
                            ////////////////////////////////////////////////////////////////////////////
                            //////////////////RADIO////////////////////////////////////////////////////
                            ///////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                numR++;
                                //out.println("</div>");
                                //for(int k=0; k<;k++)
                                //{

                                //if(listaP.get(i).getCodigo_preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] selecte = request.getParameterValues("radio" + numR);
                                for (String tempSelecte : selecte) {

                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        java.util.Date date = new java.util.Date();
                                        long t = date.getTime();
                                        java.sql.Date sqlDate = new java.sql.Date(t);
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelecte);
                                        ps.setInt(8, 0);
                                      
                                        codR++;
                                        ps.executeUpdate();
                                        //numR++;
                                    } catch (Exception ex) {
                                        out.print(ex.getMessage());
                                    }

                                }
                                //}
                                //}
                            }
                            ///////////////////////////////////////////////////////////////////////
                            /////////////////////////////COMBO BOX////////////////////////////////
                            ///////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                numL++;
                                //out.println("</div>");
                                //for(int k=0; k<;k++)
                                //{

                                //if(listaP.get(i).getCodigo_preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] selecte = request.getParameterValues("lista" + numL);
                                for (String tempSelecte : selecte) {

                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        java.util.Date date = new java.util.Date();
                                        long t = date.getTime();
                                        java.sql.Date sqlDate = new java.sql.Date(t);
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelecte);
                                        ps.setInt(8, 0);
                                        
                                        codR++;
                                        ps.executeUpdate();
                                        //numR++;
                                    } catch (Exception ex) {
                                        out.print(ex.getMessage());
                                    }

                                }
                                //}
                                //}
                            }
                            ///////////////////////////////////////
                            //ARCHIVOS
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 6) {

                                try {

                                    numA++;
                                    InputStream inputStream = null; // input stream of the upload file

                                    // obtains the upload file part in this multipart request
                                    Part filePart = request.getPart("archivo" + numA);
                                    String nombre = request.getParameter("fileN");
                                    if (filePart != null) {
                                        // prints out some information for debugging
                                        System.out.println(filePart.getName());
                                        System.out.println(filePart.getSize());
                                        System.out.println(filePart.getContentType());

                                        // obtains input stream of the upload file
                                        inputStream = filePart.getInputStream();

                                    }

                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTARCHIVO_valor, uzgtrespuestas_iteracion,uzgtmime)"
                                            + " VALUES (?,?,?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);

                                    // ps.setString(7, filePart.getName());
                                    //ps.setString(7, filePart.getSubmittedFileName());
                                    ps.setString(7, nombre);
                                    //ps.setString(7, filePart.getSubmittedFileName());

                                    ps.setBlob(8, filePart.getInputStream(), filePart.getSize());
                                    ps.setInt(9, 0);
                                    ps.setString(10, filePart.getContentType());
                                    

                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            }//fin ciclo numerico
                            /////////////////////////////////////////////////////////////////////////
                            /////////////////////FECHA GUARDAR///////////////////////////////////////
                            /////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 7) {

                                try {
                                    numFech++;
                                    String num = "fechaInicio" + numFech;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num + ""));
                                    ps.setInt(8, 0);
                                   
                                    //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            }//fin ciclo fecha
                            ////////////////////////////////////////////////////////////////////
                            //////////////////////////////TIPO NUMERICO/////////////////////////
                            ////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 8) {

                                try {
                                    numN++;
                                    String num = "num" + numN;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, uzgtrespuestas_iteracion)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    java.util.Date date = new java.util.Date();
                                    long t = date.getTime();
                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num + ""));
                                    ps.setInt(8, 0);
                                    
                                    //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            }//fin ciclo numerico
                            //LISTA MATRIZ
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 4) {
                                //JOptionPane.showMessageDialog(null, "Entra a matriz modificable ingreso: ");
                                numM++;
                                //contador++ ;
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
                                //out.println("<div class=\"col-md-6 table-responsive\"><table class=\"table table-bordered\" name=\"matriz"+numM+"\">");

                                int puntero = 0;

                                //String num = request.getParameter("matriz"+numM);
                                //int contador = Integer.parseInt(num);
                                //String aux="matriz"+numM+contador;
                                //JOptionPane.showMessageDialog(null,request.getParameter(aux)+contador);
                                for (int n = 0; n < filas; n++) {
                                    for (int m = 0; m < columnas; m++) {

                                        if (puntero < ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX() == n && ListaCabeceras.get(puntero).getPosicionY() == m) {
                                            //out.println("<th>"+ListaCabeceras.get(puntero).getValor_cabecera()+"</th>");
                                            puntero++;
                                        } else {
                                            if (n == 0 && m == 0) {
                                                //out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Texto\"' disabled></td>");
                                            } else {
                                                //JOptionPane.showMessageDialog(null, request.getParameter("Texto"+contRM));
                                                try {
                                                    //numN++;
                                                    //String num="num"+numN;
                                                    //JOptionPane.showMessageDialog(null,request.getParameter("Texto"+contRM));
                                                    contRM++;
                                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION, CODIGO_UZGTCABECERA, CODIGO_UZGTMATRIZ, CODIGO_POSICIONX, CODIGO_POSICIONY)"
                                                            + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
                                                    java.util.Date date = new java.util.Date();
                                                    long t = date.getTime();
                                                    java.sql.Date sqlDate = new java.sql.Date(t);
                                                    ps.setInt(1, usPidm);
                                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                                    ps.setInt(3, Cod);
                                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                                    ps.setInt(6, codR);
                                                    ps.setString(7, request.getParameter("Texto" + contRM));
                                                    ps.setInt(8, 0);
                                                    ps.setInt(9, ListaCabeceras.get(puntero - 1).getCodigo_cabecera());
                                                    ps.setInt(10, ListaCabeceras.get(puntero - 1).getCodigo_matriz());
                                                    ps.setInt(11, ListaCabeceras.get(puntero - 1).getPosicionX());
                                                    ps.setInt(12, m);
                                                    
                                                    //JOptionPane.showMessageDialog(null, "Valor: "+request.getParameter("Texto"+contRM));
                                                    codR++;
                                                    contC++;
                                                    ps.executeUpdate();

                                                } catch (Exception ex) {
                                                    out.println(ex);
                                                }
                                            }
                                        }
                                    }
                                    //out.println("</tr>");
                                }
                                //out.println("</table></div>");
                                //out.println("</div>");
                            }//FIN IF MATRIZ

                        }
                    }
                }//for para guardar respuestas
                java.util.Date date = new java.util.Date();
                long t = date.getTime();
                java.sql.Date sqlDate = new java.sql.Date(t);
                co.prepareStatement("UPDATE UZGTFORMULARIO_PERSONA SET UZGTFORMULARIOS_ESTADO_LLENADO ='L' WHERE CODIGO_UZGTFORMULARIOS =" + Cod + " AND SPRIDEN_PIDM=" + usPidm).executeUpdate();
                
            }//if para formularios modificables (varias modificaciones)

            /*FORMULARIOS SECUENCIALES*/
            //JOptionPane.showMessageDialog(null, listaF.getFirst().getTipoFormulario()+" :V");
            if (listaF.getFirst().getEstadoLlenado().equals("S")) {
                //JOptionPane.showMessageDialog(null, "Entra en el if secuencial: "+ listaFP.getFirst().getEstadoLlenado());
                int iteracion = 0;
                if (listaFP.getFirst().getEstadoLlenado().equals("N")) {
                    iteracion = 1;
                    //JOptionPane.showMessageDialog(null, "entra en iteracion "+ iteracion+ " ESTADO "+listaFP.getFirst().getEstadoLlenado());

                } else {
                    //JOptionPane.showMessageDialog(null, listaF.getFirst().getTipoFormulario()+" :V");
                    //JOptionPane.showMessageDialog(null, "entra en else Iteracion "+listaR.getLast().getIteracionRespuesta());
                    iteracion = listaR.getLast().getIteracionRespuesta() + 1;
                    //JOptionPane.showMessageDialog(null, "entra en iteracion "+ iteracion+ " ESTADO "+listaFP.getFirst().getEstadoLlenado());

                }
                //iteracion=listaR.getFirst().getIteracionRespuesta();
                //JOptionPane.showMessageDialog(null, "Entra en el if secuencial: "+ listaFP.getFirst().getEstadoLlenado()+ "iteracion" + iteracion);

                for (int i = 0; i < listaG.size(); i++) {

                    //JOptionPane.showMessageDialog(null, "Entra en el if secuencial: "+ listaFP.getFirst().getEstadoLlenado()+ "iteracion" + iteracion);
                    ////////////////////////////////////////////////////////////////////////////////////
                    //////////////////////RESPUESTAS/////////////////////////////////////////////////////
                    for (int j = 0; j < listaP.size(); j++) {
                        //JOptionPane.showMessageDialog(null, "M "+ listaP.get(j).getCodigo_grupo()+ "N" + listaG.get(i).getCodigo_grupo());

                        if (listaP.get(j).getCodigo_grupo() == listaG.get(i).getCodigo_grupo()) {

                            /*RESPUESTAS DATOS COMUNES*/
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 9) {

                                try {
                                    numDC++;
                                    String num = "text" + numDC;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num));

                                    ps.setInt(8, iteracion);
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println("Error en tipo texto " + ex.getMessage());
                                }

                            }/*FIN IF DATO COMUNES*/


                            //////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 1) {

                                try {
                                    numT++;
                                    String num = "valor" + numT;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num));

                                    ps.setInt(8, iteracion);
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println("Error en tipo texto " + ex.getMessage());
                                }

                            }
                            /////////////////////////////////////////////////////////////////////////////////////////////
                            ////////////////////CHECKBOX/////////////////////////////////////////////////////////////////
                            ////////////////////////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 2) {
                                numC++;
                                //for(int k=0; k<1;k++)
                                //{
                                //if(listaV.get(k).getCodigo_Preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] select = request.getParameterValues("seleccion" + numC);
                                for (String tempSelect : select) {
                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());

                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelect);
                                        ps.setInt(8, iteracion);
                                        //codPre++;//sube codigo pregunta
                                        codR++;
                                        ps.executeUpdate();

                                    } catch (Exception ex) {
                                        out.println("Error tipo check " + ex.getMessage());
                                    }

                                }
                                //}
                                //}
                            }
                            ////////////////////////////////////////////////////////////////////////////
                            //////////////////RADIO////////////////////////////////////////////////////
                            ///////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 3) {
                                numR++;
                                //out.println("</div>");
                                //for(int k=0; k<;k++)
                                //{

                                //if(listaP.get(i).getCodigo_preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] selecte = request.getParameterValues("radio" + numR);
                                for (String tempSelecte : selecte) {

                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());

                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelecte);
                                        ps.setInt(8, iteracion);
                                        codR++;
                                        ps.executeUpdate();
                                        //numR++;
                                    } catch (Exception ex) {
                                        out.print("Error en Radio " + ex.getMessage());
                                    }

                                }
                                //}
                                //}
                            }
                            ///////////////////////////////////////////////////////////////////////
                            /////////////////////////////COMBO BOX////////////////////////////////
                            ///////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 5) {
                                numL++;
                                //out.println("</div>");
                                //for(int k=0; k<;k++)
                                //{

                                //if(listaP.get(i).getCodigo_preguntas()== listaP.get(j).getCodigo_preguntas())
                                //{
                                String[] selecte = request.getParameterValues("lista" + numL);
                                for (String tempSelecte : selecte) {

                                    try {

                                        PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                                + " VALUES (?,?,?,?,?,?,?,?)");
                                        ps.setInt(1, usPidm);
                                        ps.setInt(2, listaFP.getFirst().getCodFormP());
                                        ps.setInt(3, Cod);
                                        ps.setInt(4, listaG.get(i).getCodigo_grupo());

                                        ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                        ps.setInt(6, codR);
                                        ps.setString(7, tempSelecte);
                                        ps.setInt(8, iteracion);
                                        codR++;
                                        ps.executeUpdate();
                                        //numR++;
                                    } catch (Exception ex) {
                                        out.print("Error Combo" + ex.getMessage());
                                    }

                                }
                                //}
                                //}
                            }
                            ///////////////////////////////////////
                            //ARCHIVOS
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 6) {

                                try {

                                    numA++;
                                    InputStream inputStream = null; // input stream of the upload file

                                    // obtains the upload file part in this multipart request
                                    Part filePart = request.getPart("archivo" + numA);
                                    String nombre = request.getParameter("fileN");
                                    //JOptionPane.showMessageDialog(null, nombre);
                                    if (filePart != null) {
                                        // prints out some information for debugging
                                        System.out.println(filePart.getName());
                                        System.out.println(filePart.getSize());
                                        System.out.println(filePart.getContentType());

                                        // obtains input stream of the upload file
                                        inputStream = filePart.getInputStream();
                                        //JOptionPane.showMessageDialog(null,"CodFormulario Persona  "+listaFP.getFirst().getCodFormP());
                                    }

                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTARCHIVO_VALOR, UZGTRESPUESTAS_ITERACION,uzgtmime)"
                                            + " VALUES (?,?,?,?,?,?,?,?,?,?)");
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, nombre);
                                    ps.setBlob(8, filePart.getInputStream(), filePart.getSize());
                                    ps.setInt(9, iteracion);
                                    ps.setString(10, filePart.getContentType());
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println("Error en archivo " + ex.getMessage());
                                }

                            }//fin ciclo numerico
                            /////////////////////////////////////////////////////////////////////////
                            /////////////////////FECHA GUARDAR///////////////////////////////////////
                            /////////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 7) {

                                try {
                                    numFech++;
                                    String num = "fechaInicio" + numFech;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());

                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num + ""));
                                    //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                    ps.setInt(8, iteracion);
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println("Error Fecha " + ex.getMessage());
                                }

                            }//fin ciclo fecha
                            ////////////////////////////////////////////////////////////////////
                            //////////////////////////////TIPO NUMERICO/////////////////////////
                            ////////////////////////////////////////////////////////////////////
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 8) {

                                try {
                                    numN++;
                                    String num = "num" + numN;
                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION)"
                                            + " VALUES (?,?,?,?,?,?,?,?)");
                                    ps.setInt(1, usPidm);
                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                    ps.setInt(3, Cod);
                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                    ps.setInt(6, codR);
                                    ps.setString(7, request.getParameter(num + ""));
                                    //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                    ps.setInt(8, iteracion);
                                    codR++;
                                    ps.executeUpdate();

                                } catch (Exception ex) {
                                    out.println("Error tipo numerico" + ex.getMessage());
                                }

                            }//fin ciclo numerico
                            int contador = 0;

                            /////////////////////////////////////////MATRIZ
                            if (listaP.get(j).getCodigo_tipo_pregunta() == 4) {
                                numM++;
                                contador++;
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
                                //out.println("<div class=\"col-md-6 table-responsive\"><table class=\"table table-bordered\" name=\"matriz"+numM+"\">");

                                int puntero = 0;

                                //String num = request.getParameter("matriz"+numM);
                                //int contador = Integer.parseInt(num);
                                //String aux="matriz"+numM+contador;
                                //JOptionPane.showMessageDialog(null,request.getParameter(aux)+contador);
                                for (int n = 0; n < filas; n++) {
                                    for (int m = 0; m < columnas; m++) {

                                        if (puntero < ListaCabeceras.size() && ListaCabeceras.get(puntero).getPosicionX() == n && ListaCabeceras.get(puntero).getPosicionY() == m) {
                                            //out.println("<th>"+ListaCabeceras.get(puntero).getValor_cabecera()+"</th>");
                                            puntero++;
                                        } else {
                                            if (n == 0 && m == 0) {
                                                //out.println("<td><input type=\"text\" name=\"Texto\" placeholder=\"Texto\"' disabled></td>");
                                            } else {
                                                //JOptionPane.showMessageDialog(null, request.getParameter("Texto"+contRM));
                                                try {
                                                    //numN++;
                                                    //String num="num"+numN;
                                                    //JOptionPane.showMessageDialog(null,request.getParameter("Texto"+contRM));
                                                    contRM++;
                                                    PreparedStatement ps = co.prepareStatement("INSERT INTO UTIC.UZGTRESPUESTAS (SPRIDEN_PIDM, codigo_UZGTFORMULARIOS_PERSONA,codigo_UZGTFORMULARIOS,codigo_UZGTGRUPO,codigo_UZGTPREGUNTAS, codigo_UZGTRESPUESTAS, UZGTRESPUESTAS_valor, UZGTRESPUESTAS_ITERACION, CODIGO_UZGTCABECERA, CODIGO_UZGTMATRIZ, CODIGO_POSICIONX, CODIGO_POSICIONY)"
                                                            + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
                                                    ps.setInt(1, usPidm);
                                                    ps.setInt(2, listaFP.getFirst().getCodFormP());
                                                    ps.setInt(3, Cod);
                                                    ps.setInt(4, listaG.get(i).getCodigo_grupo());
                                                    ps.setInt(5, listaP.get(j).getCodigo_preguntas());
                                                    ps.setInt(6, codR);
                                                    ps.setString(7, request.getParameter("Texto" + contRM));
                                                    ps.setInt(8, iteracion);
                                                    ps.setInt(9, ListaCabeceras.get(puntero - 1).getCodigo_cabecera());
                                                    ps.setInt(10, ListaCabeceras.get(puntero - 1).getCodigo_matriz());
                                                    ps.setInt(11, ListaCabeceras.get(puntero - 1).getPosicionX());
                                                    ps.setInt(12, m);
                                                    //JOptionPane.showMessageDialog(null, request.getParameter(num+""));
                                                    codR++;
                                                    contC++;
                                                    ps.executeUpdate();

                                                } catch (Exception ex) {
                                                    out.println(ex);
                                                }
                                            }
                                        }
                                    }
                                    //out.println("</tr>");
                                }
                                //out.println("</table></div>");
                                //out.println("</div>");
                            }//FIN IF MATRIZ

                        }// cierre if de las respuestas
                    }
                }//for para guardar respuestas
                co.prepareStatement(" UPDATE UZGTFORMULARIO_PERSONA SET UZGTFORMULARIOS_ESTADO_LLENADO ='L'  WHERE CODIGO_UZGTFORMULARIOS ='" + Cod + "' AND SPRIDEN_PIDM=" + usPidm).executeUpdate();
                
            }//if para formularios secuenciales (ingreso de nuevas respuestas)

            message = "Se guardo correctamente";
            request.setAttribute("Message", message);
            co.close();
            con.closeConexion();

            //llamar al procedimiento para que se ejecute el workflow dependiente del tipo de formulario
            //  LlamadaWf lwf = new LlamadaWf();
            //  lwf.llamarWF(Cod, usPidm);
            // forwards to the message page
            getServletContext().getRequestDispatcher("/almacenarR.jsp").forward(request, response);
            session.invalidate();

        } catch (Exception e) {

            System.out.println("error   " + e.getMessage());
            message = "Error! No se guardó las respuestas";
            request.setAttribute("Message", message);
            // forwards to the message page

            getServletContext().getRequestDispatcher("/mostrarGRes.jsp").forward(request, response);

            session.invalidate();
            //  JOptionPane.showMessageDialog(null, message);
        }

    }

}
