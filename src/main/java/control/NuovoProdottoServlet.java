package control;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.ProductBean;
import model.ProductDAODataSource; 

@WebServlet("/NuovoProdottoServlet")
public class NuovoProdottoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	/*
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
    	*/
    	request.getRequestDispatcher("/nuovoprodotto.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	
        	Enumeration<String> parameterNames = request.getParameterNames();
        	List<String> parameterNamesList = Collections.list(parameterNames);
        
        	

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
            
          // Gestione del file immagine
      /*   Part filePart = request.getPart("itemImmagine");
            String imagePath = null;
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = filePart.getSubmittedFileName();
                String uploadDir = getServletContext().getRealPath("/img");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                File file = new File(uploadDir + File.separator + fileName);
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
                imagePath = fileName; // Salva il nome del file nel database
            } */
            
            
            ProductBean prodotto = new ProductBean();
         
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
         /*  prodotto.setImmagine(imagePath); */
            
            ProductDAODataSource productDAO = new ProductDAODataSource();
            productDAO.doSave(prodotto);
            
            // Reindirizza alla home.jsp dopo l'aggiornamento
            response.sendRedirect(request.getContextPath() + "/ProdottoServlet?idProdotto="+prodotto.getID_PRODOTTO());
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Errore durante l'aggiornamento del prodotto.");
            request.getRequestDispatcher("/nuovoprodotto.jsp").forward(request, response);
        }
    }

}
