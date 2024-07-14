package model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PagamentoDAODataSource implements IBeanDAO<PagamentoBean> {

    private static DataSource ds;

    static {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");

            ds = (DataSource) envCtx.lookup("jdbc/car_zone");

            System.out.println("DataSource lookup successful");

        } catch (NamingException e) {
            System.out.println("Error:" + e.getMessage());
        }
    }

    private static final String TABLE_NAME = "PAGAMENTO";
    private static final String COLUMN_NOME = "Nome";
    private static final String COLUMN_COGNOME = "Cognome";
    private static final String COLUMN_NUMERO_CARTA = "Numero_carta";
    private static final String COLUMN_DATA_SCADENZA = "Data_scadenza";
    private static final String COLUMN_CVV = "Cvv";
    private static final String COLUMN_CITTA = "Citta";
    private static final String COLUMN_CAP = "CAP";
    private static final String COLUMN_VIA = "Via";
    private static final String COLUMN_PROVINCIA = "Provincia";
    private static final String COLUMN_USERACCOUNT = "ID_ACCOUNT";
    @Override
    public synchronized void doSave(PagamentoBean pagamento) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO " + TABLE_NAME + " (" + COLUMN_NOME + ", " + COLUMN_COGNOME + ", " + COLUMN_NUMERO_CARTA + ", " + COLUMN_DATA_SCADENZA + ", " + COLUMN_CVV + ", " + COLUMN_CITTA + ", " + COLUMN_CAP + ", " + COLUMN_VIA + ", " + COLUMN_PROVINCIA + ", " + COLUMN_USERACCOUNT + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = ds.getConnection();
            System.out.println("Database connection established for doSave");
            
            preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setString(1, pagamento.getNome());
            preparedStatement.setString(2, pagamento.getCognome());
            preparedStatement.setString(3, pagamento.getNumero_carta());
            preparedStatement.setString(4, pagamento.getData_scadenza());
            preparedStatement.setString(5, pagamento.getCvv());
            preparedStatement.setString(6, pagamento.getCitta());
            preparedStatement.setString(7, pagamento.getCAP());
            preparedStatement.setString(8, pagamento.getVia());
            preparedStatement.setString(9, pagamento.getProvincia());
            preparedStatement.setInt(10, pagamento.getCode());
            
            preparedStatement.executeUpdate();
            System.out.println("Payment saved: " + pagamento.getNumero_carta());

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
    }

    @Override
    public synchronized boolean doDelete(int idAccount) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = 0;

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE " + COLUMN_USERACCOUNT + " = ?";

        try {
            connection = ds.getConnection();
            System.out.println("Database connection established for doDelete");
            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setInt(1, idAccount);

            result = preparedStatement.executeUpdate();

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return (result != 0);
    }

    @Override
    public synchronized Collection<PagamentoBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Collection<PagamentoBean> payments = new ArrayList<>();


        String selectSQL = "SELECT " + COLUMN_NOME + ", "+ COLUMN_COGNOME + ", " + COLUMN_NUMERO_CARTA + ", "+ COLUMN_NUMERO_CARTA + ", " + COLUMN_DATA_SCADENZA + ", " + COLUMN_CVV + ", " + COLUMN_CITTA + ", " + COLUMN_CAP + ", " + COLUMN_VIA + ", " + COLUMN_PROVINCIA + ", " + COLUMN_USERACCOUNT +  " FROM " + TABLE_NAME;

        if (order != null && !order.equals("")) {
            selectSQL += " ORDER BY " + order;
        }

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                PagamentoBean bean = new PagamentoBean();
                bean.setNome(rs.getString(COLUMN_NOME));
                bean.setCognome(rs.getString(COLUMN_COGNOME));
                bean.setNumero_carta(rs.getString(COLUMN_NUMERO_CARTA));
                bean.setData_scadenza(rs.getString(COLUMN_DATA_SCADENZA));
                bean.setCvv(rs.getString(COLUMN_CVV));
                bean.setCitta(rs.getString(COLUMN_CITTA));
                bean.setCAP(rs.getString(COLUMN_CAP));
                bean.setVia(rs.getString(COLUMN_VIA));
                bean.setProvincia(rs.getString(COLUMN_PROVINCIA));
                bean.setCode(rs.getInt(COLUMN_USERACCOUNT));

                payments.add(bean);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Errore durante il recupero dei pagamenti dal database", e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return payments;
    }

    @Override
    public synchronized PagamentoBean doRetrieveByKey(int idAccount) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        PagamentoBean bean = new PagamentoBean();

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE " + COLUMN_USERACCOUNT + " = ?";

        try {
            connection = ds.getConnection();
            System.out.println("Database connection established for doRetrieveByKey");

            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, idAccount);
            System.out.println("Executing query: " + selectSQL);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
            	bean.setNome(rs.getString(COLUMN_NOME));
                bean.setCognome(rs.getString(COLUMN_COGNOME));
                bean.setNumero_carta(rs.getString(COLUMN_NUMERO_CARTA));
                bean.setData_scadenza(rs.getString(COLUMN_DATA_SCADENZA));
                bean.setCvv(rs.getString(COLUMN_CVV));
                bean.setCitta(rs.getString(COLUMN_CITTA));
                bean.setCAP(rs.getString(COLUMN_CAP));
                bean.setVia(rs.getString(COLUMN_VIA));
                bean.setProvincia(rs.getString(COLUMN_PROVINCIA));
                bean.setCode(rs.getInt(COLUMN_USERACCOUNT));

       
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error executing query: " + selectSQL, e);
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return bean;
    }
}

