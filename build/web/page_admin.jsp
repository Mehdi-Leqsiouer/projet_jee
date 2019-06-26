<%-- 
    Document   : page_admin
    Created on : 18 juin 2019, 19:21:41
    Author     : Leqsi
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <script src="jquery.js"></script>
        <title>Jeux - Admin</title>
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
            } else if (session.getAttribute("role").equals("utilisateur")) {
                response.sendRedirect("jeux_user.jsp");
            } else {

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
                try {
                    String sel = "SELECT * from somme order by id_lancer";
                    String somme = "select sum(compteur) res from somme";

                    PreparedStatement st = conn.prepareStatement(sel);
                    PreparedStatement st2 = conn.prepareStatement(somme);
                //st.setString(1, "'"+login+"'");
                    //st.setString(2, "'"+mdp+"'");
                    ResultSet res = st.executeQuery();
                    ResultSet res2 = st2.executeQuery();
                    String total = "";
                    if (res2.next()) {
                        total = res2.getString("res");
                    }
                    int total_partie = Integer.parseInt(total);

                    int[] tab_parties = new int[100];
                    int i = 0;
                    int sum = 0;

                    out.println("<div class='container-fluid mt-3'><div class='container'><table class='table'> <thead class='thead-dark'> <tr> <th scope='col'> Nombre de lancers</th> <th scope='col'>Nombre de parties</th> <th scope='col'>Fréquence </th></tr><thead>");
                    while (res.next()) {
                        String nb_lancer = res.getString("compteur");
                        String id_lancer = res.getString("id_lancer");
                        int lancer_cptr = Integer.parseInt(nb_lancer);
                        int lancer_id = Integer.parseInt(id_lancer);
                        sum += lancer_cptr*lancer_id;
                        //3 chiffres après la virgule
                        double frequence = (double) lancer_cptr / total_partie;
                        DecimalFormat fr = new DecimalFormat();
                        fr.setMaximumFractionDigits(3);
                        out.println("<tr>");
                        out.println("<td scope='row'>" + lancer_id + "</td><td scope='row'>" + lancer_cptr + "</td><td scope='row'>" + fr.format(frequence) + "</td>");
                        out.println("</tr>");
                        tab_parties[i] = lancer_cptr;
                        i++;
                    }
                    out.println("</table>");
                    out.println("</br>");
                    DecimalFormat format = new DecimalFormat();
                    format.setMaximumFractionDigits(3);
                    double moyenne = (double) sum / total_partie;

                    out.println("<button class='btn btn-dark' id='bouton' type='submit'>Calculer moyenne</button>");

                    out.println("<p id = 'moyenne' style='display:none;'>Moyenne : " + format.format(moyenne)+ "</p>");
                }
                catch(Exception e){
                    out.println("Aucune partie n'a été effectuée");
                }
            }
        %>

        <script>
            $(document).ready(function () {
                $("#bouton").click(function () {
                    $("#moyenne").show();
                });
            });

        </script>  
        <a href="deconnexion.jsp" class="btn btn-dark">Se déconnecter</a>
        </div></div>
        <br>
        <br>
        <div class="fixed-bottom bg-dark h-55 p-10 text-white">
            <p class="text-center">Un projet de Mehdi Leqsiouer, Florian Marques et Victorien Gbaguidi</p>
        </div>
    </body>
</html>
