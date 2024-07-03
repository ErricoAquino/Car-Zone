<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <form id="catalogo" enctype="multipart/form-data">
            <label for="itemNome">Nome auto</label>
            <input type="text" id="itemNome" name="itemNome" required>
            
            <label for="itemAnno">Anno auto</label>
            <input type="text" id="itemAnno" name="itemNome" required>

            <label for="itemGaranzia">Garanzia e costo passaggio di proprietà </label>
            <input type="text" id="itemGaranzia" name="itemNome" required>

            <label for="itemImmatricolazione">Anno immatricolazione</label>
            <input type="text" id="itemImmatricolazione" name="itemNome" required>

            <label for="itemCambio">Cambio</label>
            <input type="text" id="itemCambio" name="itemNome" required>
            
            <label for="itemPotenza">Potenza</label>
            <input type="text" id="itemPotenza" name="itemNome" required>

            <label for="itemChilometri">Chilometraggio</label>
            <input type="text" id="itemChilometri" name="itemNome" required>

            <label for="itemCarburante">Carburante</label>
            <input type="text" id="itemCarburante" name="itemNome" required>

            <label for="itemCilindrata">Cilindrata</label>
            <input type="text" id="itemCilindrata" name="itemNome" required>

            <label for="itemTarga">Targa</label>
            <input type="text" id="itemTarga" name="itemNome" required>

            <label for="itemTelaio">N. telaio</label>
            <input type="text" id="itemTelaio" name="itemNome" required>

            <label for="itemTrazione">Trazione</label>
            <input type="text" id="itemTrazione" name="itemNome" required>

            <label for="itemPosti">Posti</label>
            <input type="text" id="itemPosti" name="itemNome" required>

            <label for="itemClassi">Classe di emissione</label>
            <input type="text" id="itemClassi" name="itemNome" required>

            <label for="itemEmissioni">Emissioni CO2</label>
            <input type="text" id="itemEmissioni" name="itemNome" required>

            <label for="itemMateriale">Materiale volante</label>
            <input type="text" id="itemMateriale" name="itemNome" required>

            <label for="itemBluetooth">Bluetooth</label>
            <input type="text" id="itemBluetooth" name="itemNome" required>

            <label for="itemDescrizione">Descrizione</label>
            <textarea id="itemDescrizione" name="itemDescrizione" required></textarea>

            <label for="itemPrezzo">Prezzo</label>
            <input type="number" id="itemPrezzo" name="itemPrezzo" required>
            
            <label for="itemImmagine">Foto del prodotto</label>
            <input type="file" id="itemImmagine" name="itemImmagine" accept="image/*" required>
            
            <button class= "aggiungi" type="submit">Aggiungi</button>
        </form>
    </div>
    
      <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>