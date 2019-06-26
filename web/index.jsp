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
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <title>Accueil</title>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-dark bg-dark">
            <div class="d-flex justify-content-md-start">
                <img src="triangle.png" width="40" height="30" alt="Un triangle">
                <h6 class="text-white h4">Projet Triangle</h6>
            </div>
        </nav>
        <%
            if (session.getAttribute("role") != null) {
                if (session.getAttribute("role").equals("administrateur")) {
                    response.sendRedirect("page_admin.jsp");
                } else if (session.getAttribute("role").equals("utilisateur")) {
                    response.sendRedirect("jeux_user.jsp");
                }
            }
        %>
        <div class="container">
            <div class="container-fluid">
                <div class="jumbotron mt-5">
                    <h1 class="display-4 text-center">Bienvenue sur le jeu du triangle !</h1>
                    <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
                    <hr class="my-4">
                    <p>Connectez-vous pour jouer dès à présent !</p>
                    <form action = "connexion.jsp" method="POST">
                        <div class="form-row">
                            <label for="login">Login</label>
                            <input name="login" type="text" class="form-control" id="login" placeholder="Entrez votre login">
                        </div>
                        <div class="form-row">
                            <label for="password">Password</label>
                            <input name="password" type="password" class="form-control" id="password" placeholder="Entrez votre mot de passe">
                        </div>
                        <button type="submit" class="btn btn-dark btn-lg mt-2" name ="submit" value="Submit">Me connecter !</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="fixed-bottom bg-dark h-55 p-10 text-white">
            <p class="text-center">Un projet de Mehdi Leqsiouer, Florian Marques et Victorien Gbaguidi</p>
        </div>
    </body>
</html>
