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
        <h1>Page de connexion</h1>
        <form action = "connexion.jsp" method="POST">
            Login : <input type ="text" name="login" placeholder="Entrez votre login"/><br>
            Password : <input type ="password" name ="password" placeholder="Entrez votre mdp"/><br>
            
            <input type="submit" name ="submit" value="Submit"/>
        </form>
        
    </body>
</html>
