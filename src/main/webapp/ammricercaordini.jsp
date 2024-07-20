<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.List" import="model.UserBean" import="model.OrdiniBean" import="model.OrdiniDAODataSource, java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina Amministratore - Articoli Comprati</title>
    <link rel="stylesheet" href="css/style-ammricercaordini.css">
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
    <script>
        function searchFunction(type) {
            var input, filter, table, tr, td, i, txtValue, startDate, endDate;
            if (type === 'users') {
                input = document.getElementById("searchBarUsers");
                filter = input.value.toUpperCase();
                table = document.getElementById("itemsTableUsers");
            } else if (type === 'orders') {
                input = document.getElementById("searchBarOrders");
                filter = input.value.toUpperCase();
                startDate = document.getElementById("startDateOrders").value;
                endDate = document.getElementById("endDateOrders").value;
                table = document.getElementById("itemsTableOrders");
            }
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                if (td.length > 0) {
                    var found = false;

                    // Check for orders table and filter by ID Account
                    if (type === 'orders') {
                        // Check if date range is applied
                        if ((startDate || endDate) && td[4]) {
                            var orderDate = new Date(td[4].textContent);
                            var start = startDate ? new Date(startDate) : null;
                            var end = endDate ? new Date(endDate) : null;

                            if ((start && orderDate < start) || (end && orderDate > end)) {
                                tr[i].style.display = "none";
                                continue;
                            }
                        }

                        // Only search in ID Account column (index 1)
                        txtValue = td[1].textContent || td[1].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            found = true;
                        }
                    } else if (type === 'users') {
                        // Search in all columns for users table
                        for (var j = 0; j < td.length; j++) {
                            if (td[j]) {
                                txtValue = td[j].textContent || td[j].innerText;
                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                    found = true;
                                    break;
                                }
                            }
                        }
                    }

                    tr[i].style.display = found ? "" : "none";
                }
            }
        }
    </script>
    <%@ include file= "./fragment/footer.jsp" %>
</body>
</html>
