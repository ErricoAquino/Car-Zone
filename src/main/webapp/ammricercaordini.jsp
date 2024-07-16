<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.List" import="model.UserBean"%>

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
            <input type="text" id="searchBarOrders" onkeyup="searchFunction('orders')" placeholder="Cerca per nome, cognome o email...">
            <div class="date">
                <input type="date" id="startDateOrders" onchange="searchFunction('orders')" placeholder="Data di inizio">
                <input type="date" id="endDateOrders" onchange="searchFunction('orders')" placeholder="Data di fine">
            </div>
        </div>
        <table id="itemsTableOrders">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Articolo</th>
                    <th>Data</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Nome">Francesco Pio</td>
                    <td data-label="Cognome">Bottaro</td>
                    <td data-label="Email">francescopio.bottaro@gmail.com</td>
                    <td data-label="Articolo">Triciclo</td>
                    <td data-label="Data">2023-02-20</td>
                </tr>
                <tr>
                    <td data-label="Nome">Errico</td>
                    <td data-label="Cognome">Aquino</td>
                    <td data-label="Email">errico.aquino@gmail.com</td>
                    <td data-label="Articolo">Audi Q50</td>
                    <td data-label="Data">2023-01-15</td>
                </tr>
                <!-- Aggiungi altri ordini qui -->
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
        function searchFunction() {
            var input, filter, table, tr, td, i, j, txtValue;
            input = document.getElementById("searchBarUsers");
            filter = input.value.toUpperCase();
            table = document.getElementById("itemsTableUsers");
            tr = table.getElementsByTagName("tr");

            // Itera su tutte le righe della tabella e nascondi quelle che non corrispondono alla ricerca
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                var found = false;
                for (j = 0; j < td.length; j++) {
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            found = true;
                        }
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    </script>
    <%@ include file= "./fragment/footer.jsp" %>
   
</body>
</html>

