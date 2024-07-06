<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>I miei ordini</title>
    
    <link rel="stylesheet" href="css/style-ordini.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
</head>
<body>

    <%@ include file= "./fragment/header1.jsp" %>
  
   <div class="spazio">
  
    <h2>Ordini effettuati</h2>

    <div class="box">

        <div id="b">
            <div class="container">
                
                <div class="prodotto">
    
                    <div class="containerprodotto">
                           
                        <div class="immagine">
    
                            <img src="img/cintroenc3.png" alt="Non ho trovato nessuna immagine">
        
                        </div>
        
                        <div class="info">
                            <h4>Prodotto 1</h4>
                            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quis tempora vero eligendi amet eaque dolorem!</p>
                            <p class="prezzodata">20.500$ acquistato in data 20/05/23</p>
                        </div>
                    </div>
                           <br>
                           <button class="visualizzaBtn"> <a class="a_colore" href="./prodotto.jsp">Visualizza</a></button>
    
    
                </div>

                <div class="prodotto">
    
                    <div class="containerprodotto">
                           
                        <div class="immagine">
    
                            <img src="img/audiq2.png" alt="Non ho trovato nessuna immagine">
        
                        </div>
        
                        <div class="info">
                            <h4>Prodotto 1</h4>
                            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quis tempora vero eligendi amet eaque dolorem!</p>
                            <p class="prezzodata">20.500$ acquistato in data 20/05/23</p>
                        </div>
                    </div>
                           <br>
                           <button class="visualizzaBtn"> <a class="a_colore" href="./prodotto.jsp">Visualizza</a></button>
    
    
                </div>
    
                <div id="utente">
                    <button>
                        <a href="./utente.jsp">Torna all'account</a>
                    </button>
                </div>
    
            </div>
    
        </div>
    </div>
    
    </div>

        <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>