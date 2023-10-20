package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Intranet.dao.MySQL_Roles;
import Intranet.entidad.Roles;

@WebServlet("/ServletRolJSON")
public class ServletRolJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletRolJSON() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Roles> lista = new MySQL_Roles().findAll(); // Cambiado a MySQL_Roles para Roles
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

}
