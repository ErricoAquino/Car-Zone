<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagamento</title>

    <link rel="stylesheet" href="css/style-pagamento.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
</head>
<body>

  <%@ include file= "./fragment/header1.jsp" %>
  
  <section id="form">

    <div class="container">
        <form action="/submit_registration" method="POST">
            <h2>Modifica dati di pagamento</h2>
            <div class="gruppo-reg">
                <label for="ccn">Numero Della Carta</label>
                <input type="tel" inputmode="numeric" pattern="[0-9\s]{13,15}" autocomplete="cc-number" maxlength="15" placeholder="xxxx xxxx xxxx xxxx" required>
                
            </div>
            <div class="gruppo-scacvv">
               <div id="scadenza">
                <label for="numero"> Scadenza Carta</label>
                <input type="text" id="numero" name="numero" maxlength="5" pattern="(0[1-9]|1[0-2])/(\d{2})" placeholder="Scadenza carta(MM/AA)" required>
               </div>
                
               <div id="cvv">
                <label for="password"> CVV</label>
                <input type="cvv" id="password" name="password" maxlength="3" pattern="\3" placeholder="CVV" required>
              </div>
                
            </div>

            <div class="gruppo-nomcogn">
                <div id="nome">
                 <label for="numero">Nome</label>
                 <input type="datetime" id="email" name="date" placeholder="Nome" required>
                </div>
                 
                <div id="cognome">
                 <label for="password">Cognome</label>
                 <input type="cvv" id="password" name="password" placeholder="Cognome" required>
               </div>
                 
             </div>
             
              <div class="gruppo-scacvv">
               <div id="scadenza">
                <label for="citta"> Citta'</label>
                <input type="text" id="citta" placeholder="Citta'" required>
               </div>
                
               <div id="cvv">
                <label for="provincia">Provincia</label>
                <input type="text" id="provincia" name="password" placeholder="Provincia" required>
              </div>
                
            </div>
            
             <div class="gruppo-scacvv">
               <div id="scadenza">
                <label for="via"> Via</label>
                <input type="text" id="via" placeholder="Via/Piazza" required>
               </div>
                
               <div id="cvv">
                <label for="cap">CAP</label>
                <input type="text" id="cap" name="password" placeholder="CAP" required>
              </div>
                
            </div>
            
            
            <button type="submit">Salva dati di pagamento</button>
        </form>

        <a href="./utente.jsp"><button>Torna al mio account</button></a>
    </div>
    
     </section> 
    
    <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>