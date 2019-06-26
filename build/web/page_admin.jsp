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
        <script src="jquery.js"></script>
        <title>JSP Page</title>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-dark bg-dark">
            <div class="d-flex justify-content-md-start">
                <img src="triangle.png" width="40" height="30" alt="Un triangle">
                <h6 class="text-white h4">Projet Triangle</h6>
            </div>
        </nav>
        <h1>Page admin</h1>

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

                out.println("<table border='1'> <th> Nombre de lancers</th> <th>Nombre de parties</th> <th>Fréquence </th>");
                while (res.next()) {
                    String nb_lancer = res.getString("compteur");
                    String id_lancer = res.getString("id_lancer");
                    int lancer_cptr = Integer.parseInt(nb_lancer);
                    int lancer_id = Integer.parseInt(id_lancer);
                    //3 chiffres après la virgule
                    double frequence = (double) lancer_cptr / total_partie;
                    DecimalFormat fr = new DecimalFormat();
                    fr.setMaximumFractionDigits(3);
                    out.println("<tr>");
                    out.println("<td>" + lancer_id + "</td><td>" + lancer_cptr + "</td><td>" + fr.format(frequence) + "</td>");
                    out.println("</tr>");
                    tab_parties[i] = lancer_cptr;
                    i++;
                }
                out.println("</table>");
                out.println("</br>");

                out.println("<button id='bouton' type='submit'>Calculer moyenne</button>");

                out.println("<p id = 'moyenne' style='display:none;'>Moyenne : " + (double) total_partie / i + "</p>");

            }
        %>

        <script>
            $(document).ready(function () {
                $("#bouton").click(function () {
                    $("#moyenne").show();
                });
            });

        </script>  
        <a href="deconnexion.jsp">Se déconnecter</a>
        <div class="fixed-bottom bg-dark h-55 p-10 text-white">
            <p class="text-center">Un projet de Mehdi Leqsiouer, Florian Marques et Victorien Gbaguidi</p>
        </div>
    </body>
</html>
