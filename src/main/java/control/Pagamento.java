package control;

import model.PagamentoBean;
import model.PagamentoDAODataSource;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Pagamento")
public class Pagamento extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PagamentoDAODataSource pagamentoDAO = new PagamentoDAODataSource();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numeroCarta = request.getParameter("numero_carta");
        String dataScadenza = request.getParameter("data_scadenza");
        String cvv = request.getParameter("cvv");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String citta = request.getParameter("citta");
        String cap = request.getParameter("cap");
        String via = request.getParameter("via");
        String provincia = request.getParameter("provincia");

        PagamentoBean pagamento = new PagamentoBean();
        pagamento.setNumero_carta(numeroCarta);
        pagamento.setData_scadenza(dataScadenza);
        pagamento.setCvv(cvv);
        pagamento.setNome(nome);
        pagamento.setCognome(cognome);
        pagamento.setCitta(citta);
        pagamento.setCAP(cap);
        pagamento.setVia(via);
        pagamento.setProvincia(provincia);

        try {
            pagamentoDAO.doSave(pagamento);
            request.setAttribute("message", "Dati di pagamento salvati con successo!");

            // Passa i dati di pagamento a RetrivePagamento.java per visualizzazione
            request.setAttribute("pagamento", pagamento);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/RetrivePagamento");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Errore durante il salvataggio dei dati di pagamento.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("errore500.jsp");
            dispatcher.forward(request, response);
        }
    }
}
