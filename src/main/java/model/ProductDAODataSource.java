package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAODataSource implements IBeanDAO<ProductBean> {

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
    private static final String COLUMN_IMMAGINE = "Immagine";


    @Override
    public synchronized void doSave(ProductBean product) throws SQLException {
    	
    	

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO " + TABLE_NAME + " (" + COLUMN_NOME + ", " + COLUMN_ANNO + ", " + COLUMN_GARANZIA + ", " + COLUMN_ANNOIMM + ", " + COLUMN_CAMBIO + ", " + COLUMN_POTENZA + " , " + COLUMN_CHILOMETRAGGIO + " , " + COLUMN_CARBURANTE + " , " + COLUMN_CILINDRATA + " , " + COLUMN_TARGA + " , " + COLUMN_TELAIO + " , " + COLUMN_TRAZIONE + " , " + COLUMN_POSTI + " , " + COLUMN_EMISSIONE + " , " + COLUMN_EMISSIONICO2 + " , " + COLUMN_MATERIALEVOLANTE + " , " + COLUMN_BLUETOOTH + " , " + COLUMN_DESCRIZIONE + " , " + COLUMN_PREZZO + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL,
                    Statement.RETURN_GENERATED_KEYS);
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
            
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                	product.setID_PRODOTTO(generatedKeys.getInt(1));
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
            
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
    
   
    public synchronized int doEdit(ProductBean product) throws SQLException {

    	int output = 0;
    		
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String updateSQL = "UPDATE " + TABLE_NAME + " SET " +
                COLUMN_ANNO + " = ?, " +
                COLUMN_GARANZIA + " = ?, " +
                COLUMN_ANNOIMM + " = ?, " +
                COLUMN_CAMBIO + " = ?, " +
                COLUMN_POTENZA + " = ?, " +
                COLUMN_CHILOMETRAGGIO + " = ?, " +
                COLUMN_CARBURANTE + " = ?, " +
                COLUMN_CILINDRATA + " = ?, " +
                COLUMN_TARGA + " = ?, " +
                COLUMN_TELAIO + " = ?, " +
                COLUMN_TRAZIONE + " = ?, " +
                COLUMN_POSTI + " = ?, " +
                COLUMN_EMISSIONE + " = ?, " +
                COLUMN_EMISSIONICO2 + " = ?, " +
                COLUMN_MATERIALEVOLANTE + " = ?, " +
                COLUMN_BLUETOOTH + " = ?, " +
                COLUMN_DESCRIZIONE + " = ?, " +
                COLUMN_PREZZO + " = ?, " +
                COLUMN_NOME + " = ? " +
                " WHERE ID_PRODOTTO = ? "; 

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(updateSQL);
            
            preparedStatement.setInt(1, product.getAnno_auto());
            preparedStatement.setString(2, product.getGaranzia_passpropr());
            preparedStatement.setInt(3, product.getAnno_immatricolazione());
            preparedStatement.setString(4, product.getCambio());
            preparedStatement.setString(5, product.getPotenza());
            preparedStatement.setString(6, product.getChilometraggio());
            preparedStatement.setString(7, product.getCarburante());
            preparedStatement.setString(8, product.getCilindrata());
            preparedStatement.setString(9, product.getTarga());
            preparedStatement.setInt(10, product.getN_telaio());
            preparedStatement.setString(11, product.getTrazione());
            preparedStatement.setInt(12, product.getPosti());
            preparedStatement.setString(13, product.getClasse_emissione());
            preparedStatement.setString(14, product.getEmissioni_co2());
            preparedStatement.setString(15, product.getMateriale_volante());
            preparedStatement.setString(16, product.getBluetooth());
            preparedStatement.setString(17, product.getDescrizione());
            preparedStatement.setDouble(18, product.getPrezzo());
            preparedStatement.setString(19, product.getNome_auto());
            // Set the WHERE condition parameter
            preparedStatement.setString(20, ""+product.getID_PRODOTTO());

            int rowsAffected = preparedStatement.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Product updated: " + product.getNome_auto());
            } else {
                System.out.println("No product found with name: " + product.getNome_auto());
            }
            
            output = rowsAffected;

        } 
        catch (Exception e) {
        	System.out.println(e.toString());
		}
        finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        
        return output;
    }


    @Override
    public synchronized boolean doDelete(int idProdotto) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = 0;

        String deleteSQL = "DELETE FROM " + ProductDAODataSource.TABLE_NAME + " WHERE " + COLUMN_ID_PRODOTTO + " = ?";

        try {
            connection = ds.getConnection();
            System.out.println("Database connection established for doDelete");
            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setInt(1, idProdotto);

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
    public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        Collection<ProductBean> products = new LinkedList<ProductBean>();

        String selectSQL = "SELECT " + COLUMN_ID_PRODOTTO + ", " + COLUMN_NOME + ", " + COLUMN_ANNO + ", " + COLUMN_GARANZIA + ", " + COLUMN_ANNOIMM + ", " + COLUMN_CAMBIO + ", " + COLUMN_POTENZA + ", " + COLUMN_CHILOMETRAGGIO + ", " + COLUMN_CARBURANTE + ", " + COLUMN_CILINDRATA + ", " + COLUMN_TARGA + ", " + COLUMN_TELAIO + ", " + COLUMN_TRAZIONE + ", " + COLUMN_POSTI + ", " + COLUMN_EMISSIONE + ", " + COLUMN_EMISSIONICO2 + ", " + COLUMN_MATERIALEVOLANTE + ", " + COLUMN_BLUETOOTH + ", " + COLUMN_DESCRIZIONE + ", " + COLUMN_PREZZO + " FROM " + TABLE_NAME;


        if (order != null && !order.equals("")) {
            selectSQL += " ORDER BY " + order;
        }

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                ProductBean bean = new ProductBean();

                bean.setID_PRODOTTO(rs.getInt("ID_PRODOTTO"));
                bean.setNome_auto(rs.getString("Nome_auto"));
                bean.setAnno_auto(rs.getInt("Anno_auto"));
                bean.setGaranzia_passpropr(rs.getString("Garanzia_passpropr"));
                bean.setAnno_immatricolazione(rs.getInt("Anno_immatricolazione"));
                bean.setCambio(rs.getString("Cambio"));
                bean.setPotenza(rs.getString("Potenza"));
                bean.setChilometraggio(rs.getString("Chilometraggio"));
                bean.setCarburante(rs.getString("Carburante"));
                bean.setCilindrata(rs.getString("Cilindrata"));
                bean.setTarga(rs.getString("Targa"));
                bean.setN_telaio(rs.getInt("N_telaio"));
                bean.setTrazione(rs.getString("Trazione"));
                bean.setPosti(rs.getInt("Posti"));
                bean.setClasse_emissione(rs.getString("Classe_emissione"));
                bean.setEmissioni_co2(rs.getString("Emissioni_co2"));
                bean.setMateriale_volante(rs.getString("Materiale_volante"));
                bean.setBluetooth(rs.getString("Bluetooth"));
                bean.setDescrizione(rs.getString("Descrizione"));
                bean.setPrezzo(rs.getDouble("Prezzo"));

                products.add(bean);
            }

        } 
        
     // Esempio di logging degli errori in ProductDAODataSource
        catch (SQLException e) {
            e.printStackTrace();
            // Logga l'errore per il debug
            throw new SQLException("Errore durante il recupero dei prodotti dal database", e);
        }finally {
            try {
            	if (rs != null) rs.close();
                if (preparedStatement != null)  preparedStatement.close();
                if (connection != null) connection.close();
                
            }catch (SQLException e) {
                e.printStackTrace();
            }
        
        }
        
        
        return products;
    }
    
    

    @Override
    public synchronized ProductBean doRetrieveByKey(int idProdotto) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ProductBean bean = new ProductBean();
        String selectSQL = "SELECT " + COLUMN_ID_PRODOTTO + ", " + COLUMN_NOME + ", " + COLUMN_ANNO + ", " + COLUMN_GARANZIA + ", " + COLUMN_ANNOIMM + ", " + COLUMN_CAMBIO + ", " + COLUMN_POTENZA + " , " + COLUMN_CHILOMETRAGGIO + ", " + COLUMN_CARBURANTE + " , " + COLUMN_CILINDRATA + " , " + COLUMN_TARGA + " , " + COLUMN_TELAIO + " , " + COLUMN_TRAZIONE + " , " + COLUMN_POSTI + " , " + COLUMN_EMISSIONE + " , " + COLUMN_EMISSIONICO2 + " , " + COLUMN_MATERIALEVOLANTE + " , " + COLUMN_BLUETOOTH + " , " + COLUMN_DESCRIZIONE + " ," + COLUMN_PREZZO + " FROM " + TABLE_NAME + " WHERE " + COLUMN_ID_PRODOTTO + " = ?";
        
        try {
            connection = ds.getConnection();
            System.out.println("Database connection established for doRetrieveByKey");
            
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, idProdotto);
            System.out.println("Executing query: " + selectSQL);
            
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                bean.setID_PRODOTTO(rs.getInt("ID_PRODOTTO"));
                bean.setNome_auto(rs.getString("Nome_auto"));
                bean.setAnno_auto(rs.getInt("Anno_auto"));
                bean.setGaranzia_passpropr(rs.getString("Garanzia_passpropr"));
                bean.setAnno_immatricolazione(rs.getInt("Anno_immatricolazione"));
                bean.setCambio(rs.getString("Cambio"));
                bean.setPotenza(rs.getString("Potenza"));
                bean.setChilometraggio(rs.getString("Chilometraggio"));
                bean.setCarburante(rs.getString("Carburante"));
                bean.setCilindrata(rs.getString("Cilindrata"));
                bean.setTarga(rs.getString("Targa"));
                bean.setN_telaio(rs.getInt("N_telaio"));
                bean.setTrazione(rs.getString("Trazione"));
                bean.setPosti(rs.getInt("Posti"));
                bean.setClasse_emissione(rs.getString("Classe_emissione"));
                bean.setEmissioni_co2(rs.getString("Emissioni_co2"));
                bean.setMateriale_volante(rs.getString("Materiale_volante"));
                bean.setBluetooth(rs.getString("Bluetooth"));
                bean.setDescrizione(rs.getString("Descrizione"));
                bean.setPrezzo(rs.getDouble("Prezzo"));
                
                System.out.println("Retrieved product by key: " + bean.getNome_auto() + ", " + bean.getAnno_auto()+ ", " + bean.getGaranzia_passpropr()+ ", " + bean.getAnno_immatricolazione() + " , " + bean.getCambio() + ", " + bean.getPotenza() + ", " + bean.getChilometraggio()+ ", " + bean.getCarburante()+ ", " + bean.getCilindrata() + " , " + bean.getTarga()+ ", " + bean.getN_telaio()+ ", " + bean.getTrazione()+ " , " + bean.getPosti()+ ", " + bean.getClasse_emissione()+ ", " + bean.getEmissioni_co2()+ ", " + bean.getMateriale_volante()+ ", " + bean.getBluetooth() + ", " + bean.getDescrizione() + ", " + bean.getPrezzo() );
            
            }
        }catch (SQLException e) {
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

