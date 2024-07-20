package control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartBean;
import model.CartItemBean;
import model.OrdiniBean;
import model.OrdiniDAODataSource;
import model.PagamentoBean;
import model.PagamentoDAODataSource;
import model.ProductBean;
import model.UserBean;

@WebServlet("/PagaOrdineServlet")
public class PagaOrdineServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            UserBean user = (UserBean) session.getAttribute("user");

            boolean haDatiDiPagamento = false;
            PagamentoBean pagamento = (PagamentoBean) session.getAttribute("pagamento");

            if (pagamento != null && pagamento.getNumero_carta() != null && !pagamento.getNumero_carta().isEmpty()) {
                haDatiDiPagamento = true;
            } else {
                try {
                    PagamentoDAODataSource pagamentoDAO = new PagamentoDAODataSource();
                    PagamentoBean storedPagamento = pagamentoDAO.doRetrieveByKey(user.getCode());
                    if (storedPagamento != null && storedPagamento.getNumero_carta() != null && !storedPagamento.getNumero_carta().isEmpty()) {
                        session.setAttribute("pagamento", storedPagamento);
                        pagamento = storedPagamento;
                        haDatiDiPagamento = true;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (haDatiDiPagamento && pagamento != null) {
                String nome = request.getParameter("nome");
                
                CartBean cart = (CartBean) session.getAttribute("cart");
                List<CartItemBean> cartItems = (List<CartItemBean>) cart.getItems();
                if (cartItems != null && !cartItems.isEmpty()) {
                    ProductBean cartItemProduct = null;
                    for (CartItemBean cartItem : cartItems) {  
                        cartItemProduct = cartItem.getProdotto();
                        
                        try {
                            OrdiniBean ordine = new OrdiniBean();
                            ordine.setProdotto(cartItemProduct.getNome_auto());
                            ordine.setPrezzo(cartItem.getPrezzo());
                            ordine.setAccount(user.getCode());
                            ordine.setNumeroprodotti(cartItem.getQuantita());
                            ordine.setPagamento(pagamento.getID_PAGAMENTO());
                            ordine.setIdprodotto(cartItemProduct.getID_PRODOTTO());
                            ordine.setDataacquisto(new Date(System.currentTimeMillis()).toString());
        
                            OrdiniDAODataSource ordiniDAO = new OrdiniDAODataSource();
                            ordiniDAO.doSave(ordine);
        
                            // Debug output
                            System.out.println("Ordine salvato: " + ordine.getProdotto());
                        } catch (SQLException e) {
                            e.printStackTrace();
                            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore durante il salvataggio dell'ordine");
                            return;
                        }
                    }
                    session.removeAttribute("cart");
                }
                response.sendRedirect("pagamentoeffettuato.jsp");
            } else {
                response.sendRedirect("pagamento.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
