package mandarat;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;


@WebServlet("/mandara")
public class MandaratController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	MandaratDAO dao;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new MandaratDAO();
	}
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String view = "";

		if (action == null) {
			getServletContext().getRequestDispatcher("/mandara?action=list").forward(request, response);
		} else {
			switch (action) {
			case "list":
				view = list(request, response);
				break;
//			case "info":
//				view = info(request, response);
//				break;
			}

//			if (StringUtils.isNotEmpty(view)) {
//				getServletContext().getRequestDispatcher("/mandarat/" + view).forward(request, response);
//			}
			
			  getServletContext().getRequestDispatcher("/mandarat/"+view).forward(request,
			  response);
			 
		}
	}

	
	  public String list(HttpServletRequest request, HttpServletResponse response) {
		  request.setAttribute("mandaratm", dao.getmainList());
		  return "mandarat.jsp";
		  }
	  
//	  public String info(HttpServletRequest request, HttpServletResponse response) {
//		  Student s = new Student();
//		  try { BeanUtils.populate(s, request.getParameterMap());
//		  } catch (Exception e) {
//			  e.printStackTrace();
//			  }
//	  dao.insert(s);
//	  return list(request, response);
//	  }
}
