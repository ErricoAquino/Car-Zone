<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import= "model.ProductBean" import= "java.util.Collection"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carzone</title>
    <link rel="stylesheet" href="css/style-home.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="js/cart.js"></script>
	<script src="js/home.js"></script>
	
</head>
<body>

   <%@ include file= "./fragment/header1.jsp" %>

    <div id="container">
    
        <br>
        <div class="container-searchbar">
            <div class="searchbar">
                <img src="icon/Search_4.svg" alt="">
               <input type="search" name="searchQuery" id="searchQuery" placeholder="Cerca nel catalogo">
<button class="search" id="searchButton">Cerca</button>
               
            </div>
        </div>

        <div class="down-bar">
            <div class="container-downbar">
                <h3>Benvenuto 
                <%
                
                UserBean loggedUser = (UserBean) request.getSession(false).getAttribute("user");
                
                if(loggedUser != null)
                {
                	out.println(loggedUser.getNome());
                }
                
                %>
                </h3>
            </div>
        </div>
    </div>
    <br>
    <br>
     
    <h3 class="ditendenza"> I nostri prodotti > </h3>
    <br>
    <br>
    <section class="sezioni">

        <% 
            @SuppressWarnings("unchecked")
            Collection<ProductBean> products = (Collection<ProductBean>) request.getSession(false).getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (ProductBean product : products) {
        %>
                    <div class="casella">
                    <img src= "img/<%=product.getNome_auto()%>.png"  alt="Immagine non disponibile">
                    
                        
                        <h2 class="marca"><%= product.getNome_auto() %></h2>
                        <br>
                        <h4 class="sottotitolo"><%= product.getAnno_auto() %>-<%= product.getCarburante() %>-<%= product.getChilometraggio() %></h4>
                        <br>
                        <h4 class="cambio"><%= product.getCambio() %></h4>
                                <button class="bottone"> <a class="a_colore" href="./CarrelloServlet?operation=add&productId=<%= product.getID_PRODOTTO()%>">Carrello</a></button>
                        
                        <button class="visualizza"> <a class="a_colore" href="./ProdottoServlet?idProdotto=<%= product.getID_PRODOTTO() %>">Visualizza</a></button>
                        
                     </div>
        <%
                }
            } else {
                // Nel caso in cui non ci siano prodotti
                out.println("<p>Nessun prodotto trovato</p>");
                
            }
        %>

    </section>
    
    


    
    
    
     
    
    
   <%@ include file= "./fragment/footer.jsp" %>

</body>
</html>






   


