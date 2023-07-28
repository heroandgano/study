package customer;
import org.apache.commons.lang3.StringUtils;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;


@WebServlet("/bcontrol")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       BookService service;
       OrderingService orderingService;
    public BookController() {
    	service = new BookService();
    	orderingService = new OrderingService();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		String view ="";
		
		if(request.getParameter("action") == null) {
			getServletContext().getRequestDispatcher("/bcontrol?action=list").forward(request, response);
		}else {
			switch(action) {
			case "setBook" :
				setBook(request,response);
				view = list(request,response);break;
			case "list": view = list(request,response);break;
			case "info": view = info(request,response);break;
			case "removeBook":
                
                removeBook(request, response);
                //view = list(request, response);
                break;
			
			}
			if(StringUtils.isNoneBlank(view)) {
			getServletContext().getRequestDispatcher("/customer/"+view).forward(request,response);
		    }
		}
	}
	private String setBook(HttpServletRequest request, HttpServletResponse response)throws IOException {
		try {
			 Book book = new Book();
	            BeanUtils.populate(book, request.getParameterMap());
	            if (book.getId() == -1) {
	                service.add(book);
	            } else {
	                service.set(book);
	            }
	            //response.sendRedirect("ccontrol?action=list");
		}catch(IllegalAccessException | InvocationTargetException e) {
			System.out.println(e.getMessage());
			}
		return "bookList.jsp";
	}
	
	private String info(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
		 List<Book> books = service.findAll();
        request.setAttribute("book", service.get(id));

		return "bookInfo.jsp";
	}
	private String list(HttpServletRequest request, HttpServletResponse response) {
		//boolean hasOrdering = Boolean.parseBoolean(StringUtils.defaultIfEmpty(request.getParameter("hasOrdering"),"false"));
		
		
		//request.setAttribute("hasOrdering", hasOrdering);
		
		if(Boolean.TRUE.equals(request.getSession().getAttribute("hasOrdering"))) {
			
		}else {
			request.getSession().setAttribute("hasOrdering", false);
		}
		
		request.setAttribute("book", service.findAll());
		return "bookList.jsp";
	}
	private void removeBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"), "-1"));
       boolean hasOrdering = false;
       for(Ordering ordering : orderingService.findAll()) {
    	   if(ordering.getBookId() == id) {
    		   hasOrdering = true;
    		   break;
    	   }
       }
       if(hasOrdering) {
    	   //response.sendRedirect("ccontrol?action=list&hasOrdering=true");
    	   request.getSession().setAttribute("hasOrdering", true);
    	   response.sendRedirect("bcontrol?action=list");
       }else {
    	   service.remove(id);
    	   //response.sendRedirect("ccontrol?action=list&hasOrdering=false");
    	   request.getSession().setAttribute("hasOrdering",false);
    	   response.sendRedirect("bcontrol?action=list");
       }
    		 
        
	}
	
}
