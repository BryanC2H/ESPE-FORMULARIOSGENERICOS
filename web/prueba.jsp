<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="espe.edu.ec.connection.DB2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
	

        <%             try {

        %>
        <h1>Hello World!</h1>
        <%
            DB2 con = DB2.getInstancia();
            Connection co = con.getConnection();
            ResultSet rs = co.prepareStatement("SELECT SFRSTCR_PIDM FROM SFRSTCR WHERE SFRSTCR_TERM_CODE = '201720' AND SFRSTCR_CRN = '1070'   ").executeQuery();
            co.close();
            con.closeConexion();
        %>
<%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());

            }
        %>
    </body>
</html>
