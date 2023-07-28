package ch05;

import java.io.IOException;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="Hello", urlPatterns = "/hello1")
public class HelloServlet extends HttpServlet {


	String name0;
	String name1;
	
	@Override
	public void init(ServletConfig sc) throws ServletException {
		super.init(sc);
		
		name0 = sc.getInitParameter("name0");
		name1 = sc.getInitParameter("name1");
		System.out.println("Hello inited");
	}
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
		
		
		
		
		request.getSession().setAttribute("username", "홍길동");
		//request.getServletContext().setAttribute("username", "홍길동");
		RequestDispatcher rd = request.getRequestDispatcher("requestheader");
		response.setContentType("text/html;charset=UTF-8");
		rd.forward(request, response);
		
		
		//response.sendRedirect("/jwbook/requestheader");
		//response.sendRedirect("http://www.naver.com");
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head><title>Hello</title></head>");
		out.println("<body>");
		out.println("<h1>계산결과</h1>");
		out.println("<h1>" +  "</h1>");
		out.println("</body>");
		out.println("</html>");

		
		
		
		/*
		 * response.setContentType("text/html;charset=UTF-8"); PrintWriter out =
		 * response.getWriter();
		 */
		
		
		/*
		 * String n1String = request.getParameter("n1"); System.out.println(n1String);
		 * System.out.println("빈문자열이에요"); String n2String = request.getParameter("n2");
		 * String opString = request.getParameter("op"); int n1 =
		 * Integer.parseInt(n1String); int n2 = Integer.parseInt(n2String); int result =
		 * 0;
		 * 
		 * switch(opString) { case "+": result = n1 + n2; break; case "-": result = n1 -
		 * n2; break; case "*": result = n1 * n2; break; case "/": result = n1 / n2;
		 * break; }
		 */
		
		
		/*
		 * String group = request.getParameter("group");
		 * 
		 * 
		 * String result = "";
		 * 
		 * 
		 * if(group == null) { result = "N/A"; } else { String[] groups =
		 * request.getParameterValues("group"); for (String g:groups) {
		 * 
		 * 
		 * switch(g) { case "cola": result = "콜라"; break; case "cider": result = "사이다";
		 * break; case "juice": result = "쥬스"; break; }
		 * 
		 * result += (result + ","); }
		 * 
		 * }
		 * 
		 * 
		 * 
		 * out.println("<!DOCTYPE html>"); out.println("<html>");
		 * out.println("<head><title>Hello</title></head>"); out.println("<body>");
		 * out.println("<h1>계산결과</h1>"); out.println("<h1>" + result + "</h1>");
		 * out.println("</body>"); out.println("</html>");
		 */
		
		 
	}
	
	@Override
	public void destroy() {
		name0 = null;
		name1 = null;
		System.out.println("Hello destroyed");
	}


}
