package ch05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "todo", urlPatterns = { "/todo" })
public class Todoapp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Todoapp() {
        super();
    }

    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		
		
		PrintWriter out = response.getWriter();
		out.append("<!doctype html><html><head><title>Hello World Servlet</title></head><body>")
		.append(java.time.LocalDateTime.now()+"hr")
		.append("<div class=\"input-group\">\r\n"
				+ "			<input id=\"item\" class=\"form-control\" type=\"text\" placeholder=\"할일을 입력하세요..\">\r\n"
				+ "			<button type=\"button\" class=\"btn btn-primary\" onclick=\"addItem()\">할일 추가</button>\r\n"
				+ "			<button type=\"button\" id=\"delete\"  onclick=\"deleteItem()\">완료된 일 삭제</button>")
		.append("</body></html>");
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
