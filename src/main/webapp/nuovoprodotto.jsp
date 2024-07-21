<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.ProductBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Inserisci nuova auto</title>
    <link rel="stylesheet" href="css/style-nuovoprodotto.css">
</head>
<body>

          <%@ include file= "./fragment/header1.jsp" %>
 
    <div class="container">
        <h1>Inserisci nuova auto nel catalogo</h1>
        <form action="NuovoProdottoServlet" method="POST" id="catalogo" >
         

        
        <input type="hidden" name="ID_PRODOTTO" value="">
            
            
            <label for="itemNome">Nome auto</label>
            <input type="text" id="itemNome" name="Nome_auto" value="" required>
            
            <label for="itemAnno">Anno auto</label>
            <input type="text" id="itemAnno" name="Anno_auto" value="" required>

            <label for="itemGaranzia">Garanzia e costo passaggio di proprietà </label>
            <input type="text" id="itemGaranzia" name="Garanzia_passpropr" value="" required>

            <label for="itemImmatricolazione">Anno immatricolazione</label>
            <input type="text" id="itemImmatricolazione" name="Anno_immatricolazione" value="" required>

            <label for="itemCambio">Cambio</label>
            <input type="text" id="itemCambio" name="Cambio" value="" required>
            
            <label for="itemPotenza">Potenza</label>
            <input type="text" id="itemPotenza" name="Potenza" value="" required>

            <label for="itemChilometri">Chilometraggio</label>
            <input type="text" id="itemChilometri" name="Chilometraggio" value="" required>

            <label for="itemCarburante">Carburante</label>
            <input type="text" id="itemCarburante" name="Carburante" value="" required>

            <label for="itemCilindrata">Cilindrata</label>
            <input type="text" id="itemCilindrata" name="Cilindrata" value="" required>

            <label for="itemTarga">Targa</label>
            <input type="text" id="itemTarga" name="Targa" value="" required>

            <label for="itemTelaio">N. telaio</label>
            <input type="text" id="itemTelaio" name="N_telaio" value="" required>

            <label for="itemTrazione">Trazione</label>
            <input type="text" id="itemTrazione" name="Trazione" value="" required>

            <label for="itemPosti">Posti</label>
            <input type="text" id="itemPosti" name="Posti" value="" required>

            <label for="itemClassi">Classe di emissione</label>
            <input type="text" id="itemClassi" name="Classe_emissione" value="" required>

            <label for="itemEmissioni">Emissioni CO2</label>
            <input type="text" id="itemEmissioni" name="Emissioni_co2" value="" required>

            <label for="itemMateriale">Materiale volante</label>
            <input type="text" id="itemMateriale" name="Materiale_volante" value="" required>

            <label for="itemBluetooth">Bluetooth</label>
            <input type="text" id="itemBluetooth" name="Bluetooth" value="" required>

            <label for="itemDescrizione">Descrizione</label>
            <textarea id="itemDescrizione" name="Descrizione" required></textarea>

            <label for="itemPrezzo">Prezzo</label>
            <input type="number" id="itemPrezzo" name="Prezzo" required>
            
             <label for="itemImmagine">Foto del prodotto</label>
     
            <input type="file" id="itemImmagine" name="itemImmagine" accept="image/.png" required> 
            
        
            
            <button class= "aggiungi" type="submit">Aggiungi</button>
            
           
        </form>
    </div>
    
      <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>