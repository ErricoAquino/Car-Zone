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
import model.ProductBean;
import model.ProductDAODataSource; 

@WebServlet("/ModificaProdottoServlet")
public class ModificaProdottoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int idProdotto = Integer.parseInt(request.getParameter("idProdotto"));

    	ProductDAODataSource productDAO = new ProductDAODataSource();
    	ProductBean prodotto = null;
    	try {
    	    prodotto = productDAO.doRetrieveByKey(idProdotto);
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	    request.setAttribute("error", "Errore durante il recupero del prodotto.");
    	    request.getRequestDispatcher("/home.jsp").forward(request, response);
    	    return;
    	}

    	request.setAttribute("prodotto", prodotto);
    	request.getRequestDispatcher("/modificaprodotto.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	
        	Enumeration<String> parameterNames = request.getParameterNames();
        	List<String> parameterNamesList = Collections.list(parameterNames);
        
        	int ID_PRODOTTO = Integer.parseInt(request.getParameter("ID_PRODOTTO"));

            String Nome_auto = request.getParameter("Nome_auto");
            int Anno_auto = Integer.parseInt(request.getParameter("Anno_auto"));
            String Garanzia_passpropr = request.getParameter("Garanzia_passpropr");
            int Anno_immatricolazione = Integer.parseInt(request.getParameter("Anno_immatricolazione"));
            String Cambio = request.getParameter("Cambio");
            String Potenza = request.getParameter("Potenza");
            String Chilometraggio = request.getParameter("Chilometraggio");
            String Carburante = request.getParameter("Carburante");
            String Cilindrata = request.getParameter("Cilindrata");
            String Targa = request.getParameter("Targa");
            int N_telaio = Integer.parseInt(request.getParameter("N_telaio"));
            String Trazione = request.getParameter("Trazione");
            int Posti = Integer.parseInt(request.getParameter("Posti"));
            String Classe_emissione = request.getParameter("Classe_emissione");
            String Emissioni_co2 = request.getParameter("Emissioni_co2");
            String Materiale_volante = request.getParameter("Materiale_volante");
            String Bluetooth = request.getParameter("Bluetooth");
            String Descrizione = request.getParameter("Descrizione");
            double Prezzo = Double.parseDouble(request.getParameter("Prezzo"));
            
            ProductBean prodotto = new ProductBean();
            prodotto.setID_PRODOTTO(ID_PRODOTTO);
            prodotto.setNome_auto(Nome_auto);
            prodotto.setAnno_auto(Anno_auto);
            prodotto.setGaranzia_passpropr(Garanzia_passpropr);
            prodotto.setAnno_immatricolazione(Anno_immatricolazione);
            prodotto.setCambio(Cambio);
            prodotto.setPotenza(Potenza);
            prodotto.setChilometraggio(Chilometraggio);
            prodotto.setCarburante(Carburante);
            prodotto.setCilindrata(Cilindrata);
            prodotto.setTarga(Targa);
            prodotto.setN_telaio(N_telaio);
            prodotto.setTrazione(Trazione);
            prodotto.setPosti(Posti);
            prodotto.setClasse_emissione(Classe_emissione);
            prodotto.setEmissioni_co2(Emissioni_co2);
            prodotto.setMateriale_volante(Materiale_volante);
            prodotto.setBluetooth(Bluetooth);
            prodotto.setDescrizione(Descrizione);
            prodotto.setPrezzo(Prezzo);
            
            ProductDAODataSource productDAO = new ProductDAODataSource();
            int editResult = productDAO.doEdit(prodotto);
            
            // Reindirizza alla home.jsp dopo l'aggiornamento
            response.sendRedirect(request.getContextPath() + "/ProdottoServlet?idProdotto="+prodotto.getID_PRODOTTO());
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Errore durante l'aggiornamento del prodotto.");
            request.getRequestDispatcher("/modificaprodotto.jsp").forward(request, response);
        }
    }

}
