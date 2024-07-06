<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.UserBean"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car-Zone</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="./css/style-header1.css">
</head>
<body>

<header>
    <div class="navbar">
        <div class="logo"><a href="./home.html">Car-Zone</a></div>
        <ul class="links">
            <li><a href="./home.jsp"> <img src="../icon/Home_10.svg" alt=""> Home</a></li>
            <li><a href="./carrello.jsp"> <img src="../icon/cart.svg" alt=""> Carrello</a></li>
            <li><a href="./utente.jsp"> <img src="../icon/account3def.png" alt=""> Account</a></li>
            <%
                UserBean user = (UserBean) session.getAttribute("user");
                if (user != null && "admin".equals(user.getRole())) {
            %>
            <li><a href="./amministratore.jsp"> <img src="../icon/setting-2.png" alt=""> Gestisci</a></li>
            <% } %>
        </ul>
        <%
            if (user == null) {
        %>
        <a href="./login.jsp" class="action_btn">Login</a>
        <%
            } else {
        %>
        <a href="logout" class="action_btn">Esci</a>
        <%
            }
        %>
        <div class="toggle_btn">
            <i class="fa-solid fa-bars"></i>
        </div>
    </div>

    <div class="dropdown_menu">
        <li><a href="./home.jsp">Home</a></li>
        <li><a href="./carrello.jsp">Carrello</a></li>
        <li><a href="./utente.jsp">Account</a></li>
        <% if (user != null && "admin".equals(user.getRole())) { %>
        <li><a href="./amministratore.jsp">Gestisci</a></li>
        <% } %>
        <% if (user == null) { %>
        <li><a href="./login.jsp" class="action_btn">Login</a></li>
        <% } else { %>
        <li><a href="logout" class="action_btn">Esci</a></li>
        <% } %>
    </div>
</header>

<script>
    const toggleBtn = document.querySelector('.toggle_btn')
    const toggleBtnIcon = document.querySelector('.toggle_btn i')
    const dropDownMenu = document.querySelector('.dropdown_menu')

    toggleBtn.onclick = function () {
        dropDownMenu.classList.toggle('open')
        const isOpen = dropDownMenu.classList.contains('open')
        toggleBtnIcon.classList = isOpen ? 'fa-solid fa-xmark' : 'fa-solid fa-bars'
    }
</script>

</body>
</html>

