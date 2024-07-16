<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.ProductBean"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Modifica auto</title>
    <link rel="stylesheet" href="css/style-nuovoprodotto.css">
</head>
<body>

    <%@ include file= "./fragment/header1.jsp" %>

    <div class="container">
        <h1>Modifica auto</h1>
        <form action="ModificaProdottoServlet" method="POST" id="catalogo">
        
        
            <% 
                ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
                if (prodotto == null) {
                    out.println("<p>Errore: Prodotto non trovato.</p>");
                } else {
            %>
            
            <input type="hidden" name="ID_PRODOTTO" value="<%= prodotto.getID_PRODOTTO() %>">
            
            
            <label for="itemNome">Nome auto</label>
            <input type="text" id="itemNome" name="Nome_auto" value="<%= prodotto.getNome_auto() %>" required>
            
            <label for="itemAnno">Anno auto</label>
            <input type="text" id="itemAnno" name="Anno_auto" value="<%= prodotto.getAnno_auto() %>" required>

            <label for="itemGaranzia">Garanzia e costo passaggio di proprietà </label>
            <input type="text" id="itemGaranzia" name="Garanzia_passpropr" value="<%= prodotto.getGaranzia_passpropr() %>" required>

            <label for="itemImmatricolazione">Anno immatricolazione</label>
            <input type="text" id="itemImmatricolazione" name="Anno_immatricolazione" value="<%= prodotto.getAnno_immatricolazione() %>" required>

            <label for="itemCambio">Cambio</label>
            <input type="text" id="itemCambio" name="Cambio" value="<%= prodotto.getCambio() %>" required>
            
            <label for="itemPotenza">Potenza</label>
            <input type="text" id="itemPotenza" name="Potenza" value="<%= prodotto.getPotenza() %>" required>

            <label for="itemChilometri">Chilometraggio</label>
            <input type="text" id="itemChilometri" name="Chilometraggio" value="<%= prodotto.getChilometraggio() %>" required>

            <label for="itemCarburante">Carburante</label>
            <input type="text" id="itemCarburante" name="Carburante" value="<%= prodotto.getCarburante() %>" required>

            <label for="itemCilindrata">Cilindrata</label>
            <input type="text" id="itemCilindrata" name="Cilindrata" value="<%= prodotto.getCilindrata() %>" required>

            <label for="itemTarga">Targa</label>
            <input type="text" id="itemTarga" name="Targa" value="<%= prodotto.getTarga() %>" required>

            <label for="itemTelaio">N. telaio</label>
            <input type="text" id="itemTelaio" name="N_telaio" value="<%= prodotto.getN_telaio() %>" required>

            <label for="itemTrazione">Trazione</label>
            <input type="text" id="itemTrazione" name="Trazione" value="<%= prodotto.getTrazione() %>" required>

            <label for="itemPosti">Posti</label>
            <input type="text" id="itemPosti" name="Posti" value="<%= prodotto.getPosti() %>" required>

            <label for="itemClassi">Classe di emissione</label>
            <input type="text" id="itemClassi" name="Classe_emissione" value="<%= prodotto.getClasse_emissione() %>" required>

            <label for="itemEmissioni">Emissioni CO2</label>
            <input type="text" id="itemEmissioni" name="Emissioni_co2" value="<%= prodotto.getEmissioni_co2() %>" required>

            <label for="itemMateriale">Materiale volante</label>
            <input type="text" id="itemMateriale" name="Materiale_volante" value="<%= prodotto.getMateriale_volante() %>" required>

            <label for="itemBluetooth">Bluetooth</label>
            <input type="text" id="itemBluetooth" name="Bluetooth" value="<%= prodotto.getBluetooth() %>" required>

            <label for="itemDescrizione">Descrizione</label>
            <textarea id="itemDescrizione" name="Descrizione" required><%= prodotto.getDescrizione() %></textarea>

            <label for="itemPrezzo">Prezzo</label>
            <input type="number" id="itemPrezzo" name="Prezzo" value="<%= prodotto.getPrezzo() %>" required>
            
           
            
            <button class= "aggiungi" type="submit">Salva</button>
            <% } %>
        </form>
    </div>
    
    <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>
