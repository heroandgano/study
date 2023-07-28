package customer;

import org.apache.commons.lang3.StringUtils;

import ch09.Student;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;


@WebServlet("/mcontrol")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderDAO dao;
   
    public OrderController() {
        dao = new OrderDAO();
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String view = "";
		if(request.getParameter("action") == null) {
			getServletContext().getRequestDispatcher("/mcontrol?action=list").forward(request, response);
		}else {
			switch(action) {
			case "addOrdering" :
				addOrdering(request,response);
				view = list(request,response);break;
			case "list": view = list(request,response);break;
			//case "info": view = info(request,response);break;
			}
			getServletContext().getRequestDispatcher("/customer/"+view).forward(request, response);
		}
	}
	private String addOrdering(HttpServletRequest request, HttpServletResponse response)throws IOException {
		try {
			Ordering ordering = new Ordering();
			BeanUtils.populate(ordering, request.getParameterMap());
			dao.insert(ordering);
		}catch(IllegalAccessException | InvocationTargetException e) {
			System.out.println(e.getMessage());
			}
		return "orderList.jsp";
	}
	
	
//	private String info(HttpServletRequest request, HttpServletResponse response) {
//		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
//
//        request.setAttribute("customer", customerservice.get(id));
//		return "Madang.jsp";
//	}
	
	private String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("orders", dao.getAll());
		return "orderList.jsp";
	}


}
