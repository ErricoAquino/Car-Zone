package model;

public class CartItemBean {
	
	private int Quantita;
	private float Prezzo;
	private ProductBean Prodotto;
	private int ProductId;
	
	public CartItemBean() {
		this.Quantita = 0;
		this.Prezzo = 0;
		this.Prodotto = null;
		this.ProductId = 0;	
	}
	
	public int getQuantita() {
        return Quantita;
    }

    public void setQuantita(int Quantita) {
        this.Quantita = Quantita;
    }

    public float getPrezzo() {
        return Prezzo;
    }

    public void setPrezzo(float Prezzo) {
        this.Prezzo = Prezzo;
    }

    public ProductBean getProdotto() {
        return Prodotto;
    }

    public void setProdotto(ProductBean Prodotto) {
        this.Prodotto = Prodotto;
    }

    public int getProductId() {
        return ProductId;
    }

    public void setProductId(int ProductId) {
        this.ProductId = ProductId;
    }
}

