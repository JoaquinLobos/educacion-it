package ar.com.educacionit.services.parser;

public class Producto {

	private Long id;
	private String title;
	private String code;
	private Double price;

	public Producto(Long id, String title, String code, Double price) {
		this.id = id;
		this.title = title;
		this.code = code;
		this.price = price;
	}

	public Producto() {
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Producto [id=" + id + ", title=" + title + ", code=" + code + ", price=" + price + "]";
	}

}
