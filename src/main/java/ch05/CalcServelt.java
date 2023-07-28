package ch05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "CalcServelt", urlPatterns = { "/calc" })
public class CalcServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CalcServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		//String op = request.getParameter("op");
		
		long result = 0;
		
		switch(request.getParameter("op")) {
		case "+": result = n1+n2; break;
		case "-": result = n1-n2; break;
		case "*": result = n1*n2; break;
		case "/": result = n1/n2; break;
		}
		
		
		PrintWriter out = response.getWriter();
		out.append("<html><body><h2>계산기 서블릿</h2><hr>")
		.append("계산결과 : "+ result + "</body></html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
