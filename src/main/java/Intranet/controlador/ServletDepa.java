package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse.BodyHandlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Intranet.dao.MySQL_Departamento;
import Intranet.entidad.Departamento;

@WebServlet("/ServletDepa")
public class ServletDepa extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletDepa() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("accion");
		if (tipo.equals("grabar"))
			GuardarDepa(request, response);
		else if (tipo.equals("listado"))
			ListarDepa(request, response);
		else if (tipo.equals("eliminar"))
			EliminarDepa(request, response);
		else if (tipo.equals("buscar"))
			Buscar(request, response);
	}

	private void Buscar(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod = request.getParameter("id_depa"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/Depa/buscar/" + cod)).GET().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void EliminarDepa(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String tipoMensaje = "";

			String cod = request.getParameter("id"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/Depa/eliminar/" + cod)).DELETE().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			if (response_lista.statusCode() == 200) {
				tipoMensaje = "success";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Departamento eliminado con éxito");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "No se puede eliminar el Departamento");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Depa.jsp");
		/*
		 * String id = request.getParameter("codigo"); int estado = new
		 * MySQL_Departamento().deleteID(Integer.parseInt(id)); String tipoMensaje = "";
		 * 
		 * if (estado == 1) { tipoMensaje = "error";
		 * request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
		 * request.getSession().setAttribute("MENSAJE",
		 * "Departamento eliminado con éxito"); response.sendRedirect("Depa.jsp"); }
		 * else { // Mostrar mensaje de error utilizando Toastr tipoMensaje = "error";
		 * request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
		 * request.getSession().setAttribute("MENSAJE",
		 * "No se puede eliminar el Departamento"); response.sendRedirect("Depa.jsp"); }
		 */
	}

	/*
	 * private void ListarDepa(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { request.setAttribute("depa",
	 * new MySQL_Departamento().FindAll());
	 * request.getRequestDispatcher("/Depa.jsp").forward(request, response);
	 * 
	 * }
	 */

	private void ListarDepa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/Depa/lista"))
					.GET().build();
			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void GuardarDepa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cod, nom, des;
		cod = request.getParameter("codigo");
		nom = request.getParameter("nombre");
		des = request.getParameter("descripcion");
		String tipoMensaje = "";

		Departamento bean = new Departamento();
		bean.setId_depa(Integer.parseInt(cod));
		bean.setNombre(nom);
		bean.setDescripcion(des);

		Gson g = new Gson();
		String json = g.toJson(bean);

		if (Integer.parseInt(cod) == 0) {
			try {
				HttpClient client = HttpClient.newHttpClient();
				HttpRequest request_crear = HttpRequest.newBuilder()
						.uri(URI.create("http://localhost:8091/Depa/registrar"))
						.header("Content-type", "application/json").POST(BodyPublishers.ofString(json)).build();

				HttpResponse<String> response_lista = client.send(request_crear, BodyHandlers.ofString());

				if (response_lista.statusCode() == 200) {
					tipoMensaje = "success";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Departamento registrado");
				} else {
					tipoMensaje = "error";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Error en el registro");
				}

			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException("Error al procesar la solicitud", e);
			}
		} else {
			try {
				HttpClient client = HttpClient.newHttpClient();
				HttpRequest request_crear = HttpRequest.newBuilder()
						.uri(URI.create("http://localhost:8091/Depa/actualizar"))
						.header("Content-type", "application/json").PUT(BodyPublishers.ofString(json)).build();

				HttpResponse<String> response_lista = client.send(request_crear, BodyHandlers.ofString());
				if (response_lista.statusCode() == 200) {
					tipoMensaje = "success";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Departamento actualizado");
				} else {
					tipoMensaje = "error";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Error en la actualización");
				}

			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException("Error al procesar la solicitud", e);
			}
		}
		response.sendRedirect("Depa.jsp");
	}

}
