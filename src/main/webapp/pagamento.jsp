<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Metodi di pagamento</title>
    <link rel="stylesheet" href="css/style-pagamento.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<%@ include file= "./fragment/header1.jsp" %>

<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<section id="form">
    <div class="container">
        <form action="Pagamento" method="POST" onsubmit="return validateForm()">
            <h2>Dati di pagamento</h2>
            <div class="gruppo-reg">
                <label for="Numero_carta">Numero Della Carta</label>
                <input type="tel" pattern="[0-9]{13,16}" autocomplete="cc-number" maxlength="16" placeholder="xxxx xxxx xxxx xxxx" name="Numero_carta" required>
            </div>
            <div class="gruppo-scacvv">
                <div id="scadenza">
                    <label for="Data_scadenza">Scadenza Carta</label>
                    <input type="text" id="Data_scadenza" name="Data_scadenza" maxlength="5" pattern="(0[1-9]|1[0-2])/\d{2}" placeholder="MM/AA" required>
                </div>
                <div id="cvv">
                    <label for="Cvv">CVV</label>
                    <input type="text" id="Cvv" name="Cvv" maxlength="3" pattern="\d{3}" placeholder="CVV" required>
                </div>
            </div>
            <div class="gruppo-nomcogn">
                <div id="nome">
                    <label for="Nome">Nome</label>
                    <input type="text" id="Nome" name="Nome" placeholder="Nome" required>
                </div>
                <div id="cognome">
                    <label for="Cognome">Cognome</label>
                    <input type="text" id="Cognome" name="Cognome" placeholder="Cognome" required>
                </div>
            </div>
            <div class="gruppo-scacvv">
                <div id="scadenza">
                    <label for="Citta">Città</label>
                    <input type="text" id="Citta" name="Citta" placeholder="Città" required>
                </div>
                <div id="cvv">
                    <label for="Provincia">Provincia</label>
                    <input type="text" id="Provincia" name="Provincia" placeholder="Provincia" required>
                </div>
            </div>
            <div class="gruppo-scacvv">
                <div id="scadenza">
                    <label for="Via">Via</label>
                    <input type="text" id="Via" name="Via" placeholder="Via/Piazza" required>
                </div>
                <div id="cvv">
                    <label for="CAP">CAP</label>
                    <input type="text" id="CAP" name="CAP" placeholder="CAP" required>
                </div>
            </div>
            
            <button  type="submit">Salva dati di pagamento</button>
        </form>
        <a href="./utente.jsp"><button>Torna al mio account</button></a>
    </div>
</section>

<%@ include file= "./fragment/footer.jsp" %>

</body>
</html>
