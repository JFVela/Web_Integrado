package Intranet.controlador;

import java.io.IOException;
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

	private void ListarDepa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("depa", new MySQL_Departamento().FindAll());
		request.getRequestDispatcher("/Depa.jsp").forward(request, response);

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
