package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import Intranet.dao.MySQL_Roles;
import Intranet.entidad.Roles;

@WebServlet("/ServletFindRolJSON")
public class ServletFindRolJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletFindRolJSON() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cod = request.getParameter("codigo");
		Roles bean = new MySQL_Roles().finById(Integer.parseInt(cod)); 
		Gson gson = new Gson();
		String json = gson.toJson(bean);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

}
