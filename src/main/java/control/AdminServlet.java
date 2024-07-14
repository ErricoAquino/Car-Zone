package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DriverManagerConnectionpool;
import model.ProductBean;
import model.ProductDAODataSource;
import model.UserBean;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Ottiene la sessione, non crea una nuova se non esiste

        if (session != null) {
            Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
            if (isAdmin != null && isAdmin) {
                try {
                    // Recupera la lista dei prodotti
                    Collection<ProductBean> products = new ProductDAODataSource().doRetrieveAll(null);
                    session.setAttribute("products", products);
                    System.out.println("Numero di prodotti recuperati: " + products.size());

                    // Recupera la lista degli utenti registrati
                    List<UserBean> users = new ArrayList<>();
                    Connection con = DriverManagerConnectionpool.getConnection();
                    String sql = "SELECT ID_ACCOUNT, Nome, Cognome, Email, Telefono, Ruolo FROM USERACCOUNT";
                    Statement s = con.createStatement();
                    ResultSet rs = s.executeQuery(sql);

                    while (rs.next()) {
                        UserBean user = new UserBean();
                        user.setCode(rs.getInt("ID_ACCOUNT"));
                        user.setNome(rs.getString("Nome"));
                        user.setCognome(rs.getString("Cognome"));
                        user.setEmail(rs.getString("Email"));
                        user.setTelefono(rs.getString("Telefono"));
                        user.setRole(rs.getString("Ruolo"));
                        users.add(user);
                    }
                    DriverManagerConnectionpool.releaseConnection(con);

                    // Inserisce la lista degli utenti nella richiesta
                    request.setAttribute("users", users);
                    System.out.println("Numero di utenti recuperati: " + users.size());

                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                            "Errore nel recupero dei dati dal database: " + e.getMessage());
                    return;
                }
            } else {
                System.out.println("Utente non autorizzato.");
                response.sendRedirect(request.getContextPath() + "/login.jsp"); // Reindirizza alla pagina di login se l'utente non è amministratore
                return;
            }
        } else {
            System.out.println("Sessione non trovata o non creata.");
            response.sendRedirect(request.getContextPath() + "/login.jsp"); // Reindirizza alla pagina di login se la sessione non esiste
            return;
        }

        // Inoltra alla pagina amministratore.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ammricercaordini.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
