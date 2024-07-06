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
                <tr>
                    <td data-label="Nome">Francesco Pio</td>
                    <td data-label="Cognome">Bottaro</td>
                    <td data-label="Email">francescopio.bottaro@gmail.com</td>
                </tr>
                <tr>
                    <td data-label="Nome">Errico</td>
                    <td data-label="Cognome">Aquino</td>
                    <td data-label="Email">errico.aquino@gmail.com</td>
                </tr>
                <!-- Aggiungi altri utenti qui -->
            </tbody>
        </table>
    </div>
    
    
    <%@ include file= "./fragment/footer.jsp" %>
   
</body>
</html>
