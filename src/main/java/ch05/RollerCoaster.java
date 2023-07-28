package ch05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(description = "RollerCoaster", urlPatterns = { "/rc" })
public class RollerCoaster extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RollerCoaster() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		int age = Integer.parseInt(request.getParameter("age1"));
		int height = Integer.parseInt(request.getParameter("height1"));
		Boolean perant = Boolean.parseBoolean(request.getParameter("perant1"));
		Boolean hearchDease = Boolean.parseBoolean(request.getParameter("hearchDease1"));

		
		String qustn1 = "";
		if (hearchDease == false) {
			if (age >= 6 && height >= 120) {
				qustn1 = "탄다";
			} else {
				if (height >= 120 && perant) {
					qustn1 = "탄다";
				} else {
					qustn1 = "못타";
				}
			}
		} else {
			qustn1 = "못타";
		}

		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head><title>RollerCoaster</title></head>");
		out.println("<body>");
		out.append("나이는 : " + age + "<hr>")
		.append("키는 : " + height + "<hr>")
		.append("부모동반여부 : " + perant + "<hr>")
		.append("심장병유무 : " + hearchDease + "<hr>")
		.append("탑승 가능여부 : " + qustn1 + "</body></html>");

		
	}

}
