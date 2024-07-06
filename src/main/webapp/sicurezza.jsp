<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Sicurezza</title>

    <link rel="stylesheet" href="css/style-sicurezza.css">
</head>
<body>

   <%@ include file= "./fragment/header1.jsp" %>
   
   <section id="form">

    <div class="container">
        <form action="/submit_registration" method="POST">
            <h2>Dati Account</h2>
            <div class="gruppo-reg">
                <label for="name">Modifica Nome</label>
                <input type="text" id="name" name="name" placeholder="inserisci nome" required>
            </div>
            <div class="gruppo-reg">
                <label for="cognome">Modifica Cognome</label>
                <input type="text" id="cognome" name="cognome" placeholder="inserisci cognome" required>
            </div>
            <div class="gruppo-reg">
                <label for="email">Modifica E-mail</label>
                <input type="email" id="email" name="email" placeholder="inserisci e-mail" required>
            </div>
            <div class="gruppo-reg">
                <label for="telefono">Inserisci il numero di telefono </label>
                <input type="text" id="telefono" name="telefono" placeholder="inserisci il numero di telefono" required>
            </div>
            <div class="gruppo-reg">
                <label for="password">Inserisci Password attuale </label>
                <input type="password" id="password" name="password" placeholder="inserisci password" required>
            </div>
            
        </form>
        
        <button type="submit" onclick="togglePopup()">Modifica Dati </button> 
        
          <div id="popupOverlay" 
               class="overlay-container"> 
              <div class="popup-box"> 
                  <h2 style="color: orange;">Modifica dati</h2> 
                  <form class="form-container"> 
                      <label class="form-label" for="name">Modifica nome</label> 
                      <input class="form-input" type="text" placeholder="inserisci il tuo nuovo nome" id="name" name="name"> 

                      <label class="form-label" for="name">Modifica cognome</label> 
                      <input class="form-input" type="text" placeholder="inserisci il tuo nuovo cognome" id="name" name="name"> 

                      <label class="form-label" for="email">Modifica E-mail</label> 
                      <input class="form-input" type="email" placeholder="inserisci la tua nuova e-mail" id="email" name="email">
                      
                      <label class="form-label" for="telefono">Modifica numero di telefono</label> 
                      <input class="form-input" type="text" placeholder="inserisci il tuo nuovo numero di telefono" id="telefono" name="telefono"> 
                      
                      <label class="form-label" for="password">Nuova password</label> 
                      <input class="form-input" type="password" placeholder="inserisci una nuova password" id="password" name="password">
                      
                      <label class="form-label" for="password">Conferma nuova password</label> 
                      <input class="form-input" type="password" placeholder="conferma nuova password" id="password" name="password"> 
        
                      <button class="btn-submit" type="submit">Salva</button> 
                  </form> 
        
                  <button class="btn-close-popup" onclick="togglePopup()">Esci</button> 
              </div> 
          </div> 

        <a href="./utente.jsp"><button>Torna al mio account</button></a>
    </div>
    
    </section> 
    
    <script> 
        function togglePopup() { 
            const overlay = document.getElementById('popupOverlay'); 
            overlay.classList.toggle('show'); 
        } 
    </script> 
    
    <%@ include file= "./fragment/footer.jsp" %>
  
    
</body>
</html>
