package model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CartBean {
    private List<CartItemBean> items;

    public CartBean() {
        items = new ArrayList<>();
    }

    public List<CartItemBean> getItems() {
        return items;
    }

    public void setItems(List<CartItemBean> items) {
        this.items = items;
    }

    public void addItem(CartItemBean item) {
        // Verifica se l'articolo è già nel carrello per incrementare la quantità
        for (CartItemBean existingItem : items) {
            if (existingItem.getProductId() == item.getProductId()) {
                existingItem.setQuantita(existingItem.getQuantita() + item.getQuantita());
                return;
            }
        }
        // Se l'articolo non è presente, aggiungi un nuovo elemento al carrello
        items.add(item);
    }

    public void removeItem(int productId) {
        Iterator<CartItemBean> iterator = items.iterator();
        while (iterator.hasNext()) {
            CartItemBean item = iterator.next();
            if (item.getProductId() == productId) {
            	iterator.remove();	
                
                return;
            }
        }
    }

    public void addQuantity(int productId, int quantityToAdd) {
        for (CartItemBean item : items) {
            if (item.getProductId() == productId) {
                item.setQuantita(item.getQuantita() + quantityToAdd);
                return;
            }
        }
    }

    public void removeQuantity(int productId, int quantityToRemove) {
        Iterator<CartItemBean> iterator = items.iterator();
        while (iterator.hasNext()) {
            CartItemBean item = iterator.next();
            if (item.getProductId() == productId) {
                int newQuantity = item.getQuantita() - quantityToRemove;
                if (newQuantity > 0) {
                    item.setQuantita(newQuantity);
                } else {
                    iterator.remove();
                }
                return;
            }
        }
    }

    public void emptyCart() {
        items.clear();
    }
}


