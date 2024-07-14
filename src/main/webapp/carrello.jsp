<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "model.CartItemBean" import="java.util.List" import="java.util.ArrayList" import= "model.CartBean"  import= "model.ProductBean" import= "java.util.Collection"%>
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
                <a href="./CarrelloServlet?operation=empty">
	             	<h5 class="cancella-articoli">
	             		Svuota Carrello <img src="icon/trash-28.svg" class="img-h5">
	             	</h5>
             	</a>
            </div>
            
            <hr> 
            
            
        <% 
        	CartBean cart = (CartBean) request.getSession(false).getAttribute("cart");
        	List<CartItemBean> cartItems = (List<CartItemBean>) cart.getItems();
            if (cartItems != null && !cartItems.isEmpty()) {
                for (CartItemBean cartItem : cartItems) {  
                	ProductBean cartItemProduct = cartItem.getProdotto();
                	
        %>
        
            <!-- CART ITEM-->
            <div class="articoli-carrello">
               
                <!-- IMMAGINE -->
                <div class="box-immagine">
                    <img class="immagine-prodotto" src="img/audiq2.png"/>
                </div>
                <!-- INFO -->
                
                <div class="info-prodotto">
                    <h1 class="titolo-prodotto">Titolo Prodotto</h1>
                    <h3 class="dettagli"><%= cartItemProduct.getNome_auto() %></h3>
                </div>
                                   
                <!--QUANTITA PROBABILMENTE INUTILE!!!-->
               <div class="quantita">
                    <a href="./CarrelloServlet?operation=removeQuantity&productId=<%= cartItemProduct.getID_PRODOTTO()%>"><div class="btn">-</div></a>
                    <div class="contatore"><%= cartItem.getQuantita() %> </div>
                    <a  href="./CarrelloServlet?operation=addQuantity&productId=<%= cartItemProduct.getID_PRODOTTO()%>"><div class="btn">+</div></a>
                </div>  
                <div class="prezzo">
                   
                    <a  href="./CarrelloServlet?operation=remove&productId=<%= cartItemProduct.getID_PRODOTTO()%>"><div class="rimuovi"><u>Rimuovi</u></div></a>
                </div>
            </div>
        <%
                }
            } else {
                // Nel caso in cui non ci siano prodotti
                out.println("<p>Nessun prodotto trovato</p>");
                
            }
        %>
            
            

            
                <div class="totale">
                    <div>
                        <div class="subtotale">Totale</div>
                        <div class="n_articoli">2 articolo/i</div>
                    </div>
                    <div class="costo-totale">$20.000</div>
                </div>
               <a href="./pagamentoeffettuato.jsp"> <button class="pulsante"> Paga ora</button></a>
            </div>
        </div>
       
          <%@ include file= "./fragment/footer.jsp" %>
        
    </body>
</html>