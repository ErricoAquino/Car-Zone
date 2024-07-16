<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1" import="model.PagamentoBean"%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    

    <title>Modifica dati di pagamento</title>

    <link rel="stylesheet" href="css/style-modificapagamento.css">

</head>

<body>



          <%@ include file= "./fragment/header1.jsp" %>

 

    <div class="container">

        <h1>Modifica dati di pagamento</h1>

        <form id="catalogo" action="ModificaPagamentoServlet" method="POST">
        
         <% 
                PagamentoBean pagamento = (PagamentoBean) request.getAttribute("pagamento");
                if (pagamento == null) {
                    out.println("<p>Errore: Pagamento non trovato.</p>");
                } else {
            %>
            
            
            <label for="itemNome">Nome </label>

            <input type="text" id="itemNome" name="Nome" value="<%= pagamento.getNome() %>" required>



            <label for="itemCognome">Cognome</label>

            <input type="text" id="itemCognome" name="Cognome" value="<%= pagamento.getCognome() %>" required>
            


            <label for="itemNumero_carta">Numero Carta</label>

            <input type="text" id="itemNumero_carta" name="Numero_carta" value="<%= pagamento.getNumero_carta() %>"required>

            

            <label for="itemData_scadenza">Scadenza carta</label>

            <input type="text" id="itemData_scadenza" name="Data_scadenza" value="<%= pagamento.getData_scadenza() %>" required>


            <label for="itemCitta">Citta</label>

            <input type="text" id="itemCitta" name="Citta" value="<%= pagamento.getCitta() %>" required>

            

            <label for="itemProvincia">Provincia</label>

            <input type="text" id="itemProvincia" name="Provincia" value="<%= pagamento.getProvincia() %>" required>


            <label for="itemVia">Via</label>

            <input type="text" id="itemVia" name="Via" value="<%= pagamento.getVia() %>" required>


            <label for="itemCAP">CAP</label>

            <input type="text" id="itemCAP" name="CAP" value="<%= pagamento.getCAP() %>" required>

            

            <button class= "aggiungi" type="submit">Salva</button>

            
          <% } %>
           

        </form>

    </div>

    

      <%@ include file= "./fragment/footer.jsp" %>

    

</body>

</html>