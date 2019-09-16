<%@page import="java.sql.Date"%>
<%@page import="espe.edu.ec.models.FormPersona"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Publicado</title>
    </head>
    <body>
         <%             try {
        %>

<% //base de datos de la que selecciona pidm's
           DB con = DB.getInstancia();
           Connection co = con.getConnection(); 
           String query=request.getParameter("query");//query para buscar pidms
           String nomF=request.getParameter("Submit");//codigo del formulario a ingresar
           int codF=Integer.parseInt(nomF);
           LinkedList<Integer> listaPIDM = new LinkedList<Integer>();
           LinkedList<FormPersona> listaFP = new LinkedList<FormPersona>();
           //seleccion de los pidm para guardarlos en un array
           ResultSet rs = co.prepareStatement(query).executeQuery();
           while(rs.next())
            {
                listaPIDM.add(rs.getInt(1));               
            }
            rs.close();
            con.closeConexion();
          /*  for(int i=0;i<listaPIDM.size();i++)
            {
                //ingreso en tabla saturn
                PreparedStatement ps = co.prepareStatement("INSERT INTO SATURN_SPRIDEN VALUES(?)");
                ps.setInt(1, listaPIDM.get(i));
                //ingreso en tabla codPersona
                PreparedStatement ps1 = co.prepareStatement("INSERT INTO SATURN_SPRIDEN VALUES(?,?,?,?)");
                ps1.setInt(1, listaPIDM.get(i));
                ps1.setInt(2, 1);
                ps1.setInt(3, codF);
                ps1.setDate(4, null);
            }*/
            
        %>
        <%
            //DB con = DB.getInstancia();
            //Connection co = con.getConnection();

        %>
 <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
