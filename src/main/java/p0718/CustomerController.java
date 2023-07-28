package p0718;

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
import org.apache.commons.lang3.StringUtils;

@WebServlet("/cccontrol")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustomerService customerservice;
	BookService bookservice;
	OrderService orderservice;

	public CustomerController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		customerservice = new CustomerService();
		bookservice = new BookService();
		orderservice = new OrderService();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String view = "";

		if (action == null) {
			getServletContext().getRequestDispatcher("/ccontrol?action=customers").forward(request, response);
		} else {
			switch (action) {
			case "list":
				view = list(request, response);
				break;
			case "customer":
				view = customer(request, response);
				break;

//			case "addOrdering":
//				addOrdering(request, response);
//				view = list(request, response);
//				break;

			case "customerList":
				view = customers(request, response);
				break;

			case "setCustomer":

				setCustomer(request, response);
				view = customers(request, response);
				break;

			}
			getServletContext().getRequestDispatcher("/p0718/" + view).forward(request, response);
		}
	}

	private String addOrdering(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			Order order = new Order();
			BeanUtils.populate(order, request.getParameterMap());
			orderservice.add(order);
			// response.sendRedirect("madang?action=orderings");

		} catch (IllegalAccessException | InvocationTargetException e) {
			System.out.println(e.getMessage());
		}
		return "orderList.jsp";
	}

	private String setCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			Customer customer = new Customer();
			BeanUtils.populate(customer, request.getParameterMap());
			if (customer.getId() == -1) {
				customerservice.add(customer);
			} else {
				customerservice.set(customer);
			}
			// response.sendRedirect("madang?action=customers");

		} catch (IllegalAccessException | InvocationTargetException e) {
			System.out.println(e.getMessage());
		}
		return "customers.jsp";
	}

	private String customer(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("c", customerservice.find(Integer.parseInt(request.getParameter("id"))));

		return "customer.jsp";
	}

	private String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("customers", customerservice.findAll());
		request.setAttribute("books", bookservice.findAll());
		request.setAttribute("orders", orderservice.findAll());
		return "customerList.jsp";
	}

	
	  private String customers(HttpServletRequest request, HttpServletResponse response) {
	  request.setAttribute("customers", customerservice.findAll());
	  request.setAttribute("books", bookservice.findAll());
	  request.setAttribute("orders", orderservice.findAll());
	  return "customerList.jsp";
	  }
	 

	/*
	 * private String customer(HttpServletRequest request, HttpServletResponse
	 * response) { int id =
	 * Integer.parseInt(StringUtils.defaultIfEmpty(request.getParameter("id"),
	 * "-1"));
	 * 
	 * request.setAttribute("customer", customerservice.get(id));
	 * 
	 * return "/customer.jsp"; }
	 */
}
