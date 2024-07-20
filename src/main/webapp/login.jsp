<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/style-login.css">
    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
</head>
<body>

    <%@ include file= "./fragment/header1.jsp" %>
   
   <section id="form">
   
       <div class="container">
        <form action="Login" method="POST">
            <h2>Login</h2>
         
            <div class="gruppo-log">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="inserisci email" required>
            </div>
            <div class="gruppo-log">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="inserisci password" required>
            </div>
            
            <div id="error-messages"></div>
            <button type="submit">Accedi</button>
            <p>Non hai un account? <a id="a" href="registrazione.jsp">Registrati</a></p>
        </form>
    </div>
   </section> 
   
   
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const errors = <%= request.getAttribute("errors") != null ? new org.json.JSONArray((java.util.List<String>) request.getAttribute("errors")).toString() : "[]" %>;
            const errorContainer = document.getElementById('error-messages');
            errors.forEach(function(error) {
                const errorDiv = document.createElement('div');
                errorDiv.className = 'error-message';
                errorDiv.textContent = error;
                errorContainer.appendChild(errorDiv);
            });
        });
    </script>
   
   <%@ include file= "./fragment/footer.jsp" %>
   
   
    
    
</body>
</html>
    