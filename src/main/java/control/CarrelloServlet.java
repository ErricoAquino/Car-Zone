package control;

import model.CartBean;
import model.CartItemBean;
import model.ProductBean;
import model.ProductDAODataSource;
                                                              
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/CarrelloServlet")
public class CarrelloServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String operation = request.getParameter("operation");

        if (operation != null) {
            switch (operation) {
                case "add":
                    addToCart(request, response);
                    break;
                case "remove":
                    removeFromCart(request, response);
                    break;
                case "addQuantity":
                    addQuantity(request, response);
                    break;
                case "removeQuantity":
                    removeQuantity(request, response);
                    break;
                case "empty":
                    emptyCart(request, response);
                    break;                    
                default:
                    response.sendRedirect(request.getContextPath() + "/carrello.jsp");
            }
        } else {
        	
        	//Se il carrello non esiste viene creato
        	CartBean cart = (CartBean) request.getSession(true).getAttribute("cart");
        	if(cart == null)
        	{
        		cart  = new CartBean();
        		request.getSession(true).setAttribute("cart", cart);
        	}
        	
        	response.sendRedirect(request.getContextPath() + "/carrello.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
       

        try {
            ProductDAODataSource dao = new ProductDAODataSource();
            ProductBean product = dao.doRetrieveByKey(productId);

            if (product != null) {
                CartItemBean item = new CartItemBean();
                item.setProductId(product.getID_PRODOTTO());
                item.setQuantita(1);
                item.setPrezzo((float) product.getPrezzo());
                item.setProdotto(product);

                // Aggiungi l'elemento al carrello
                CartBean cart = getCartFromSession(request);
                cart.addItem(item);
                request.getSession().setAttribute("cart", cart);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database access error", e);
        }

        response.sendRedirect(request.getContextPath() + "/carrello.jsp");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        CartBean cart = getCartFromSession(request);
        cart.removeItem(productId);
        request.getSession().setAttribute("cart", cart);

        response.sendRedirect(request.getContextPath() + "/carrello.jsp");
    }

    private void addQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantityToAdd = 1;

        CartBean cart = getCartFromSession(request);
        cart.addQuantity(productId, 1);
        request.getSession().setAttribute("cart", cart);

        response.sendRedirect(request.getContextPath() + "/carrello.jsp");
    }

    private void removeQuantity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantityToRemove = 1;

        CartBean cart = getCartFromSession(request);
        cart.removeQuantity(productId, quantityToRemove);
        request.getSession().setAttribute("cart", cart);

        response.sendRedirect(request.getContextPath() + "/carrello.jsp");
    }

    private void emptyCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CartBean cart = getCartFromSession(request);
        cart.emptyCart();
        request.getSession().setAttribute("cart", cart);

        response.sendRedirect(request.getContextPath() + "/carrello.jsp");
    }

    private CartBean getCartFromSession(HttpServletRequest request) {
        CartBean cart = (CartBean) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new CartBean();
            request.getSession().setAttribute("cart", cart);
        }
        return cart;
    }
}



