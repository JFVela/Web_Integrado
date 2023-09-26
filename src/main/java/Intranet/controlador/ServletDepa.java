package Intranet.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Intranet.dao.MySQL_Departamento;
import Intranet.dao.MySQL_Pago;
import Intranet.entidad.Departamento;
import Intranet.entidad.Pago;

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
	}

	private void ListarDepa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("depa", new MySQL_Departamento().FindAll());
		request.getRequestDispatcher("/Depa.jsp").forward(request, response);

	}

	private void GuardarDepa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nom, des;
		nom = request.getParameter("nombre");
		des = request.getParameter("descripcion");

		Departamento bean = new Departamento();
		bean.setNombre(nom);
		bean.setDescripcion(des);

		int estado = new MySQL_Departamento().save(bean);
		if (estado == 1) {
			System.out.println("Se guardo con Exito");
		} else {
			System.out.println("No se guardo con Éxito");
		}
		ListarDepa(request, response);

	}

}
