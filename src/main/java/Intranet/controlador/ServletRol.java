package Intranet.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Intranet.dao.MySQL_Departamento;
import Intranet.dao.MySQL_Roles;
import Intranet.entidad.Departamento;
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
	}

	private void ListarRol(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("rol", new MySQL_Roles().findAll());
		request.getRequestDispatcher("/Roles.jsp").forward(request, response);

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

		if (bean.getId() == 0) {
			int estado = new MySQL_Roles().save(bean);
			if (estado == 1) {
				tipoMensaje = "success";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Rol registrado con éxito");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Error en el registro del rol");
			}
		} else {
			int estado = new MySQL_Roles().update(bean);

			if (estado == 1) {
				tipoMensaje = "warning";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Rol actualizado con éxito");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Error en la actualización del rol");
			}
		}

		response.sendRedirect("Roles.jsp");
		int estado = new MySQL_Roles().save(bean);
		if (estado == 1) {
			System.out.println("Se guardo con Exito");
		} else {
			System.out.println("No se guardo con Éxito");
		}
		ListarRol(request, response);

	}

}
