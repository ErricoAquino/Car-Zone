<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.UserBean" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Amministratore - Articoli Comprati</title>
    <link rel="stylesheet" href="css/style-ammricercaordini.css">
</head>
<body>
    <%@ include file="./fragment/header1.jsp" %>

    <div class="container">
        <h1>Utenti registrati</h1>
        <div class="search-container">
            <input type="text" id="searchBarUsers" onkeyup="searchFunction('users')" placeholder="Cerca per nome, cognome o email...">
        </div>
        <table id="itemsTableUsers">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<UserBean> users = (List<UserBean>) request.getAttribute("users");
                    if (users != null) {
                        for (UserBean u : users) {
                %>
                <tr>
                    <td data-label="Nome"><%= u.getNome() %></td>
                    <td data-label="Cognome"><%= u.getCognome() %></td>
                    <td data-label="Email"><%= u.getEmail() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">Nessun utente registrato trovato.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    
    <%@ include file="./fragment/footer.jsp" %>
</body>
</html>

