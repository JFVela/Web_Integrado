package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Intranet.entidad.Rol_Enlace;
import Intranet.entidad.Detalle_Rol_Enlace;

/**
 * Servlet implementation class ServletRol_Enlace
 */
@WebServlet("/ServletRol_Enlace")
public class ServletRol_Enlace extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletRol_Enlace() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tipo = request.getParameter("accion");
		if (tipo.equals("ADICIONAR"))
			adicionar(request, response);
		else if (tipo.equals("LISTAR")) {
			listar(request, response);
		} else if (tipo.equals("GRABAR")) {
			grabar(request, response);
		} else if (tipo.equals("TABLE")) {
			table(request, response);
		}
	}

	private void table(HttpServletRequest request, HttpServletResponse response) {
		Rol_Enlace asignar = new Rol_Enlace();
		List<Detalle_Rol_Enlace> datos = (List<Detalle_Rol_Enlace>) request.getSession().getAttribute("LISTAS");

	}

	private void grabar(HttpServletRequest request, HttpServletResponse response) {
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Detalle_Rol_Enlace> lista = (List<Detalle_Rol_Enlace>) request.getSession().getAttribute("LISTAS");
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

	private void adicionar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String IdR = request.getParameter("IdRol");
		String IdE = request.getParameter("IdEnlace");
		List<Detalle_Rol_Enlace> lista = null;
		if (request.getSession().getAttribute("LISTAS") == null) {
			lista = new ArrayList<Detalle_Rol_Enlace>();
		} else {
			lista = (List<Detalle_Rol_Enlace>) request.getSession().getAttribute("LISTAS");
			Detalle_Rol_Enlace det = new Detalle_Rol_Enlace();
			det.setIDrol(Integer.parseInt(IdR));
			det.setIDEnlace(Integer.parseInt(IdE));
			lista.add(det);
			request.getSession().setAttribute("LISTAS", lista);
			Gson gson = new Gson();
			String json = gson.toJson(lista);
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(json);

		}

	}

}
