package control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PagamentoBean;
import model.PagamentoDAODataSource;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

@WebServlet("/Pagamento")
public class Pagamento extends HttpServlet {
    private PagamentoDAODataSource pagamentoDAO = new PagamentoDAODataSource();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Collection<PagamentoBean> spedizioni = pagamentoDAO.doRetrieveAll(null);
            if (!spedizioni.isEmpty()) { // Controlla se la collezione non è vuota
                PagamentoBean pagamento = spedizioni.iterator().next(); // Prende il primo elemento della collezione

                // Imposta gli attributi nella sessione
                request.getSession().setAttribute("Nome", pagamento.getNome());
                request.getSession().setAttribute("Cognome", pagamento.getCognome());
                request.getSession().setAttribute("Numero_carta", pagamento.getNumero_carta());
                request.getSession().setAttribute("Data_scadenza", pagamento.getData_scadenza());
                request.getSession().setAttribute("Cvv", pagamento.getCvv());
                request.getSession().setAttribute("Citta", pagamento.getCitta());
                request.getSession().setAttribute("CAP", pagamento.getCAP());
                request.getSession().setAttribute("Via", pagamento.getVia());
                request.getSession().setAttribute("Provincia", pagamento.getProvincia());

                System.out.println("Dati del pagamento recuperati con successo");
            }

            // Imposta l'attributo "spedizioni" nella richiesta
            request.setAttribute("spedizioni", spedizioni);

            // Inoltra la richiesta a sicurezza.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("sicurezza.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Impossibile recuperare le spedizioni dal database", e);
        }
    }
}
