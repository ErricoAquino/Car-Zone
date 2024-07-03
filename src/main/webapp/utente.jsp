<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Il mio account</title>
    <link rel="stylesheet" href="css/style-utente.css">
</head>
<body>

   <%@ include file= "./fragment/header1.jsp" %>

      <section class="container">
         <div class="containermax">
         <div id="account">
            <h2>Il mio account</h2>
         </div>
         

        <div class="sezioni">

         <div class="casella">
            <div class="imgtesto">
                <img src="icon/order-confirmed.svg" alt="Non ho trovato nessuna immagine">
                <p class="paragrafo">Visualizza tutti gli ordini effettuati da questo account</p>
             </div>

           <a href="./ordini.jsp"><button class="visualizza">I miei ordini</button></a>
          </div>
       
         <div class="casella">
            <div class="imgtesto">
                <img src="icon/password.svg" alt="Non ho trovato nessuna immagine">
                <p class="paragrafo">Modifica dati: nome, cognome, e-mail, telefono e password</p>
             </div>

           <a href="./sicurezza.jsp"><button class="visualizza">Impostazioni di sicurezza</button></a>
          </div>
       
         <div class="casella">
            <div class="imgtesto">
                <img src="icon/credit-card.svg" alt="Non ho trovato nessuna immagine">
                <p class="paragrafo">Modifica i dati di pagamento</p>
             </div>

          <a href="pagamento.jsp"><button class="visualizza">Metodo di pagamento</button></a>
         </div>
    
        </div>

       </div>
        
      </section>

   <%@ include file= "./fragment/footer.jsp" %>
   
    
    
</body>
</html>