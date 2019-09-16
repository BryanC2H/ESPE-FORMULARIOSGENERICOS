<%@page import="espe.edu.ec.constant.ConstantesForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <script>

        window.onload = function () {

            // Una vez cargada la página, el formulario se enviara automáticamente.
            //vent=window.open('','123','width=725,height=600,scrollbars=no,resizable=yes,status=yes,menubar=no,location=no');
            document.forms["Test"].submit();


        }

    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
        <%
            out.println(ConstantesForm.Css);
            out.println(ConstantesForm.js);
        %>
    
    </head>
    <body>
        <ul class="nav nav-tabs" role="tablist">

           
            <%

                try {
            %>
            <form name = "Test" action="LoginServlet" method="POST" target="_self">
                <%String PIDM = request.getParameter("param");
                    out.print("<div class=\"loader\"></div>");
                    out.print("<input type=\"hidden\" name=\"param\"  value='" + PIDM + "'>");

                %>
            </form>




        </ul>
        <%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
