<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <title>Registrazione</title>
    <link rel="stylesheet" href="css/style-registrazione.css">
</head>
<body>

   <%@ include file= "./fragment/header1.jsp" %>
   
  <section id="form">

    <div class="container">
        <form action="/submit_registration" method="POST">
            <h2>Registrazione</h2>
            <div class="gruppo-reg">
                <label for="name">Nome</label>
                <input type="text" id="name" name="name" placeholder="inserisci nome" required>
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
                <input type="email" id="telefono" name="telefono" placeholder="inserisci il numero di telefono" required>
            </div>
            <div class="gruppo-reg">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="inserisci password" required>
            </div>
            <div class="gruppo-reg">
                <label for="confirm_password">Conferma Password</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="conferma password" required>
            </div>
            <button type="submit">Registrati</button>
        </form>
    </div>
    
    </section> 
    
    <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>