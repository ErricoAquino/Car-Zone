package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DriverManagerConnectionpool;
import model.UserBean;

@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<UserBean> users = new ArrayList<>();
        List<String> errors = new ArrayList<>();
        Connection con = null;
        Statement s = null;
        ResultSet rs = null;

        try {
            con = DriverManagerConnectionpool.getConnection();
            String sql = "SELECT ID_ACCOUNT, Nome, Cognome, Email FROM USERACCOUNT";
            s = con.createStatement();
            rs = s.executeQuery(sql);

            while (rs.next()) {
                UserBean user = new UserBean();
                user.setCode(rs.getInt("ID_ACCOUNT"));
                user.setNome(rs.getString("Nome"));
                user.setCognome(rs.getString("Cognome"));
                user.setEmail(rs.getString("Email"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
            errors.add("Si è verificato un errore durante il recupero degli utenti. Per favore riprova.");
            request.setAttribute("errors", errors);
        } finally {
            try {
                if (rs != null) rs.close();
                if (s != null) s.close();
                if (con != null) DriverManagerConnectionpool.releaseConnection(con);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("/ammricercaordini.jsp").forward(request, response);
    }
}
