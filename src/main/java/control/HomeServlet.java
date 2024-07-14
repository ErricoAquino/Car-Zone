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

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false); // Ottiene la sessione, non crea una nuova se non esiste

        if (session != null) {
            //UserBean loggedUser = (UserBean) session.getAttribute("user"); // Legge l'utente loggato dalla sessione

            
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
            System.out.println("Sessione non trovata o non creata.");
        }

        // Reindirizzamento alla home.jsp dopo aver configurato la sessione
        response.sendRedirect(request.getContextPath() + "/home.jsp");
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Eventuali operazioni per il metodo POST
    }
}





