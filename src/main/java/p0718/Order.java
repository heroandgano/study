package p0718;

public class Order {
    private int id;
    private int customerId;
    private int bookId;
    private int saleprice;
    private String orderdate;
    private Customer customer;
    private Book book;
    
    public Order() {}
    
    public Order(int id, int customerId, int bookId, int saleprice, String orderdate) {
    	this.id = id;
    	this.customerId = customerId;
    	this.bookId = bookId;
    	this.saleprice = saleprice;
    	this.orderdate = orderdate;
    }


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public int getBookId() {
		return bookId;
	}


	public void setBookId(int bookId) {
		this.bookId = bookId;
	}


	public int getSaleprice() {
		return saleprice;
	}


	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}


	public String getOrderdate() {
		return orderdate;
	}


	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	
    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

}
