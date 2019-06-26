<%-- 
    Document   : jeux_user
    Created on : 12 juin 2019, 09:53:53
    Author     : fmarques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <title>Jeux - User</title>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-dark bg-dark">
            <div class="d-flex justify-content-md-start">
                <img src="triangle.png" width="40" height="30" alt="Un triangle">
                <h6 class="text-white h4">Projet Triangle</h6>
            </div>
        </nav>
        <%
            if (session.getAttribute("role") == null) {
                response.sendRedirect("index.jsp");
            } else if (session.getAttribute("role").equals("administrateur")) {
                response.sendRedirect("page_admin.jsp");
            };

        %>

        <div class="container-fluid">
            <div class="container text-center mt-3">
                <form method="POST" action="action_jeux_user.jsp">
                    <div class="form-group d-flex justify-content-center flex-column">
                        <h5 class="card-title">Choisissez votre nombre de partie:</h5>
                        <select class="form-control w-25" name="nb_part">
                            <option selected>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                        </select>
                    </div>
                    <button class="btn btn-dark btn-lg mt-2" type="submit" name = "submit">Jouer !</button>
                    <a class="btn btn-light btn-lg mt-2" href="deconnexion.jsp">Se déconnecter</a>
                </form>
            </div>
        </div>
        <div class="fixed-bottom bg-dark h-55 p-10 text-white">
            <p class="text-center">Un projet de Mehdi Leqsiouer, Florian Marques et Victorien Gbaguidi</p>
        </div>
    </body>
</html>
