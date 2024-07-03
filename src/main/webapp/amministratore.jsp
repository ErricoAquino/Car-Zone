<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style-amministratore.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Amministratore</title>
</head>

      <% Boolean isAdmin = (Boolean) session.getAttribute("isAdmin"); 
   if ((isAdmin == null) || (!isAdmin) ){
	   
	   response.sendRedirect(request.getContextPath()+ "/login.jsp");
	   return;
  } %>
<body>

     <%@ include file= "./fragment/header1.jsp" %>
     
   <div class="spazio">  
    
    <h2>Catalogo</h2>
    
        <div class="container">
            <div class="prodotto">
                <img id="immagine" src="img/bmw.png" alt="nessuna immagine trovata">
                <div class="divprodotto">
                <h3>Prodotto 1</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Magni voluptatibus animi distinctio, delectus optio eius laborum dolorem id corporis eum.</p>
                </div>
                <div class="azione">
                    <button class="visualizzaBtn"> <a class="a_colore" href="./prodotto.jsp">Visualizza</a></button>
                    <button class="modificaBtn">Modifica</button>
                    <button class="eliminaBtn">Cancella</button>
                </div>
            </div>
            <div class="prodotto">
                 <img id="immagine" src="img/polo.png" alt="nessuna immagine trovata">
                <div class="divprodotto">
                <h3>Prodotto 1</h3>
                <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Magni voluptatibus animi distinctio, delectus optio eius laborum dolorem id corporis eum.</p>
                </div>
                <div class="azione">
                  
                    <button class="visualizzaBtn"> <a class="a_colore" href="./prodotto.jsp">Visualizza</a></button>
                    <button class="modificaBtn">Modifica</button>
                    <button class="eliminaBtn">Cancella</button> 
                </div>
            </div>

            <!-- Pulsante per aggiungere un nuovo prodotto -->
            <div class="agg-prodotto">
                <button class="aggiungiProdottoBtn"> <a class="a_colore" href="./nuovoprodotto.jsp">Aggiungi prodotto</a></button>
                 <button class="aggiungiProdottoBtn"> <a class="a_colore" href="./ammricercaordini.jsp">Visualizza ordini</a></button>
              
            </div>
        </div>
        
        </div>
        <a href="logout">Esci</a>
        <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>