package p0718;

import java.util.*;

public class Customer {
	private int id;
	private String name;
	private String address;
	private String tel;
	private List<Order> orderings;

	public Customer() {}
	
public Customer(int id, String name, String address, String tel) {
		this.id = id;
		this.name = name;
		this.address = address;
		this.tel = tel;
	}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getTel() {
	return tel;
}

public void setTel(String tel) {
	this.tel = tel;
}

public List<Order> getOrderings() {
    return orderings;
}

public void setOrderings(List<Order> orderings) {
    this.orderings = orderings;
}

}
