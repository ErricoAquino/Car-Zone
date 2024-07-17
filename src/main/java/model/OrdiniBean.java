package model;

import java.io.Serializable;

public class OrdiniBean implements Serializable {
    private static final long serialVersionUID = 2856723757650934254L;

    public OrdiniBean() {
        Numeroprodotti = "";
        Dataacquisto = "";
        Account = 0;
        Prodotto = "";
        Pagamento="";
       
    }

    public void setNumeroprodotti(String newNumeroprodotti) {
        Numeroprodotti = newNumeroprodotti;
    }

    public String getNumeroprodotti() {
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
    
    public void setPagamento(String newPagamento) {
        Pagamento = newPagamento;
    }

    public String getPagamento() {
        return Pagamento;
    }




    private String Numeroprodotti;
    private String Dataacquisto;
    private int Code;
    private int Account;
    private String Prodotto;
    private String Pagamento;
 

    public void add(OrdiniBean pagamento) {
        // TODO Auto-generated method stub

    }
}
