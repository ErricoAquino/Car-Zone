<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="model.UserBean" %>
    
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifica dati utente</title>
    <link rel="stylesheet" href="css/style-modificapagamento.css">
</head>
<body>
    <%@ include file="./fragment/header1.jsp" %>
    <div class="container">
        <h1>Modifica dati Utente</h1>
        
        <form id="catalogo" action="ModificaUtenteServlet" method="POST">
            <label for="itemNome">Nome</label>
            <input type="text" id="itemNome" name="nome" value="<%= ((UserBean) request.getAttribute("utente")).getNome() %>" required>
            
            <label for="itemCognome">Cognome</label>
            <input type="text" id="itemCognome" name="cognome" value="<%= ((UserBean) request.getAttribute("utente")).getCognome() %>" required>
            
            <label for="itemEmail">Email</label>
            <input type="email" id="itemEmail" name="email" value="<%= ((UserBean) request.getAttribute("utente")).getEmail() %>" required>
            
            <label for="itemTelefono">Numero di telefono</label>
            <input type="tel" id="itemTelefono" name="telefono" value="<%= ((UserBean) request.getAttribute("utente")).getTelefono() %>" required>
            
            <label for="itemRuolo">Ruolo</label>
            <input type="text" id="itemRuolo" name="ruolo" value="<%= ((UserBean) request.getAttribute("utente")).getRole() %>" required>
            
            <button class="aggiungi" type="submit">Salva</button>
        </form>
    </div>
    <%@ include file="./fragment/footer.jsp" %>
</body>
</html>
