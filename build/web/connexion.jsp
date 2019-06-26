<%-- 
    Document   : connexion
    Created on : 29 mai 2019, 09:52:59
    Author     : mleqsiou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connexion</title>
    </head>
    <body>
        <%
            if (session.getAttribute("role") != null) {
                if (session.getAttribute("role").equals("administrateur")) {
                    response.sendRedirect("page_admin.jsp");
                } else if (session.getAttribute("role").equals("utilisateur")) {
                    response.sendRedirect("jeux_user.jsp");
                }
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

            String login = request.getParameter("login");
            String mdp = request.getParameter("password");

            //String sel = "SELECT * from utilisateurs where login like '" + login + "' and password like '" + mdp + "'";
            String sel="SELECT * from utilisateurs where login like ? and password like ?";

            PreparedStatement st = conn.prepareStatement(sel);
            st.setString(1, login);

            st.setString(2, mdp);
            ResultSet res = st.executeQuery();

            if (res.next()) {
                String role = res.getString("role");
                session.setAttribute("role", role);
                session.setAttribute("login", login);
                if (role.equals("utilisateur")) {
                    response.sendRedirect("jeux_user.jsp");
                } else {
                    response.sendRedirect("page_admin.jsp");
                }
                //response.sendRedirect("intranet.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
