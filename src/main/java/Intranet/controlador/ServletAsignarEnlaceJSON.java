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
		} else if (tipo.equals("LISTAR")) {
			listar(request, response);
		} else if (tipo.equals("GRABAR")) {

		} else if (tipo.equals("TABLA")) {
			tabla(request, response);
		}
	}

	private void tabla(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Asignar_Enlace> lista = new MySQL_AsignarEnlace().findAll();
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

	private void grabar(HttpServletRequest request, HttpServletResponse response) throws Exception {
	}

	private void listar(HttpServletRequest request, HttpServletResponse response) throws IOException {
	}

	private void adicionar(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String IdRol = request.getParameter("IdRol");
		String IdEnlace = request.getParameter("IdEnlace");

		Asignar_Enlace asignacion = new Asignar_Enlace();
		asignacion.setRoles_id_rol(Integer.parseInt(IdRol));
		asignacion.setEnlace_id_enlace(Integer.parseInt(IdEnlace));

		int filasAfectadas = new MySQL_AsignarEnlace().saveAsignaciones(null);

		Gson gson = new Gson();
		String json = gson.toJson(asignacion);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(json);
	}

}