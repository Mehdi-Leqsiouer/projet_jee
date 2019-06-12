<%-- 
    Document   : deconnection
    Created on : 12 juin 2019, 10:04:41
    Author     : mleqsiou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Déconnexion</title>
    </head>
    <body>
        <%
            session.removeAttribute("role");
            session.invalidate();
            response.sendRedirect("index.jsp");            
            %>
    </body>
</html>
