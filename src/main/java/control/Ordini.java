package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrdiniBean;
import model.OrdiniDAODataSource;

@WebServlet("/ordini")
public class Ordini extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("ID_ACCOUNT") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        int idAccount = (int) session.getAttribute("ID_ACCOUNT");

        OrdiniDAODataSource ordiniDAO = new OrdiniDAODataSource();
        List<OrdiniBean> ordiniList = null;

        try {
            ordiniList = ordiniDAO.doRetrieveAllByAccount(idAccount);
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Errore durante il recupero degli ordini: " + e.getMessage());
            request.getRequestDispatcher("/error500.jsp").forward(request, response);
            return;
        }

        request.setAttribute("ordini", ordiniList);
        request.getRequestDispatcher("/ordini.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
}
