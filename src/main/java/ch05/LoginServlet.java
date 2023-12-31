package ch05;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String username;
	String password;
	
	@Override
	public void init(ServletConfig sc) throws ServletException{
		super.init(sc);
		
		username = sc.getInitParameter("username");
		password = sc.getInitParameter("password");
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(this.username.equals(username) && this.password.equals(password)) {
			request.getSession().setAttribute("username", username);
			response.sendRedirect("page1.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
	
	}

}
