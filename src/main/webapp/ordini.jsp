

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List, model.OrdiniBean, model.OrdiniDAODataSource, model.ProductBean, java.sql.SQLException"%>
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
    
    <%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
  
   <div class="spazio">
        
        <div class="spazio">
    <h2>Ordini effettuati</h2>
    
    <%-- Visualizza il numero totale di ordini effettuati --%>
            <%
                OrdiniDAODataSource ordiniDAO = new OrdiniDAODataSource();
                List<OrdiniBean> ordiniList = null;
                try {
                    ordiniList = ordiniDAO.doRetrieveAll("DESC"); // "DESC" o "ASC" a seconda dell'ordine desiderato
                } catch (SQLException e) {
                    e.printStackTrace();
                    // Gestisci l'errore, ad esempio, mostrando un messaggio all'utente
                }
                int idAccountFromSession = (int) session.getAttribute("ID_ACCOUNT");
            %>

       </div>
       
       <% if (ordiniList != null && !ordiniList.isEmpty()) { %>
            <% for (OrdiniBean ordine : ordiniList) { %>
            <%if (ordine.getAccount() == idAccountFromSession){%>

    <div class="box">

        <div id="b">
            <div class="container">
                
                <div class="prodotto">
    
                    <div class="containerprodotto">
                           
                        <div class="immagine">
    
                            <img src="img/cintroenc3.png" alt="Non ho trovato nessuna immagine">
        
                        </div>
        
                        <div class="info">
                            <h4> Titolo prodotto :<%=ordine.getProdotto()%></h4>
                            <p> Prodotti acquistati :<%= ordine.getNumeroprodotti() %></p>
                            <p class="prezzodata"> Acquistato in data : <%= ordine.getDataacquisto() %></p>
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
    
     <% }} %>
        <% } else { %>
            <p>Nessun ordine disponibile.</p>
        <% } %>
    
    </div>

        <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>