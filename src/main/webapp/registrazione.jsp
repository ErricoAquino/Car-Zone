<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Registrazione</title>
    <link rel="stylesheet" href="css/style-registrazione.css">
    <script src="js/registrazione.js"></script>
  
</head>
<body>

   <%@ include file= "./fragment/header1.jsp" %>
   
  <section id="form">

    <div class="container">
        <form action="Registrazione" method="POST" onsubmit="return validateForm()">
            <h2>Registrazione</h2>
            <div class="gruppo-reg">
                <label for="nome">Nome</label>
                <input type="text" id="nome" name="nome" placeholder="inserisci nome" required>
            </div>
            <div class="gruppo-reg">
                <label for="cognome">Cognome</label>
                <input type="text" id="cognome" name="cognome" placeholder="inserisci cognome" required>
            </div>
            <div class="gruppo-reg">
                <label for="email">E-mail</label>
                <input type="email" id="email" name="email" placeholder="inserisci e-mail" required>
            </div>
            <div class="gruppo-reg">
                <label for="telefono">Numero di telefono</label>
                <input type="text" id="telefono" name="telefono" placeholder="inserisci il numero di telefono" required>
            </div>
            <div class="gruppo-reg">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="inserisci password" required>
            </div>
            <div class="gruppo-reg">
                <label for="confirmPassword">Conferma Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="conferma password" required>
                 <span id="passwordError" class="error-message"></span>
            </div>

            <!-- Gestione degli errori -->
            <%
                List<String> errors = (List<String>) request.getAttribute("errors");
                if (errors != null && !errors.isEmpty()) {
            %>
                <div class="error-messages">
                    <ul>
                        <% for (String error : errors) { %>
                            <li><%= error %></li>
                        <% } %>
                    </ul>
                </div>
            <% } %>

            <button type="submit">Registrati</button>
        </form>
    </div>
    
  </section> 
    
  <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>

