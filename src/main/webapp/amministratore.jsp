<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List" import="model.ProductBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style-amministratore.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Amministratore</title>
</head>

      <% Boolean isAdmin = (Boolean) session.getAttribute("isAdmin"); 
   if ((isAdmin == null) || (!isAdmin) ){
	   
	   response.sendRedirect(request.getContextPath()+ "/login.jsp");
	   return;
  } %>
<body>
         
     <%@ include file= "./fragment/header1.jsp" %>
     
         <h2>Catalogo</h2>
         
          <!-- Pulsante per aggiungere un nuovo prodotto -->
            
              <div class="agg-prodotto">
                <button class="aggiungiProdottoBtn"><a class="a_colore" href="./NuovoProdottoServlet">Nuovo prodotto</a></button>
                 <button class="aggiungiProdottoBtn"> <a class="a_colore" href="./UsersServlet">Visualizza utenti e ordini</a></button>
               
                        
              
         
        </div>
     
      <% Boolean isAdminn = (Boolean) session.getAttribute("isAdmin");
       if (isAdmin != null && isAdmin) {
           List<model.ProductBean> products = (List<model.ProductBean>) session.getAttribute("products");
           if (products != null) {
               for (model.ProductBean prodotto : products) {
    %>
     
     
     
   <div class="spazio">  
    
    
    
        <div class="container">
            <div class="prodotto">
                <img id="immagine" src="img/bmw.png" alt="nessuna immagine trovata">
                <div class="divprodotto">
                <h3><%= prodotto.getNome_auto() %></h3>
                <p><%= prodotto.getDescrizione() %></p>
                </div>
                <div class="azione">
               
                  <button class="visualizzaBtn"> <a class="a_colore" href="./ProdottoServlet?idProdotto=<%= prodotto.getID_PRODOTTO() %>">Visualizza</a></button>
                    <button class="modificaBtn"><a class="a_colore" href="./ModificaProdottoServlet?idProdotto=<%= prodotto.getID_PRODOTTO() %>">Modifica</a></button>
                    <form action="EliminaProdottoServlet" method="post" style="display:inline;">
                       <input type="hidden" name="idProdotto" value="<%= prodotto.getID_PRODOTTO() %>">
                         <button type="submit" class="eliminaBtn">Cancella</button>
                   </form>
                </div>
            </div>
         </div>
         
       </div>
      
       
       <% String message = (String) session.getAttribute("message");
   if (message != null) { %>
   <div class="message"><%= message %></div>
   <% session.removeAttribute("message");
} %>
<% String error = (String) session.getAttribute("error");
   if (error != null) { %>
   <div class="error"><%= error %></div>
   <% session.removeAttribute("error");
} %>
       
        
            <% 
               }
           } else {
               out.println("<p>Nessun prodotto trovato.</p>");
           }
       } else {
           response.sendRedirect(request.getContextPath()+ "/login.jsp");
           return;
       }
    %>


           
           
        <a href="logout">Esci</a>
        <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>