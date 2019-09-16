<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>
    </head>
    <body>
        
        <%

            try {

        %> 
        <h1>Hello World!</h1>
        <%            String codigo = request.getParameter("cod");
            JOptionPane.showMessageDialog(null, "codigo: " + codigo);
        %>
        <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
