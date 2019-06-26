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
                    <p class="lead">Pour jouer, il vous suffit de cliquer sur le bouton "Jouer", il faut être user.<br>
                        Le but du jeu est de faire déplacer un mobile sur les 3 sommets d'un Triangle en partant du sommet A, puis passer par le B et arriver sur le C.<br>
                        Derrière ce bouton se passe plusieurs actions, un "dé" se lance :<br>
                        -Si le dé tombe sur 1, 2, 3 ou 4, le mobile reste sur place;<br>
                        -Si le dé tombe sur 5 ou 6, le dé se place d'une case seulement et ainsi de suite.<br><br>
                        Le "user" pourra jouer en choisissant son nombre de partie et ensuite visualiser son score.
                        L'"admin" pourra visualiser les parties du joueur, la fréquence sur le nombre de lancers qu'il réalise et calculer la moyenne de toutes ses parties.
                    </p>
                    <hr class="my-4">
                    <p>Connectez-vous pour jouer dès à présent !</p>
                    <form action = "connexion.jsp" method="POST">
                        <div class="form-row">
                            <label for="login">Nom d'utilisateur</label>
                            <input name="login" type="text" class="form-control" id="login" placeholder="Entrez votre nom d'utilisateur">
                        </div>
                        <div class="form-row">
                            <label for="password">Mot de passe</label>
                            <input name="password" type="password" class="form-control" id="password" placeholder="Entrez votre mot de passe">
                        </div>
                        <button type="submit" class="btn btn-secondary btn-lg mt-2" name ="submit" value="Submit">Se connecter !</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="fixed-bottom bg-dark h-55 p-10 text-white">
            <p class="text-center">Un projet de Mehdi Leqsiouer, Florian Marques et Victorien Gbaguidi</p>
        </div>
    </body>
</html>
