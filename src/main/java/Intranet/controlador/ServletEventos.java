package Intranet.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Intranet.dao.MySQL_Eventos;
import Intranet.entidad.Eventos;

/**
 * Servlet implementation class ServletEventos
 */
@WebServlet("/ServletEventos")
public class ServletEventos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletEventos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tipo = request.getParameter("accion");
		if (tipo.equals("grabar"))
			grabarEventos(request, response);
		else if (tipo.equals("listado"))
			listarEventos(request, response);
		else if (tipo.equals("eliminar"))
			eliminarEventos(request, response);
	}

	private void eliminarEventos(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id_evento");
		int estado = new MySQL_Eventos().deleteById(Integer.parseInt(id));
		if (estado == 1)
			System.out.println("SI");
		else
			System.out.println("NO");
		request.getSession().setAttribute("MENSAJE", "Docente eliminado");

		response.sendRedirect("EventosAdmin.jsp");
	}

	private void listarEventos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("Eventos", new MySQL_Eventos().findAll());
		request.getRequestDispatcher("/EventosAdmin.jsp").forward(request, response);
	}

	private void grabarEventos(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id, nom, ubi, in_in, fi_in, in, fi, de, va;
		id = request.getParameter("id");
		nom = request.getParameter("nombre");
		ubi = request.getParameter("ubicacion");
		in_in = request.getParameter("inicio_inscripcion");
		fi_in = request.getParameter("final_inscripcion");
		in = request.getParameter("inicio");
		fi = request.getParameter("final");
		de = request.getParameter("detalle");
		va = request.getParameter("vacante");
		Eventos bean = new Eventos();
		bean.setId_evento(Integer.parseInt(id));
		bean.setNombre(nom);
		bean.setUbicacion(ubi);
		bean.setInicio_inscripcion(in_in);
		bean.setFinal_inscripcion(fi_in);
		bean.setInicio(in);
		bean.setFinaliza(fi);
		bean.setDetalle(de);
		bean.setVacantes(Integer.parseInt(va));

		if (Integer.parseInt(id) == 0) {
			int estado = new MySQL_Eventos().save(bean);
			if (estado == 1)
				request.getSession().setAttribute("MENSAJE", "Docente registrado");
			else
				request.getSession().setAttribute("MENSAJE", "Error en el registro");
		} else {
			int estado = new MySQL_Eventos().update(bean);
			if (estado == 1)
				request.getSession().setAttribute("MENSAJE", "Docente actualizado");
			else
				request.getSession().setAttribute("MENSAJE", "Error en la actualización");
		}
		response.sendRedirect("EventosAdmin.jsp");
	}

}
