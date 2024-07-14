package control;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import model.PagamentoBean;
import model.PagamentoDAODataSource;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/sicurezza")
public class RetrivePagamento extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PagamentoDAODataSource pagamentoDAO = new PagamentoDAODataSource();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Non crea una nuova sessione se non esiste
        if (session == null || session.getAttribute("ID_ACCOUNT") == null) {
            // Utente non autenticato, reindirizza alla pagina di login
            response.sendRedirect("login.jsp");
            return;
        }
        
        int idAccount = (int) session.getAttribute("ID_ACCOUNT");

        try {

            PagamentoBean pagamento = pagamentoDAO.doRetrieveByKey(idAccount);
            request.setAttribute("pagamento", pagamento);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve spedizione from database", e);
        }

        request.getRequestDispatcher("/sicurezza.jsp").forward(request, response);
    }

}

