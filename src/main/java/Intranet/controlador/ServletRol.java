package Intranet.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String tipo = request.getParameter("accion");
		if (tipo.equals("grabar"))
			GuardarRol(request, response);
		else if (tipo.equals("listado"))
			ListarRol(request, response);
		else if (tipo.equals("eliminar"))
			EliminarRol(request, response);
	}

	private void ListarRol(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("rol", new MySQL_Roles().findAll());
		request.getRequestDispatcher("/Roles.jsp").forward(request, response);
	}

	private void GuardarRol(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nom, des;
		nom = request.getParameter("nombre");
		des = request.getParameter("descripcion");

		Roles bean = new Roles();
		bean.setNombre(nom);
		bean.setDescripcion(des);

		int estado = new MySQL_Roles().save(bean);
		String tipoMensaje = "error";

		if (estado == 1) {
			tipoMensaje = "success";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Rol registrado con éxito");
		} else {
			tipoMensaje = "error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Error en el registro del rol");
		}
		response.sendRedirect("Roles.jsp");
	}

	private void EliminarRol(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("codigo");
		int estado = new MySQL_Roles().deleteID(Integer.parseInt(id));
		String tipoMensaje = "";

		if (estado == 1) {
			tipoMensaje = "error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Rol eliminado con éxito");
			response.sendRedirect("Roles.jsp");
		} else {
			tipoMensaje = "error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "No se puede eliminar el Rol");
			response.sendRedirect("Roles.jsp");
		}
	}
}
