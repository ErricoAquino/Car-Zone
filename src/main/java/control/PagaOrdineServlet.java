package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PagamentoBean;
import model.PagamentoDAODataSource;
import model.UserBean;

@WebServlet("/PagaOrdineServlet")
public class PagaOrdineServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            UserBean user = (UserBean) session.getAttribute("user");

            // Verifica se l'utente ha dati di pagamento
            boolean haDatiDiPagamento = false;

            // Esempio di come potresti verificare i dati di pagamento usando il PagamentoBean
            PagamentoBean pagamento = (PagamentoBean) session.getAttribute("pagamento");
            if (pagamento != null && pagamento.getNumero_carta() != null && !pagamento.getNumero_carta().isEmpty()) {
                haDatiDiPagamento = true;
            } else {
                // Puoi aggiungere qui un controllo aggiuntivo per cercare i dati di pagamento nel database
                try {
                    PagamentoDAODataSource pagamentoDAO = new PagamentoDAODataSource();
                    PagamentoBean storedPagamento = pagamentoDAO.doRetrieveByKey(user.getCode());
                    if (storedPagamento != null && storedPagamento.getNumero_carta() != null && !storedPagamento.getNumero_carta().isEmpty()) {
                        session.setAttribute("pagamento", storedPagamento);
                        haDatiDiPagamento = true;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (haDatiDiPagamento) {
                response.sendRedirect("pagamentoeffettuato.jsp");
            } else {
                response.sendRedirect("pagamento.jsp");
            }
        } else {
            response.sendRedirect("login.jsp"); // Se l'utente non è loggato, reindirizza al login
        }
    }
}
