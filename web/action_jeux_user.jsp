<%-- 
    Document   : action_jeux_user
    Created on : 12 juin 2019, 09:57:13
    Author     : fmarques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <title>Action - Jeux User</title>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-dark bg-dark">
            <div class="d-flex justify-content-md-start">
                <img src="triangle.png" width="40" height="30" alt="Un triangle">
                <h6 class="text-white h4">Projet Triangle</h6>
            </div>
        </nav>
        <div class="container-fluid mt-3">
            <div class="container">
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Numéro Partie</th>
                            <th scope="col">Résultat</th>
                            <th scope="col">Nombre de lancers</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (session.getAttribute("role") == null) {
                                response.sendRedirect("index.jsp");
                            } else if (session.getAttribute("role").equals("administrateur")) {
                                response.sendRedirect("page_admin.jsp");
                            } else {
                                if (request.getParameter("submit") == null) {
                                    response.sendRedirect("jeux_user.jsp");
                                }

                                Connection conn = null;
                                Statement stmt = null;
                                try {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                } catch (Exception e) {
                                    out.print(e);
                                }

                                try {
                                    String jdbc = "jdbc:mysql://localhost:3306/alt7";
                                    String root = "alt7";
                                    String mdp = "alt7";
                                    conn = DriverManager.getConnection(jdbc, root, mdp);
                                    stmt = conn.createStatement();
                                } catch (Exception e) {
                                    out.print(e);
                                }

                                String nb_parties = request.getParameter("nb_part");
                                int nb_part = Integer.parseInt(nb_parties);
                                int[][] resultat;
                                boolean fin = false;
                                int cptr = 0;
                                int nb_lancer = 0;
                                int alea;
                                // mécanique du jeu
                                for (int i = 1; i <= nb_part; i++) {
                                    fin = false;
                                    cptr = 0;
                                    nb_lancer = 0;
                                    out.println("<tr><th scope='row'>" + i + "</th><td>");
                                    while (!fin) {
                                        alea = ((int) (Math.random() * 100) % 6) + 1;
                                        nb_lancer++;
                                        switch (cptr) {
                                            case 0:
                                                out.println("A");
                                                break;
                                            case 1:
                                                out.println("B");
                                                break;
                                        }
                                        if (alea == 5 || alea == 6) {
                                            cptr++;
                                        }
                                        if (cptr == 2) {
                                            out.println("C");
                                            out.println("</td><td>" + nb_lancer + "</td></tr>");
                                            fin = true;
                                        }
                                    }
                                    String joueur = (String) session.getAttribute("login");
                                    int lancer = nb_lancer;
                                    String ins = "INSERT INTO parties VALUES ('" + joueur + "'," + lancer + ")";
                                    stmt.executeUpdate(ins);

                                    String sel = "SELECT * from somme where id_lancer = " + lancer;

                                    PreparedStatement st = conn.prepareStatement(sel);
                                    //st.setString(1, "'"+login+"'");
                                    //st.setString(2, "'"+mdp+"'");
                                    ResultSet res = st.executeQuery();

                                    if (res.next()) {
                                        String lancer_stat = res.getString("compteur");
                                        int lancer_cptr = Integer.parseInt(lancer_stat);
                                        lancer_cptr++;
                                        String cptrIncr = "UPDATE somme set compteur = " + lancer_cptr + " where id_lancer = " + lancer;
                                        stmt.executeUpdate(cptrIncr);
                                    } else {
                                        String cptrNew = "INSERT INTO somme VALUES (" + lancer + "," + 1 + ") ";
                                        stmt.executeUpdate(cptrNew);
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
                <a href="jeux_user.jsp" class="btn btn-dark">Rejouer</a>
                <a href="deconnexion.jsp" class="btn btn-light">Me déconnecter</a>
            </div>
        </div>
                    <div class="fixed-bottom bg-dark h-55 p-10 text-white">
            <p class="text-center">Un projet de Mehdi Leqsiouer, Florian Marques et Victorien Gbaguidi</p>
        </div>
    </body>
</html>
