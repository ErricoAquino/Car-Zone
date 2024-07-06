package model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.util.ArrayList;
import java.util.List;

public class ProductDAODataSource implements IBeanDAO<ProductBean> {

    private static DataSource ds;

    static {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");

            ds = (DataSource) envCtx.lookup("jdbc/car_zone");

            System.out.println("DataSource lookup successful");

        } catch (NamingException e) {
            System.out.println("Error during DataSource lookup: " + e.getMessage());
        }
    }

    private static final String TABLE_NAME = "PRODOTTO";
    private static final String COLUMN_ID_PRODOTTO = "ID_PRODOTTO";
    private static final String COLUMN_NOME = "Nome_auto";
    private static final String COLUMN_ANNO = "Anno_auto";
    private static final String COLUMN_GARANZIA = "Garanzia_passpropr";
    private static final String COLUMN_ANNOIMM = "Anno_immatricolazione";
    private static final String COLUMN_CAMBIO = "Cambio";
    private static final String COLUMN_POTENZA = "Potenza";
    private static final String COLUMN_CHILOMETRAGGIO = "Chilometraggio";
    private static final String COLUMN_CARBURANTE = "Carburante";
    private static final String COLUMN_CILINDRATA = "Cilindrata";
    private static final String COLUMN_TARGA = "Targa";
    private static final String COLUMN_TELAIO = "N_telaio";
    private static final String COLUMN_TRAZIONE = "Trazione";
    private static final String COLUMN_POSTI = "Posti";
    private static final String COLUMN_EMISSIONE = "Classe_emissione";
    private static final String COLUMN_EMISSIONICO2 = "Emissioni_co2";
    private static final String COLUMN_MATERIALEVOLANTE = "Materiale_volante";
    private static final String COLUMN_BLUETOOTH = "Bluetooth";
    private static final String COLUMN_DESCRIZIONE = "Descrizione";
    private static final String COLUMN_PREZZO = "Prezzo";

    @Override
    public synchronized void doSave(ProductBean product) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO " + TABLE_NAME + " (" + COLUMN_NOME + ", " + COLUMN_ANNO + ", " + COLUMN_GARANZIA + ", " + COLUMN_ANNOIMM + ", " + COLUMN_CAMBIO + ", " + COLUMN_POTENZA + " , " + COLUMN_CHILOMETRAGGIO + " , " + COLUMN_CARBURANTE + " , " + COLUMN_CILINDRATA + " , " + COLUMN_TARGA + " , " + COLUMN_TELAIO + " , " + COLUMN_TRAZIONE + " , " + COLUMN_POSTI + " , " + COLUMN_EMISSIONE + " , " + COLUMN_EMISSIONICO2 + " , " + COLUMN_MATERIALEVOLANTE + " , " + COLUMN_BLUETOOTH + " , " + COLUMN_DESCRIZIONE + " , " + COLUMN_PREZZO + " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = ds.getConnection();
            System.out.println("Database connection established for doSave");

            preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setString(1, product.getNome_auto());
            preparedStatement.setInt(2, product.getAnno_auto());
            preparedStatement.setString(3, product.getGaranzia_passpropr());
            preparedStatement.setInt(4, product.getAnno_immatricolazione());
            preparedStatement.setString(5, product.getCambio());
            preparedStatement.setString(6, product.getPotenza()); 
            preparedStatement.setString(7, product.getChilometraggio());
            preparedStatement.setString(8, product.getCarburante());
            preparedStatement.setString(9, product.getCilindrata());
            preparedStatement.setString(10, product.getTarga());
            preparedStatement.setInt(11, product.getN_telaio());
            preparedStatement.setString(12, product.getTrazione());
            preparedStatement.setInt(13, product.getPosti());
            preparedStatement.setString(14, product.getClasse_emissione());
            preparedStatement.setString(15, product.getEmissioni_co2());
            preparedStatement.setString(16, product.getMateriale_volante());
            preparedStatement.setString(17, product.getBluetooth());
            preparedStatement.setString(18, product.getDescrizione());
            preparedStatement.setDouble(19, product.getPrezzo());
            
            

            preparedStatement.executeUpdate();
            System.out.println("Product saved: " + product.getNome_auto());

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
    public synchronized boolean doDelete(int code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = 0;

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE " + COLUMN_ID_PRODOTTO + " = ?";

        try {
            connection = ds.getConnection();
            System.out.println("Database connection established for doDelete");

            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setInt(1, code);

            result = preparedStatement.executeUpdate();
            System.out.println("Product deleted with ID: " + code);

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
    public synchronized List<ProductBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        List<ProductBean> products = new ArrayList<>();

        String selectSQL = "SELECT " + COLUMN_ID_PRODOTTO + ", " + COLUMN_NOME + ", " + COLUMN_ANNO + ", " + COLUMN_GARANZIA + ", " + COLUMN_ANNOIMM + ", " + COLUMN_CAMBIO + ", " + COLUMN_POTENZA + ", " + COLUMN_CHILOMETRAGGIO + ", " + COLUMN_CARBURANTE + ", " + COLUMN_CILINDRATA + ", " + COLUMN_TARGA + ", " + COLUMN_TELAIO + ", " + COLUMN_TRAZIONE + ", " + COLUMN_POSTI + ", " + COLUMN_EMISSIONE + ", " + COLUMN_EMISSIONICO2 + ", " + COLUMN_MATERIALEVOLANTE + ", " + COLUMN_BLUETOOTH + ", " + COLUMN_DESCRIZIONE + ", " + COLUMN_PREZZO + " FROM " + TABLE_NAME;

        if (order != null && !order.isEmpty()) {
            selectSQL += " ORDER BY " + order;
        }

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                ProductBean bean = new ProductBean();
                bean.setCode(rs.getInt(COLUMN_ID_PRODOTTO));
                bean.setNome_auto(rs.getString(COLUMN_NOME));
                bean.setAnno_auto(rs.getInt(COLUMN_ANNO));
                bean.setGaranzia_passpropr(rs.getString(COLUMN_GARANZIA));
                bean.setAnno_immatricolazione(rs.getInt(COLUMN_ANNOIMM));
                bean.setCambio(rs.getString(COLUMN_CAMBIO));
                bean.setPotenza(rs.getString(COLUMN_POTENZA));
                bean.setChilometraggio(rs.getString(COLUMN_CHILOMETRAGGIO));
                bean.setCarburante(rs.getString(COLUMN_CARBURANTE));
                bean.setCilindrata(rs.getString(COLUMN_CILINDRATA));
                bean.setTarga(rs.getString(COLUMN_TARGA));
                bean.setN_telaio(rs.getInt(COLUMN_TELAIO));
                bean.setTrazione(rs.getString(COLUMN_TRAZIONE));
                bean.setPosti(rs.getInt(COLUMN_POSTI));
                bean.setClasse_emissione(rs.getString(COLUMN_EMISSIONE));
                bean.setEmissioni_co2(rs.getString(COLUMN_EMISSIONICO2));
                bean.setMateriale_volante(rs.getString(COLUMN_MATERIALEVOLANTE));
                bean.setBluetooth(rs.getString(COLUMN_BLUETOOTH));
                bean.setDescrizione(rs.getString(COLUMN_DESCRIZIONE));
                bean.setPrezzo(rs.getDouble(COLUMN_PREZZO));

                products.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error retrieving products from database.", e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return products;
    }


    @Override
    public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ProductBean bean = new ProductBean();
        String selectSQL = "SELECT " + COLUMN_ID_PRODOTTO + ", " + COLUMN_NOME + ", " + COLUMN_ANNO + ", " + COLUMN_GARANZIA + ", " + COLUMN_ANNOIMM + ", " + COLUMN_CAMBIO + ", " + COLUMN_POTENZA + " , " + COLUMN_CHILOMETRAGGIO + ", " + COLUMN_CARBURANTE + " , " + COLUMN_CILINDRATA + " , " + COLUMN_TARGA + " , " + COLUMN_TELAIO + " , " + COLUMN_TRAZIONE + " , " + COLUMN_POSTI + " , " + COLUMN_EMISSIONE + " , " + COLUMN_EMISSIONICO2 + " , " + COLUMN_MATERIALEVOLANTE + " , " + COLUMN_BLUETOOTH + " , " + COLUMN_DESCRIZIONE + " ," + COLUMN_PREZZO + " FROM " + TABLE_NAME + " WHERE " + COLUMN_ID_PRODOTTO + " = ?";
        try {
            connection = ds.getConnection();
            System.out.println("Database connection established for doRetrieveByKey");

            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, code);
            System.out.println("Executing query: " + selectSQL);
            

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                bean.setCode(rs.getInt(COLUMN_ID_PRODOTTO));
                bean.setNome_auto(rs.getString(COLUMN_NOME));
                bean.setAnno_auto(rs.getInt(COLUMN_ANNO));
                bean.setGaranzia_passpropr(rs.getString(COLUMN_GARANZIA));
                bean.setAnno_immatricolazione(rs.getInt(COLUMN_ANNOIMM));
                bean.setCambio(rs.getString(COLUMN_CAMBIO));
                bean.setPotenza(rs.getString(COLUMN_POTENZA));
                bean.setChilometraggio(rs.getString(COLUMN_CHILOMETRAGGIO));
                bean.setCarburante(rs.getString(COLUMN_CARBURANTE));
                bean.setCilindrata(rs.getString(COLUMN_CILINDRATA));
                bean.setTarga(rs.getString(COLUMN_TARGA));
                bean.setN_telaio(rs.getInt(COLUMN_TELAIO));
                bean.setTrazione(rs.getString(COLUMN_TRAZIONE));
                bean.setPosti(rs.getInt(COLUMN_POSTI));
                bean.setClasse_emissione(rs.getString(COLUMN_EMISSIONE));
                bean.setEmissioni_co2(rs.getString(COLUMN_EMISSIONICO2));
                bean.setMateriale_volante(rs.getString(COLUMN_MATERIALEVOLANTE));
                bean.setBluetooth(rs.getString(COLUMN_BLUETOOTH));
                bean.setDescrizione(rs.getString(COLUMN_DESCRIZIONE));
                bean.setPrezzo(rs.getInt(COLUMN_PREZZO));
                

                System.out.println("Retrieved product by key: " + bean.getNome_auto() + ", " + bean.getAnno_auto()+ ", " + bean.getGaranzia_passpropr()+ ", " + bean.getAnno_immatricolazione() + " , " + bean.getCambio() + ", " + bean.getPotenza() + ", " + bean.getChilometraggio()+ ", " + bean.getCarburante()+ ", " + bean.getCilindrata() + " , " + bean.getTarga()+ ", " + bean.getN_telaio()+ ", " + bean.getTrazione()+ " , " + bean.getPosti()+ ", " + bean.getClasse_emissione()+ ", " + bean.getEmissioni_co2()+ ", " + bean.getMateriale_volante()+ ", " + bean.getBluetooth() + ", " + bean.getDescrizione() + ", " + bean.getPrezzo());
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