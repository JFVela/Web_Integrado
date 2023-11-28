package Intranet.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	}

	private void EliminarDepa(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("codigo");
		int estado = new MySQL_Departamento().deleteID(Integer.parseInt(id));
		String tipoMensaje = "";

		if (estado == 1) {
			tipoMensaje = "error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Departamento eliminado con éxito");
			response.sendRedirect("Depa.jsp");
		} else {
			// Mostrar mensaje de error utilizando Toastr
			tipoMensaje = "error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "No se puede eliminar el Departamento");
			response.sendRedirect("Depa.jsp");
		}
	}

	/*private void ListarDepa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("depa", new MySQL_Departamento().FindAll());
		request.getRequestDispatcher("/Depa.jsp").forward(request, response);

	}*/
	
	private void ListarDepa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Crear un cliente HTTP
			HttpClient client = HttpClient.newHttpClient();

			// Crear una solicitud HTTP GET con la URI especificada
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/Depa/lista"))
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

	private void GuardarDepa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cod, nom, des;
		cod = request.getParameter("codigo");
		nom = request.getParameter("nombre");
		des = request.getParameter("descripcion");
		String tipoMensaje = "error";

		Departamento bean = new Departamento();
		bean.setId(Integer.parseInt(cod));
		bean.setNombre(nom);
		bean.setDescripcion(des);

		if (Integer.parseInt(cod) == 0) {
			int estado = new MySQL_Departamento().save(bean);
			if (estado == 1) {
				tipoMensaje = "success";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Departamento registrado");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Error en el registro");
			}
		} else {
			int estado = new MySQL_Departamento().update(bean);
			if (estado == 1) {
				tipoMensaje = "warning";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Departamento actualizado");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Error en la actualización");
			}
		}
		response.sendRedirect("Depa.jsp");
	}

}
