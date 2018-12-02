package model;

import java.util.Enumeration;
import java.util.Hashtable;

public class Cart {
	public static final double TAX_PERCENT=0.058;
	private Hashtable<Integer,CartItem> cartItems=new Hashtable<Integer,CartItem>();
	private double shippmentAmount;
	public void setShippmentAmount(double amt) {
		this.shippmentAmount=amt;
	}
	public double getShippmentAmount() {
		return shippmentAmount;
	}
	
	public Enumeration<CartItem> getCartItems() {
		return cartItems.elements();
	}

	
	public void addItem(int quantity, SalesItem item) {
		if(cartItems.get(item.getItemId())!=null ) {
			CartItem cartItem = (CartItem) cartItems.get(item.getItemId());
			cartItem.add(quantity);
		}
		else {
			cartItems.put(item.getItemId(),new CartItem(quantity,item));
		}
	}
	public void removeItem(int id, int count) {
		CartItem item = (CartItem) cartItems.get(id);
		if(item.removeItem(count)<=0) {
			cartItems.remove(id);
		}	
	}		      
		public double getTotalAmount() {
			double total=0.0;
			Enumeration<CartItem> e = cartItems.elements();
			while(e.hasMoreElements()) {
				total= total+((CartItem)e.nextElement()).getTotalPrice();
			}
			return total;
		}
		public int getTotalItems() {
			int total=0;
			Enumeration<CartItem> e = cartItems.elements();
			while(e.hasMoreElements()) {
				total= total+((CartItem)e.nextElement()).getItemCount();
			}
			return total;
		}
		
}
