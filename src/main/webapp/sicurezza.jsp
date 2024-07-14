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
        <a href="#" onclick="openPopup(event, 'dati-utente')">Modifica</a>
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
        <a href="#" onclick="openPopup(event, 'dati-pagamento')">Modifica</a>
    </div>

    <!-- Popup -->
    <div id="popupOverlay" class="overlay-container">
        <div id="popupContent" class="popup-box">
            <h2 style="color: orange;">Modifica dati</h2>
            <form class="form-container">
                <div id="dati-utente" class="form-section">
                    <label for="name">Modifica nome</label>
                    <input type="text" id="name" name="name" placeholder="Inserisci il tuo nuovo nome">
                    
                    <label for="surname">Modifica cognome</label>
                    <input type="text" id="surname" name="surname" placeholder="Inserisci il tuo nuovo cognome">
                    
                    <label for="email">Modifica E-mail</label>
                    <input type="email" id="email" name="email" placeholder="Inserisci la tua nuova e-mail">
                    
                    <label for="phone">Modifica numero di telefono</label>
                    <input type="text" id="phone" name="phone" placeholder="Inserisci il tuo nuovo numero di telefono">
                </div>
                <div id="dati-pagamento" class="form-section">
                    <label for="card">Nuovo numero carta</label>
                    <input type="text" id="card" name="card" placeholder="Inserisci il tuo nuovo numero di carta">
                    
                    <label for="expiration">Nuova scadenza carta</label>
                    <input type="text" id="expiration" name="expiration" placeholder="Inserisci la nuova scadenza della carta">
                    
                    <label for="city">Nuova città</label>
                    <input type="text" id="city" name="city" placeholder="Inserisci la tua nuova città">
                    
                    <label for="province">Nuova provincia</label>
                    <input type="text" id="province" name="province" placeholder="Inserisci la tua nuova provincia">
                    
                    <label for="address">Nuova via</label>
                    <input type="text" id="address" name="address" placeholder="Inserisci la tua nuova via">
                    
                    <label for="cap">Nuovo CAP</label>
                    <input type="text" id="cap" name="cap" placeholder="Inserisci il tuo nuovo CAP">
                </div>
                <div class="button-container">
                    <button type="button" onclick="saveChanges()">Salva</button>
                    <button type="button" onclick="closePopup()">Esci</button>
                </div>
            </form>
        </div>
    </div>
 </div>
    <script>
        function openPopup(event, sectionId) {
            event.preventDefault();
            const overlay = document.getElementById('popupOverlay');
            overlay.style.display = 'flex';
            document.body.style.overflow = 'hidden';
            showSection(sectionId);
            populateForm(sectionId);
        }

        function closePopup() {
            const overlay = document.getElementById('popupOverlay');
            overlay.style.display = 'none';
            document.body.style.overflow = 'auto';
        }

        function showSection(sectionId) {
            const sections = document.getElementsByClassName('form-section');
            for (let section of sections) {
                if (section.id === sectionId) {
                    section.style.display = 'flex';
                    section.style.flexDirection = 'column';
                } else {
                    section.style.display = 'none';
                }
            }
        }

        function populateForm(sectionId) {
            if (sectionId === 'dati-utente') {
                document.getElementById('name').value = document.getElementById('userName').innerText;
                document.getElementById('surname').value = document.getElementById('userSurname').innerText;
                document.getElementById('email').value = document.getElementById('userEmail').innerText;
                document.getElementById('phone').value = document.getElementById('userPhone').innerText;
            } else if (sectionId === 'dati-pagamento') {
                document.getElementById('card').value = document.getElementById('paymentCard').innerText.replace(/[* ]/g, '');
                document.getElementById('expiration').value = document.getElementById('paymentExpiration').innerText;
                document.getElementById('city').value = document.getElementById('paymentCity').innerText;
                document.getElementById('province').value = document.getElementById('paymentProvince').innerText;
                document.getElementById('address').value = document.getElementById('paymentAddress').innerText;
                document.getElementById('cap').value = document.getElementById('paymentCAP').innerText;
            }
        }

        function saveChanges() {
            alert('Modifiche salvate!');
            closePopup();
        }
    </script>
    
    <%@ include file= "./fragment/footer.jsp" %>
    
</body>
</html>


