<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.List" import="model.UserBean" import="model.OrdiniBean" import="model.OrdiniDAODataSource, java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Amministratore - Articoli Comprati</title>
    <link rel="stylesheet" href="css/style-ammricercaordini.css">
    <script src="js/ammricercaordini.js"></script>
</head>
<body>

    <%@ include file= "./fragment/header1.jsp" %>  

    <div class="container">
        <h1>Ordini</h1>
        <div class="search-container">
            <input type="text" id="searchBarOrders" onkeyup="searchFunction('orders')" placeholder="Cerca per ID Account...">
            <div class="date">
                <input type="date" id="startDateOrders" onchange="searchFunction('orders')" placeholder="Data di inizio">
                <input type="date" id="endDateOrders" onchange="searchFunction('orders')" placeholder="Data di fine">
            </div>
        </div>
        <table id="itemsTableOrders">
            <thead>
                <tr>
                    <th>ID Ordine</th>
                    <th>ID Account</th>
                    <th>Prezzo</th>
                    <th>Articolo</th>
                    <th>Data</th>
                </tr>
            </thead>
            <tbody>
                <%
                OrdiniDAODataSource ordiniDAO = new OrdiniDAODataSource();
                List<OrdiniBean> ordiniList = null;
                try {
                    ordiniList = ordiniDAO.doRetrieveAll("DESC"); // "DESC" o "ASC" a seconda dell'ordine desiderato
                } catch (SQLException e) {
                    e.printStackTrace();
                    // Gestisci l'errore, ad esempio, mostrando un messaggio all'utente
                }
                %>
                <% if (ordiniList != null && !ordiniList.isEmpty()) { %>
                    <% for (OrdiniBean ordine : ordiniList) { %>
                        <tr>
                            <td data-label="ID Ordine"><%= ordine.getCode() %></td>
                            <td data-label="ID Account"><%= ordine.getAccount() %></td>
                            <td data-label="Prezzo"><%= ordine.getPrezzo() %></td>
                            <td data-label="Articolo"><%= ordine.getProdotto() %></td>
                            <td data-label="Data"><%= ordine.getDataacquisto() %></td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="5">Nessun ordine trovato</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
    <div class="container">
        <h1>Utenti registrati</h1>
        <div class="search-container">
            <input type="text" id="searchBarUsers" onkeyup="searchFunction('users')" placeholder="Cerca per nome, cognome o email...">
        </div>
        <table id="itemsTableUsers">
            <thead>
                <tr>
                    <th>ID Account</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<UserBean> users = (List<UserBean>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (UserBean userr : users) {
                %>
                    <tr>
                        <td><%= userr.getCode() %></td>
                        <td><%= userr.getNome() %></td>
                        <td><%= userr.getCognome() %></td>
                        <td><%= userr.getEmail() %></td>
                    </tr>
                <% 
                    }
                } else {
                %>
                    <tr>
                        <td colspan="3">Nessun utente trovato</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
    <%@ include file= "./fragment/footer.jsp" %>
</body>
</html>
