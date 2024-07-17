package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBean;
import model.DriverManagerConnectionpool;

@WebServlet("/ModificaUtenteServlet")
public class ModificaUtenteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Recupera l'utente dalla sessione
            UserBean utente = (UserBean) request.getSession().getAttribute("user");
            request.setAttribute("utente", utente); // Passa l'utente alla JSP
            request.getRequestDispatcher("/modificadatiutente.jsp").forward(request, response); // Reindirizza alla pagina di modifica utente
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Errore durante il recupero dei dati dell'utente.");
            request.getRequestDispatcher("/error.jsp").forward(request, response); // Gestione degli errori
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Recupera l'utente dalla sessione
            UserBean utente = (UserBean) request.getSession().getAttribute("user");

            // Leggi i parametri dal form
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String email = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String ruolo = request.getParameter("ruolo");

            // Aggiorna i dati dell'utente nell'oggetto UserBean
            utente.setNome(nome);
            utente.setCognome(cognome);
            utente.setEmail(email);
            utente.setTelefono(telefono);
            utente.setRole(ruolo);

            // Aggiorna anche nel database
            updateUtente(utente);

            // Reindirizza alla home.jsp dopo l'aggiornamento
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Errore durante l'aggiornamento dei dati dell'utente.");
            request.getRequestDispatcher("/error.jsp").forward(request, response); // Gestione degli errori
        }
    }

    // Metodo per aggiornare i dati dell'utente nel database
    private void updateUtente(UserBean utente)
            throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DriverManagerConnectionpool.getConnection();
            String query = "UPDATE USERACCOUNT SET Nome = ?, Cognome = ?, Email = ?, Telefono = ?, Ruolo = ? WHERE ID_ACCOUNT = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, utente.getNome());
            preparedStatement.setString(2, utente.getCognome());
            preparedStatement.setString(3, utente.getEmail());
            preparedStatement.setString(4, utente.getTelefono());
            preparedStatement.setString(5, utente.getRole());
            preparedStatement.setInt(6, utente.getCode());
            preparedStatement.executeUpdate();
        } finally {
            // Chiudi le risorse
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
}
