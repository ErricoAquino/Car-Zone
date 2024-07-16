package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PagamentoBean;
import model.PagamentoDAODataSource; 

@WebServlet("/ModificaPagamentoServlet")
public class ModificaPagamentoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	int idUtente = Integer.valueOf( request.getSession().getAttribute("ID_ACCOUNT").toString());

    	PagamentoDAODataSource pagamentoDAO = new PagamentoDAODataSource();
    	PagamentoBean pagamento = null;
    	try {
    	    pagamento = pagamentoDAO.doRetrieveByKey(idUtente);
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	    request.setAttribute("error", "Errore durante il recupero del pagamento.");
    	    request.getRequestDispatcher("/home.jsp").forward(request, response);
    	    return;
    	}

    	request.setAttribute("pagamento", pagamento);
    	request.getRequestDispatcher("/modificapagamento.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	
        	Enumeration<String> parameterNames = request.getParameterNames();
        	List<String> parameterNamesList = Collections.list(parameterNames);
        
        	int idUtente = Integer.valueOf( request.getSession().getAttribute("ID_ACCOUNT").toString());

            String Nome = request.getParameter("Nome");
            String Cognome = request.getParameter("Cognome");
            String Numero_carta = request.getParameter("Numero_carta");
            String Data_scadenza = request.getParameter("Data_scadenza");
            String Cvv = request.getParameter("Cvv");
            String Citta = request.getParameter("Citta");
            String CAP = request.getParameter("CAP");
            String Via = request.getParameter("Via");
            String Provincia = request.getParameter("Provincia");
      
            
            
            PagamentoBean pagamento = new PagamentoBean();
            pagamento.setNome(Nome);
            pagamento.setCognome(Cognome);
            pagamento.setNumero_carta(Numero_carta);
            pagamento.setData_scadenza(Data_scadenza);
            pagamento.setCvv(Cvv);
            pagamento.setCitta(Citta);
            pagamento.setCAP(CAP);
            pagamento.setVia(Via);
            pagamento.setProvincia(Provincia);
            pagamento.setCode(idUtente);
           
          
            
            PagamentoDAODataSource pagamentoDAO = new PagamentoDAODataSource();
            int editResult = pagamentoDAO.doEdit(pagamento);
            
            // Reindirizza alla home.jsp dopo l'aggiornamento
            response.sendRedirect(request.getContextPath() + "/sicurezza");
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Errore durante l'aggiornamento del pagamento.");
            request.getRequestDispatcher("/modificapagamento.jsp").forward(request, response);
        }
    }

}
