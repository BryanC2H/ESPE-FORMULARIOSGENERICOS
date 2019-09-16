<%@page import="espe.edu.ec.constant.ConstantesForm"%>
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
        <form name="descargar"  method="POST" action="downloadFileServlet" enctype="multipart/form-data">
            <br><div class="col-md-3"><center><button class="btn btn-success" type="submit" name="submit" value="61">Descargar</button></center></div>

        </form>
        <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>

