<%-- 
    Document   : index
    Created on : 12 juin 2019, 08:55:14
    Author     : mleqsiou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("role") != null) {
                if (session.getAttribute("role").equals( "administrateur"))
                    response.sendRedirect("page_admin.jsp");
                else if (session.getAttribute("role").equals( "utilisateur"))
                    response.sendRedirect("jeux_user.jsp");
            }
            %>
        
        <h1>Page de connexion</h1>
        <fieldset>
            <legend>Connectez vous</legend>
        <form action = "connexion.jsp" method="POST">
            Login : <input type ="text" name="login" placeholder="Entrez votre login"/><br>
            Password : <input type ="password" name ="password" placeholder="Entrez votre mdp"/><br>
           
            
            <input type="submit" name ="submit" value="Submit"/>
        </form>
        </fieldset>
        
    </body>
</html>
