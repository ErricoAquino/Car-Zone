<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Visualizza articoli</title>
    <link rel="stylesheet" href="css/style-ammricercaordini.css">
</head>
<body>

   
     <%@ include file= "./fragment/header1.jsp" %>

    <div class="container">
        <h1>Ordini</h1>
        <div class="search-container">
            <input type="text" id="searchBar" onkeyup="searchFunction()" placeholder="Cerca per nome, cognome o email...">
            <select id="searchDate" onchange="searchFunction()">
                <option value="">Seleziona una data</option>
                <option value="2023-01-15">2023-01-15</option>
                <option value="2023-02-20">2023-02-20</option>
                <!-- Aggiungi altre date qui -->
            </select>
        </div>
        <table id="itemsTable">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Articolo</th>
                    <th>Prezzo</th>
                    <th>Data</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="Nome">Francesco Pio</td>
                    <td data-label="Cognome">Bottaro</td>
                    <td data-label="Email">francescopio.bottaro@gmail.com</td>
                    <td data-label="Articolo">Ferrari</td>
                    <td data-label="Prezzo">30.000$</td>
                    <td data-label="Data">2023-02-20</td>
                    
                </tr>
                <tr>
                    <td data-label="Nome">Errico</td>
                    <td data-label="Cognome">Aquino</td>
                    <td data-label="Email">errico.aquino@gmail.com</td>
                    <td data-label="Articolo">Monopattino</td>
                    <td data-label="Prezzo">20$</td>
                    <td data-label="Data">2023-01-15</td>
                </tr>
                <!-- Aggiungi altri ordini qui -->
            </tbody>
        </table>
    </div>
    
     <%@ include file= "./fragment/footer.jsp" %>

    
</body>
</html>
    