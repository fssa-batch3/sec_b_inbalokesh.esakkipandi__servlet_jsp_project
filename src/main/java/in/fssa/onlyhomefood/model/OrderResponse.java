package in.fssa.onlyhomefood.model;

import java.util.List;

public class OrderResponse {
		
	private int totalPrice;
	
	private int createdBy;
	private int addressId;
	
	private List<OrderedItems> orderedItems;
	
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	
	public List<OrderedItems> getOrderedItems() {
		return orderedItems;
	}
	public void setOrderedItems(List<OrderedItems> orderedItems) {
		this.orderedItems = orderedItems;
	}
	
	@Override
	public String toString() {
		return "OrderResponse [totalPrice=" + totalPrice + ", CreatedBy=" + createdBy + ", addressId=" + addressId
				+ ", orderedItems=" + orderedItems + "]";
	}
	
	

}
