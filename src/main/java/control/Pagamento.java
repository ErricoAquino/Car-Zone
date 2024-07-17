package control;

import model.PagamentoBean;
import model.PagamentoDAODataSource;
import model.UserBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Pagamento")
public class Pagamento extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PagamentoDAODataSource pagamentoDAO = new PagamentoDAODataSource();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserBean user = (UserBean) session.getAttribute("user");

        String numeroCarta = request.getParameter("Numero_carta");
        String dataScadenza = request.getParameter("Data_scadenza");
        String cvv = request.getParameter("Cvv");
        String nome = request.getParameter("Nome");
        String cognome = request.getParameter("Cognome");
        String citta = request.getParameter("Citta");
        String cap = request.getParameter("CAP");
        String via = request.getParameter("Via");
        String provincia = request.getParameter("Provincia");

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
        pagamento.setCode(user.getCode());

        try {
            pagamentoDAO.doSave(pagamento);
            request.setAttribute("message", "Dati di pagamento salvati con successo!");
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
