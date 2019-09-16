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
        <%
            String NombreF = request.getParameter("Submit");
            out.println("<p>"+NombreF+"</p>");
            %>
<%             } catch (Exception e) {
                System.out.println("error." + e.getMessage());
            }
        %>
    </body>
</html>
