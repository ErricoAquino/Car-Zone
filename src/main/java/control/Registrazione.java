package control;

import model.UserBean;
import model.DriverManagerConnectionpool;

import java.io.IOException;
import java.security.MessageDigest;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Registrazione")
public class Registrazione extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Registrazione() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("loggedInUser");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("sicurezza.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String telefono = request.getParameter("telefono");

        List<String> errors = new ArrayList<>();
        RequestDispatcher dispatcherToRegisterPage = request.getRequestDispatcher("registrazione.jsp");

        // Validazione dei campi
        if (nome == null || nome.trim().isEmpty()) {
            errors.add("Il campo nome non può essere vuoto!");
        }
        if (cognome == null || cognome.trim().isEmpty()) {
            errors.add("Il campo cognome non può essere vuoto!");
        }
        if (email == null || email.trim().isEmpty()) {
            errors.add("Il campo email non può essere vuoto!");
        }
        if (password == null || password.trim().isEmpty()) {
            errors.add("Il campo password non può essere vuoto!");
        }
        if (telefono == null || telefono.trim().isEmpty()) {
            errors.add("Il campo telefono non può essere vuoto!");
        }

        // Se ci sono errori, ritorna alla pagina di registrazione
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            dispatcherToRegisterPage.forward(request, response);
            return;
        }

        // Creazione di un oggetto UserBean e impostazione dei suoi attributi
        UserBean newUser = new UserBean();
        newUser.setNome(nome);
        newUser.setCognome(cognome);
        newUser.setEmail(email);
        newUser.setTelefono(telefono);
        newUser.setRole("user"); // Impostazione predefinita del ruolo

        // Salvataggio dell'utente nel database
        try {
            Connection con = DriverManagerConnectionpool.getConnection();
            String sql = "INSERT INTO USERACCOUNT (Nome, Cognome, Email, password, Telefono, Ruolo) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newUser.getNome());
            ps.setString(2, newUser.getCognome());
            ps.setString(3, newUser.getEmail());
            ps.setString(4, checkPsw(password)); // Hashing della password
            ps.setString(5, newUser.getTelefono());
            ps.setString(6, newUser.getRole());

            int result = ps.executeUpdate();
            DriverManagerConnectionpool.releaseConnection(con);

            if (result > 0) {
                // Salva l'utente nella sessione
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", newUser);
                
                // Reindirizza alla pagina di sicurezza
                response.sendRedirect(request.getContextPath() + "/Registrazione");
            } else {
                errors.add("Errore durante la registrazione. Per favore riprova.");
                request.setAttribute("errors", errors);
                dispatcherToRegisterPage.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            errors.add("Si è verificato un errore durante la registrazione. Per favore riprova.");
            request.setAttribute("errors", errors);
            dispatcherToRegisterPage.forward(request, response);
        }
    }

    private String checkPsw(String psw) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            e.printStackTrace();
        }
        byte[] messageDigest = md.digest(psw.getBytes());
        BigInteger number = new BigInteger(1, messageDigest);
        String hashtext = number.toString(16);

        return hashtext;
    }
}
