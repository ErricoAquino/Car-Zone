<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style-carrello.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
        
        <meta charset="UTF-8">
        <title>Carrello</title>
    </head>
    <body>
    
       <%@ include file= "./fragment/header1.jsp" %>
      
 
        <div class="container-carrello">
            <div class="nome">
                <h3 class="titolo">Carrello </h3>
                <h5 class="cancella-articoli">Svuota Carrello <img src="icon/trash-28.svg" class="img-h5"></h5>
            </div>
            
            <hr> 
            <!-- ARTICOLO 1 -->
            <div class="articoli-carrello">
                <!-- SPUNTA -->
                <input type="checkbox" checked="checked" name="prodotto_1">
                <!-- IMMAGINE -->
                <div class="box-immagine">
                    <img class="immagine-prodotto" src="img/audiq2.png"/>
                </div>
                <!-- INFO -->
                <div class="info-prodotto">
                    <h1 class="titolo-prodotto">Titolo Prodotto</h1>
                    <h3 class="dettagli">Dettagli e caratteristiche del prodotto</h3>
                </div>
                <!--QUANTITA PROBABILMENTE INUTILE!!!-->
               <div class="quantita">
                    <div class="btn">-</div>
                    <div class="contatore">1</div>
                    <div class="btn">+</div>
                </div>  
                <div class="prezzo">
                    <div class="ammontare">$9.500</div>
                    <div class="rimuovi"><u>Rimuovi</u></div>
                </div>
            </div>
            
            <!-- ARTICOLO 2 -->
            <div class="articoli-carrello">
                <!-- SPUNTA -->
                <input type="checkbox" checked="checked" name="prodotto_2">
                <!-- IMMAGINE -->
                <div class="box-immagine">
                    <img class="immagine-prodotto" src="img/pandablu1.png"/>
                </div>
                <!-- INFO -->
                <div class="info-prodotto">
                    <h1 class="titolo-prodotto">Titolo Prodotto</h1>
                    <h3 class="dettagli">Dettagli e caratteristiche del prodotto</h3>
                </div>
                <!--QUANTITA PROBABILMENTE INUTILE!!!-->
                 <div class="quantita">
                    <div class="btn">-</div>
                    <div class="contatore">1</div>
                    <div class="btn">+</div>
                </div>   
                <div class="prezzo">
                    <div class="ammontare">$10.500</div>
                    <div class="rimuovi"><u>Rimuovi</u></div>
                </div>
            </div>
            <hr> 
            <div class="checkout">
                <!--<div class="spezione">Costi di spedizione: Gratis</div>-->
                <div class="totale">
                    <div>
                        <div class="subtotale">Totale</div>
                        <div class="n_articoli">2 articolo/i</div>
                    </div>
                    <div class="costo-totale">$20.000</div>
                </div>
                <button class="pulsante">Paga ora</button>
            </div>
        </div>
       
          <%@ include file= "./fragment/footer.jsp" %>
        
    </body>
</html>