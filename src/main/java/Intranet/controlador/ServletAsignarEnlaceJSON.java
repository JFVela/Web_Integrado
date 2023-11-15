package Intranet.controlador;

import java.io.BufferedReader;
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

import Intranet.dao.MySQL_AsignarEnlace;
import Intranet.entidad.Asignar_Enlace;
import Intranet.entidad.Detalle_Rol_Enlace;

@WebServlet("/ServletAsignarEnlaceJSON")
public class ServletAsignarEnlaceJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletAsignarEnlaceJSON() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tipo = request.getParameter("accion");
		if (tipo.equals("ADICIONAR")) {
			adicionar(request, response);
		} else if (tipo.equals("LISTAR")) {
			listar(request, response);
		} else if (tipo.equals("GRABAR")) {
			grabar(request, response);
		} else if (tipo.equals("QUITAR")) {
			quitar(request, response);
		} else if (tipo.equals("TABLA")) {
			tabla(request, response);
		} else if (tipo.equals("ELIMINAR")) {
			eliminar(request, response);
		}
	}

	private void quitar(HttpServletRequest request, HttpServletResponse response) {
		String idRol = request.getParameter("ROL");
		String idEnlace = request.getParameter("ENLACE");		
	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String idRol = request.getParameter("ROL");
		String idEnlace = request.getParameter("ENLACE");

		// Lógica para eliminar la asignación por IDs de roles y enlaces
		MySQL_AsignarEnlace asignarEnlaceDAO = new MySQL_AsignarEnlace();
		asignarEnlaceDAO.deleteAsignacion(Integer.parseInt(idRol), Integer.parseInt(idEnlace));

		// Devolver la lista actualizada después de la eliminación
		listar(request, response);
		response.sendRedirect("DesignarEnlace.jsp");
	}

	private void adicionar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String IdRol = request.getParameter("ROL");
		String IdEnlace = request.getParameter("ENLACE");
		List<Asignar_Enlace> lista = null;
		if (request.getSession().getAttribute("carrito") == null) {
			lista = new ArrayList<Asignar_Enlace>();
		} else {
			lista = (List<Asignar_Enlace>) request.getSession().getAttribute("carrito");
		}
		Asignar_Enlace asignacion = new Asignar_Enlace();
		asignacion.setRoles_id_rol(Integer.parseInt(IdRol));
		asignacion.setEnlace_id_enlace(Integer.parseInt(IdEnlace));
		lista.add(asignacion);
		request.getSession().setAttribute("carrito", lista);
		Gson gson = new Gson();
		String json = gson.toJson(asignacion);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(new Gson().toJson(asignacion));
	}

	private void grabar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Asignar_Enlace> datos = (List<Asignar_Enlace>) request.getSession().getAttribute("carrito");
		int resultado = new MySQL_AsignarEnlace().saveAsignaciones(datos);
		if (resultado >= 0) {
			datos.clear();
			request.getSession().setAttribute("MENSAJE", "Asignación guardada");
		} else {
			request.getSession().setAttribute("MENSAJE", "Error al guardar la asignación");
		}
		response.sendRedirect("DesignarEnlace.jsp"); // Redirige a la página deseada
	}

	private void tabla(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Asignar_Enlace> lista = new MySQL_AsignarEnlace().findAll();
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Asignar_Enlace> lista = (List<Asignar_Enlace>) request.getSession().getAttribute("carrito");
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

}