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
        <title>Jeux - User</title>
    </head>
    <body>
        <form method="POST" action="action_jeux_user.jsp">
            <label>Choisissez votre nombre de parties</label>
            <select name="nb_part">
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
            </select>
            <input type="submit" value="Jouer !" />

        </form>
    </body>
</html>
