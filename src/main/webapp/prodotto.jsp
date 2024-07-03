<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

  <h1 id="nomemacchina"> Audi Q2</h1>
  <p id="annoauto"> 2020</p>

    <div id="containermax">

        <div id="container">

            <div id="auto">
      
              <img src="img/audiq2.png" alt="Nessuna immagine trovata">

           </div>
    
        </div>
    
       <div id="containerdescrizione">

         <h3 id="prezzo"> 10.999$</h3>
         <hr class="box1">

         <h2 id="titolomacchinabox">Audi Q2</h2>
         <p id="testobox">Include garanzia di conformita' 12 mesi e certificazione chilometrica. Escluso passaggio di prorpieta' al costo di 500$</p>
         <hr class="box1">
         <button id="bottone">Aggiungi al carrello</button>
    
        </div>
    </div>

    <h4 id="dettagli">Dettagli</h4>

    <section class="sezione2">
        <div class="caratteristicheauto">
            <img  class="immaginecaratteristiche" src="icon/calendar.svg"alt="Non ho trovato nessuna immagine" > 
    
         <div class="caratteristichetesto">
            <p class="p1">Immatricolazione</p>
            <p class="p2">Agosto 2020</p>

         </div>
        </div>

        <div class="caratteristicheauto">
           <img  class="immaginecaratteristiche" src="icon/road.svg"alt="Non ho trovato nessuna immagine" > 

         <div class="caratteristichetesto">
           <p class="p1">Chilometraggio</p>
           <p class="p2">98.500 km</p>

         </div>
        </div>

        <div class="caratteristicheauto">
            <img  class="immaginecaratteristiche" src="icon/car.svg"alt="Non ho trovato nessuna immagine" > 
 
          <div class="caratteristichetesto">
            <p class="p1">Potenza</p>
            <p class="p2">85 KW / 115 CV</p>
 
          </div>
         </div>
    </section>

    <section class="sezione2">
        <div class="caratteristicheauto">
            <img  class="immaginecaratteristiche" src="icon/settingsdef.svg"alt="Non ho trovato nessuna immagine" > 
    
         <div class="caratteristichetesto">
            <p class="p1">Cambio</p>
            <p class="p2">Aut. 7 Marce</p>

         </div>
        </div>

        <div class="caratteristicheauto">
           <img  class="immaginecaratteristiche" src="icon/gas-pump-solid.svg"alt="Non ho trovato nessuna immagine" > 

         <div class="caratteristichetesto">
           <p class="p1">Tipo Carburante</p>
           <p class="p2">Benzina</p>

         </div>
        </div>

        <div class="caratteristicheauto">
            <img  class="immaginecaratteristiche" src="icon/input-power.svg"alt="Non ho trovato nessuna immagine" > 
 
          <div class="caratteristichetesto">
            <p class="p1">Cilindrata</p>
            <p class="p2">1461cc</p>
 
          </div>
         </div>
    </section>

    <h2 class="sottotitolo">Dati dell'auto</h2>

     <section class="sezione3">

        <div class="specifiche">
           <div class="containerspecifiche">
            <h3 class="nomespecifiche">Targa:</h3>
            <p class="paragrafo">EX964RS</p>
           </div>
           <hr>
           <div class="containerspecifiche">
            <h3 class="nomespecifiche">N telaio:</h3>
            <P class="paragrafo">9550505005</P>
           </div>
           <hr>
           <div class="containerspecifiche">
            <h3 class="nomespecifiche">Trazione:</h3>
            <P class="paragrafo">Anteriore</P>
           </div>
           <hr>
           <div class="containerspecifiche">
            <h3 class="nomespecifiche">Posti:</h3>
            <p class="paragrafo">5</p>
           </div>

        </div>

        

          <div class="specifiche">
            <div class="containerspecifiche">
              <h3 class="nomespecifiche">Classe di emissioni:</h3>
              <p class="paragrafo">Euro 6T</p>
            </div>
            <hr>
            <div class="containerspecifiche">
              <h3 class="nomespecifiche">Emissioni C0^2:</h3>
              <p class="paragrafo">100g/km</p>
            </div>
            <hr>
            <div class="containerspecifiche">
              <h3 class="nomespecifiche">Materiale volante:</h3>
              <p class="paragrafo">Volante in pelle</p>
            </div>
            <hr>
            <div class="containerspecifiche">
              <h3 class="nomespecifiche">Bluetooth:</h3>
              <p class="paragrafo">Si</p>
            </div>

        </div>

     </section>

     <h2 class="sottotitolo">Descrizione</h2>
    
        <p id="paragdescrizione">Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis, saepe dignissimos! Inventore, aspernatur! Veniam neque alias voluptates, rerum dolorum iusto non eius voluptate ex facere amet error at deleniti, repudiandae id doloremque nisi omnis quod nemo autem obcaecati tempore enim. Commodi minus a dolorum veritatis animi deleniti quam, tempora molestias repellat sint alias autem voluptate incidunt molestiae quas ratione beatae, voluptates obcaecati! In earum maxime voluptatum debitis aspernatur distinctio vitae tenetur pariatur ducimus nihil voluptas consequatur necessitatibus fugit officia saepe sit nulla ea unde fugiat accusamus, porro facilis enim blanditiis. Voluptatem vitae placeat, corporis nemo consequatur expedita quasi reprehenderit quae fugit fugiat, unde facilis, recusandae cum repellat tenetur nostrum sapiente similique dolore. Recusandae fuga fugit vitae eos reprehenderit ipsam assumenda!</p>
      

    <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>