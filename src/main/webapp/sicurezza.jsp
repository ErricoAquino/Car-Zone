<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="model.UserBean" import="model.PagamentoBean" import="model.PagamentoDAODataSource"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dati Utente</title>
    <link rel="stylesheet" href="css/style-sicurezza.css">
</head>
<body>

   <%@ include file= "./fragment/header1.jsp" %>
   
   <%
    UserBean userr = (UserBean) request.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

 <div class="csicurezza"> 
    <h2>Dati utente</h2>
    <table>
        <thead>
            <tr>
                <th>Campo</th>
                <th>Dati</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Nome</td>
                <td id="userName"><%= user.getNome() %></td>
            </tr>
            <tr>
                <td>Cognome</td>
                <td id="userSurname"><%= user.getCognome() %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td id="userEmail"><%= user.getEmail() %></td>
            </tr>
            <tr>
                <td>Numero di telefono</td>
                <td id="userPhone"><%= user.getTelefono() %></td>
            </tr>
        </tbody>
    </table>

    <div class="edit-link">
        <a href="./ModificaUtenteServlet" >Modifica</a>
    </div>

    <br><br>

    <h2>Dati pagamento</h2>
    <table>
        <thead>
            <tr>
                <th>Campo</th>
                <th>Dati</th>
            </tr>
        </thead>
        <tbody>
        
         <%-- Recupero dei dati di pagamento utilizzando il PagamentoBean e il PagamentoDAODataSource --%>
           <%   PagamentoBean pagamento = (PagamentoBean) request.getAttribute("pagamento");
       				 if (pagamento != null) {
       				 %>
            <tr>
                <td>Numero carta</td>
                <td id="paymentCard"><%= pagamento.getNumero_carta() %></td>
            </tr>
            <tr>
                <td>Scadenza carta</td>
                <td id="paymentExpiration"><%= pagamento.getData_scadenza() %></td>
            </tr>
            <tr>
                <td>Nome</td>
                <td id="paymentName"><%= pagamento.getNome() %></td>
            </tr>
            <tr>
                <td>Cognome</td>
                <td id="paymentSurname"><%= pagamento.getCognome() %></td>
            </tr>
            <tr>
                <td>Città</td>
                <td id="paymentCity"><%= pagamento.getCitta() %></td>
            </tr>
            <tr>
                <td>Provincia</td>
                <td id="paymentProvince"><%= pagamento.getProvincia() %></td>
            </tr>
            <tr>
                <td>Via</td>
                <td id="paymentAddress"><%= pagamento.getVia() %></td>
            </tr>
            <tr>
                <td>CAP</td>
                <td id="paymentCAP"><%= pagamento.getCAP() %></td>
            </tr>
            
     <% } else { %>
        <p>Nessun dato di pagamento trovato.</p>
        <% } %>
        </tbody>
    </table>

    <div class="edit-link">
        <a class="a_colore" href="./ModificaPagamentoServlet">Modifica</a>
    </div>

 
  </div>
    
    
    <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>



