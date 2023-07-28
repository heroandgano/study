package customer;

import org.apache.commons.lang3.StringUtils;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;


@WebServlet("/custcontrol")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CustomerDAO dao;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new CustomerDAO();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String view = "";

		if (action == null) {
			getServletContext().getRequestDispatcher("/custcontrol?action=list").forward(request, response);
		} else {
			switch(action) {
			case "list": view = list(request,response);break;
			case "info": view = info(request,response);break;
			 
//			case "removeCustomer":
//                removeCustomer(request, response);
//                //view = list(request, response);
//                break;
			
			}
			if(StringUtils.isNoneBlank(view)) {
			getServletContext().getRequestDispatcher("/customer/"+view).forward(request,response);
		    }
		}
	}

	
	  public String list(HttpServletRequest request, HttpServletResponse response) {
		  request.setAttribute("customers", dao.getAll());
		  return "customerList.jsp";
		  }
	  
	  private String info(HttpServletRequest request, HttpServletResponse response) {
			int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
			 List<Customer> customers = dao.getAll();
	        

			return "customerInfo.jsp";
		}
	  
	  public String insert(HttpServletRequest request, HttpServletResponse response) {
		  Customer c = new Customer();
		  try { BeanUtils.populate(c, request.getParameterMap());
		  } catch (Exception e) {
			  e.printStackTrace();
			  }
	  dao.insert(c);
	  return list(request, response);
	  }
	 

	
//	  public String list(HttpServletRequest request, HttpServletResponse response)
//	  { 
//		  List<Student> studentList = StudentDAO.getAll();
//		  request.setAttribute("studentList", studentList);
//	  return "studentInfo.jsp";
//	  }
//	  
//	  public String insert(HttpServletRequest request, HttpServletResponse response) {
//		  Map map = request.getParameterMap();
//		  Student student = new Student();
//	  try {
//		  BeanUtils.populate(student, request.getParameterMap());
//	  }	  
//	   catch (Exception e) {
//		   e.printStackTrace();
//		   }
//	  dao.insert(student);
//	  return list(request, response);
//	  }
	 
	
}
