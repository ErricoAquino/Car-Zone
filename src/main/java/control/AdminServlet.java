package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
                    // Legge la lista dei prodotti dal database utilizzando ProductDAODataSource
                    Collection<ProductBean> products = new ProductDAODataSource().doRetrieveAll(null);

                    // Inserisce la lista dei prodotti nella sessione
                    session.setAttribute("products", products);

                    // Debug output
                    System.out.println("Numero di prodotti recuperati: " + products.size());
                } catch (SQLException e) {
                    // Gestione dell'eccezione SQL
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                            "Errore nel recupero dei prodotti dal database: " + e.getMessage());
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

        // Reindirizzamento alla amministratore.jsp dopo aver configurato la sessione
        response.sendRedirect(request.getContextPath() + "/amministratore.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Eventuali operazioni per il metodo POST
    }
}

