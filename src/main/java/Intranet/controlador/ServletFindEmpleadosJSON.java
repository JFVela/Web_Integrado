package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Intranet.dao.MySQL_Empleados;
import Intranet.entidad.Empleados;

@WebServlet("/ServletFindEmpleadosJSON")
public class ServletFindEmpleadosJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletFindEmpleadosJSON() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dni = request.getParameter("dni");
		Empleados empleado = new MySQL_Empleados().findByDNI(Integer.parseInt(dni));
		Gson gson = new Gson();
		String json = gson.toJson(empleado);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}
}
