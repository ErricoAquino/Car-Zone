package model;

import java.io.Serializable;

public class PagamentoBean implements Serializable {
	private static final long serialVersionUID = 2856723757650934254L;
	
	public PagamentoBean() {
		
		
		this.Nome="";
		this.Cognome="";
		this.Numero_carta="";
		this.Data_scadenza="";
		this.Cvv="";
		this.Citta="";
		this.CAP="";
		this.Via="";
		this.Provincia="";
	}
	
	public int getID_PAGAMENTO() {
        return ID_PAGAMENTO;
    }

    public void setID_PAGAMENTO(int ID_PAGAMENTO) {
        this.ID_PAGAMENTO = ID_PAGAMENTO;
    }
	
	public void setNome(String Nome) {
		this.Nome = Nome;
	}
	
	public String getNome() {
		return Nome;
	}
	
	public void setCognome(String Cognome) {
		this.Cognome = Cognome;
	}
	
	public String getCognome() {
		return Cognome;
	}
	
	
	public void setNumero_carta(String Numero_carta) {
		this.Numero_carta = Numero_carta;
	}
	
	public String getNumero_carta() {
		return Numero_carta;
	}
	
	public void setData_scadenza(String Data_scadenza) {
		this.Data_scadenza = Data_scadenza;
	}
	
	public String getData_scadenza() {
		return Data_scadenza;
	}
	
	public void setCvv(String Cvv ) {
		this.Cvv = Cvv;
	}
	
	public String getCvv() {
		return Cvv;
	}
	
	public void setCitta(String Citta ) {
		this.Citta = Citta;
	}
	
	public String getCitta() {
		return Citta;
	}
	
	public void setCAP(String CAP) {
		this.CAP = CAP;
	}
	
	public String getCAP() {
		return CAP;
	}
	
	public void setVia(String Via) {
		this.Via = Via;
	}
	
	public String getVia() {
		return Via;
	}
	
	public void setProvincia(String Provincia) {
		this.Provincia = Provincia;
	}
	
	public String getProvincia() {
		return Provincia;
	}
	
	public void setCode(int Code) {
		this.Code = Code;
	}
	
	public int getCode() {
		return Code;
	}
	
	private int ID_PAGAMENTO;
	private String Nome;
	private String Cognome;
	private String Numero_carta;
	private String Data_scadenza;
	private String Cvv;
	private String Citta;
	private String CAP;
	private String Via;
	private String Provincia;
	private int Code;

	public void add(PagamentoBean pagamento) {
		// TODO Auto-generated method stub
		
	}
}

