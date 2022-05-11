package API;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Employee;

@WebServlet("/EmployeeAPI")
public class EmployeeAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Employee emp= new Employee();
    
    public EmployeeAPI() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("dob")+"NIC Value API");

		String output = emp.insert(request.getParameter("nic"),
				 request.getParameter("name"),
				 request.getParameter("dob"),
				request.getParameter("address"),
				Integer.parseInt(request.getParameter("phone")),
				Float.parseFloat(request.getParameter("salary")),
				request.getParameter("position"),
				request.getParameter("branch"));
		
				response.getWriter().write(output);
	}
	
	private static Map getParasMap(HttpServletRequest request)
	{
	 Map<String, String> map = new HashMap<String, String>();
	try
	 {
		 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
		 String queryString = scanner.hasNext() ?
		 scanner.useDelimiter("\\A").next() : "";
		 scanner.close();
		 String[] params = queryString.split("&");
			 for (String param : params)
			 {
				 String[] p = param.split("=");
				 map.put(p[0], p[1]);
				 
			 }
		}
		catch (Exception e){}
		return map;
		}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		 
		 String output = emp.updateEmp(paras.get("hidempID").toString(),
				 paras.get("nic").toString(),
				paras.get("name").toString(),
				paras.get("dob").toString(),
				paras.get("address").toString(),
				Integer.parseInt(paras.get("phone").toString()),
				Float.parseFloat(paras.get("salary").toString()),
				paras.get("position").toString(),
				paras.get("branch").toString());
		 
		response.getWriter().write(output);
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
			
		 String output = emp.deleteEmployee(paras.get("empID").toString());
		 
		response.getWriter().write(output);
	}

}
