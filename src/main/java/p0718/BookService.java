package p0718;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookService {
	
	Map<String, Book> books = new HashMap<>();
	
	public BookService() {
		Book b = new Book("1", "축구의 역사", "굿스포츠", 7000);
		books.put("1", b);
		b = new Book("2", "축구아는 여자", "나무수", 13000);
		books.put("2", b);
		b = new Book("3", "축구의 이해", "대한미디어", 22000);
		books.put("3", b);
		b = new Book("4", "골프 바이블", "대한미디어", 35000);
		books.put("4", b);
		b = new Book("5", "피겨 교본", "굿스포츠", 8000);
		books.put("5", b);
		b = new Book("6", "역도 단계별기술", "굿스포츠", 6000);
		books.put("6", b);
		b = new Book("7", "야구의 추억", "이상미디어", 20000);
		books.put("7", b);
		b = new Book("8", "야구를 부탁해", "이상미디어", 13000);
		books.put("8", b);
		b = new Book("9", "올림픽 이야기", "삼성당", 7500);
		books.put("9", b);
		b = new Book("10", "Olympic Champions", "Pearson", 13000);
		books.put("10", b);
		
	}
	
	public List<Book> findAll() {
		return new ArrayList<>(books.values());
	}
	
	public Book find(String string) {
		return books.get(string);
	}
	
}
