<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import= "model.ProductBean"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prodotto</title>
    <link rel="stylesheet" href="css/style-prodotto.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

  <%@ include file= "./fragment/header1.jsp" %>

<%  ProductBean p = (ProductBean) session.getAttribute("p"); %>

  <h1 id="nomemacchina"> <%= p.getNome_auto() %> </h1>
  <p id="annoauto"> <%= p.getAnno_auto() %></p>

    <div id="containermax">

        <div id="container">

            <div id="auto">
      
              <img src="img/audiq2.png" alt="Nessuna immagine trovata">

           </div>
    
        </div>
    
       <div id="containerdescrizione">

         <h3 id="prezzo"> <%= p.getPrezzo() %>$</h3>
         <hr class="box1">

         <h2 id="titolomacchinabox"><%= p.getNome_auto() %></h2>
         <p id="testobox">Include garanzia di conformita' 12 mesi e certificazione chilometrica. Escluso passaggio di prorpieta' al costo di 500$</p>
         <hr class="box1">
         <button id="bottone"><a id="a" href="./CarrelloServlet?operation=add&productId=<%= p.getID_PRODOTTO()%>">Aggiungi al carrello</a></button>
    
        </div>
    </div>

    <h4 id="dettagli">Dettagli</h4>

    <section class="sezione2">
        <div class="caratteristicheauto">
            <img  class="immaginecaratteristiche" src="icon/calendar.svg"alt="Non ho trovato nessuna immagine" > 
    
         <div class="caratteristichetesto">
            <p class="p1">Immatricolazione</p>
            <p class="p2"><%= p.getAnno_immatricolazione() %></p>

         </div>
        </div>

        <div class="caratteristicheauto">
           <img  class="immaginecaratteristiche" src="icon/road.svg"alt="Non ho trovato nessuna immagine" > 

         <div class="caratteristichetesto">
           <p class="p1">Chilometraggio</p>
           <p class="p2"><%= p.getChilometraggio() %></p>

         </div>
        </div>

        <div class="caratteristicheauto">
            <img  class="immaginecaratteristiche" src="icon/car.svg"alt="Non ho trovato nessuna immagine" > 
 
          <div class="caratteristichetesto">
            <p class="p1">Potenza</p>
            <p class="p2"><%= p.getPotenza() %></p>
 
          </div>
         </div>
    </section>

    <section class="sezione2">
        <div class="caratteristicheauto">
            <img  class="immaginecaratteristiche" src="icon/settingsdef.svg"alt="Non ho trovato nessuna immagine" > 
    
         <div class="caratteristichetesto">
            <p class="p1">Cambio</p>
            <p class="p2"><%= p.getCambio() %></p>

         </div>
        </div>

        <div class="caratteristicheauto">
           <img  class="immaginecaratteristiche" src="icon/gas-pump-solid.svg"alt="Non ho trovato nessuna immagine" > 

         <div class="caratteristichetesto">
           <p class="p1">Tipo Carburante</p>
           <p class="p2"><%= p.getCarburante() %></p>

         </div>
        </div>

        <div class="caratteristicheauto">
            <img  class="immaginecaratteristiche" src="icon/input-power.svg"alt="Non ho trovato nessuna immagine" > 
 
          <div class="caratteristichetesto">
            <p class="p1">Cilindrata</p>
            <p class="p2"><%= p.getCilindrata() %></p>
 
          </div>
         </div>
    </section>

    <h2 class="sottotitolo">Dati dell'auto</h2>

     <section class="sezione3">

        <div class="specifiche">
           <div class="containerspecifiche">
            <h3 class="nomespecifiche">Targa:</h3>
            <p class="paragrafo"><%= p.getTarga() %></p>
           </div>
           <hr>
           <div class="containerspecifiche">
            <h3 class="nomespecifiche">N telaio:</h3>
            <P class="paragrafo"><%= p.getN_telaio() %></P>
           </div>
           <hr>
           <div class="containerspecifiche">
            <h3 class="nomespecifiche">Trazione:</h3>
            <P class="paragrafo"><%= p.getTrazione() %></P>
           </div>
           <hr>
           <div class="containerspecifiche">
            <h3 class="nomespecifiche">Posti:</h3>
            <p class="paragrafo"><%= p.getPosti() %></p>
           </div>

        </div>

        

          <div class="specifiche">
            <div class="containerspecifiche">
              <h3 class="nomespecifiche">Classe di emissioni:</h3>
              <p class="paragrafo"><%= p.getClasse_emissione() %></p>
            </div>
            <hr>
            <div class="containerspecifiche">
              <h3 class="nomespecifiche">Emissioni C0^2:</h3>
              <p class="paragrafo"><%= p.getEmissioni_co2() %></p>
            </div>
            <hr>
            <div class="containerspecifiche">
              <h3 class="nomespecifiche">Materiale volante:</h3>
              <p class="paragrafo"><%= p.getMateriale_volante() %></p>
            </div>
            <hr>
            <div class="containerspecifiche">
              <h3 class="nomespecifiche">Bluetooth:</h3>
              <p class="paragrafo"><%= p.getBluetooth() %></p>
            </div>

        </div>

     </section>

     <h2 class="sottotitolo">Descrizione</h2>
    
        <p id="paragdescrizione"><%= p.getDescrizione() %></p>
      

    <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>