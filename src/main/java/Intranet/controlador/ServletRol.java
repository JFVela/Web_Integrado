package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Intranet.dao.MySQL_Roles;
import Intranet.entidad.Roles;

@WebServlet("/ServletRol")
public class ServletRol extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletRol() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("accion");
		if (tipo.equals("grabar"))
			GuardarRol(request, response);
		else if (tipo.equals("listado"))
			ListarRol(request, response);
		else if (tipo.equals("eliminar"))
			EliminarRol(request, response);
		else if (tipo.equals("buscarRol"))
			buscar(request, response);

	}

	/*
	 * private void ListarRol(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { request.setAttribute("rol",
	 * new MySQL_Roles().findAll());
	 * request.getRequestDispatcher("/Roles.jsp").forward(request, response); }
	 */

	private void buscar(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod = request.getParameter("id"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/Roles/buscar/" + cod)).GET().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void ListarRol(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Crear un cliente HTTP
			HttpClient client = HttpClient.newHttpClient();

			// Crear una solicitud HTTP GET con la URI especificada
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/Roles/lista"))
					.GET().build();

			// Enviar la solicitud y obtener la respuesta
			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			// Obtener la respuesta del servidor y enviarla al cliente
			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void GuardarRol(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cod, nom, des;
		cod = request.getParameter("codigo");
		nom = request.getParameter("nombre");
		des = request.getParameter("descripcion");
		String tipoMensaje = "error";

		Roles bean = new Roles();
		bean.setId(Integer.parseInt(cod));
		bean.setNombre(nom);
		bean.setDescripcion(des);

		Gson g = new Gson();
		String json = g.toJson(bean);

		if (bean.getId() == 0) {
			try {
				HttpClient client = HttpClient.newHttpClient();
				HttpRequest request_crear = HttpRequest.newBuilder()
						.uri(URI.create("http://localhost:8091/Roles/registrar"))
						.header("Content-type", "application/json").POST(BodyPublishers.ofString(json)).build();

				HttpResponse<String> response_lista = client.send(request_crear, BodyHandlers.ofString());

				if (response_lista.statusCode() == 200) {
					tipoMensaje = "success";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Rol registrado con éxito");
				} else {
					tipoMensaje = "error";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Error en el registro del rol");
				}

			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException("Error al procesar la solicitud", e);
			}

			/*
			 * int estado = new MySQL_Roles().save(bean); if (estado == 1) { tipoMensaje =
			 * "success"; request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			 * request.getSession().setAttribute("MENSAJE", "Rol registrado con éxito"); }
			 * else { tipoMensaje = "error";
			 * request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			 * request.getSession().setAttribute("MENSAJE", "Error en el registro del rol");
			 * }
			 */
		} else {
			try {
				HttpClient client = HttpClient.newHttpClient();
				HttpRequest request_crear = HttpRequest.newBuilder()
						.uri(URI.create("http://localhost:8091/Roles/actualizar"))
						.header("Content-type", "application/json").PUT(BodyPublishers.ofString(json)).build();

				HttpResponse<String> response_lista = client.send(request_crear, BodyHandlers.ofString());

				if (response_lista.statusCode() == 200) {
					tipoMensaje = "success";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Rol actualizado con éxito");
				} else {
					tipoMensaje = "error";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Error en la actualización del rol");
				}

			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException("Error al procesar la solicitud", e);
			}

			// int estado = new MySQL_Roles().update(bean);
			//
			// if (estado == 1) {
//			     tipoMensaje = "warning";
//			     request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
//			     request.getSession().setAttribute("MENSAJE", "Rol actualizado con éxito");
			// } else {
//			     tipoMensaje = "error";
//			     request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
//			     request.getSession().setAttribute("MENSAJE", "Error en la actualización del rol");
			// }

		}
		response.sendRedirect("Roles.jsp");
	}

	private void EliminarRol(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String tipoMensaje = "";

			String cod = request.getParameter("id"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/Roles/eliminar/" + cod)).DELETE().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			if (response_lista.statusCode() == 200) {
				tipoMensaje = "success";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Rol eliminado con éxito");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "No se puede eliminar el Rol");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Roles.jsp");

		/*
		 * CODIGO ANTES USADO String id = request.getParameter("codigo"); int estado =
		 * new MySQL_Roles().deleteID(Integer.parseInt(id)); String tipoMensaje = "";
		 * 
		 * if (estado == 1) { tipoMensaje = "error";
		 * request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
		 * request.getSession().setAttribute("MENSAJE", "Rol eliminado con éxito");
		 * response.sendRedirect("Roles.jsp"); } else { tipoMensaje = "error";
		 * request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
		 * request.getSession().setAttribute("MENSAJE", "No se puede eliminar el Rol");
		 * response.sendRedirect("Roles.jsp"); }
		 */
	}
}
