package model;

import java.io.Serializable;

public class OrdiniBean implements Serializable {
    private static final long serialVersionUID = 2856723757650934254L;

    public OrdiniBean() {
        Numeroprodotti = 0;
        Dataacquisto = "";
        Account = 0;
        Prodotto = "";
        Pagamento=0;
        Prezzo = 0;
        Idprodotto = 0;
       
    }

    public void setNumeroprodotti(int newNumeroprodotti) {
        Numeroprodotti = newNumeroprodotti;
    }

    public int getNumeroprodotti() {
        return Numeroprodotti;
    }

    public void setDataacquisto(String newDataacquisto) {
        Dataacquisto = newDataacquisto;
    }

    public String getDataacquisto() {
        return Dataacquisto;
    }

    public void setCode(int newCode) {
        Code = newCode;
    }

    public int getCode() {
        return Code;
    }

    public void setAccount(int newAccount) {
        Account = newAccount;
    }

    public int getAccount() {
        return Account;
    }

    public void setProdotto(String newProdotto) {
        Prodotto = newProdotto;
    }

    public String getProdotto() {
        return Prodotto;
    }
    
    public void setPagamento(int newPagamento) {
        Pagamento = newPagamento;
    }

    public int getPagamento() {
        return Pagamento;
    }
    
    
    
    public void setPrezzo(double newPrezzo) {
        Prezzo = newPrezzo;
    }

    public double getPrezzo() {
        return Prezzo;
    }
    
    
    public void setIdprodotto(int newIdprodotto) {
    	Idprodotto = newIdprodotto;
    }

    public int getIdprodotto() {
        return Idprodotto;
    }




    private int Numeroprodotti;
    private String Dataacquisto;
    private int Code;
    private int Account;
    private String Prodotto;
    private int Pagamento;
    private double Prezzo;
    private int Idprodotto;
 

    public void add(OrdiniBean pagamento) {
        // TODO Auto-generated method stub

    }
}
