package Intranet.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Intranet.dao.MySQL_Pago;
import Intranet.entidad.Pago;

@WebServlet("/ServletPago")
public class ServletPago extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletPago() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tipo = request.getParameter("accion");
		if (tipo.equals("grabar"))
			GuardarSueldo(request, response);
		else if (tipo.equals("listado"))
			ListarSueldo(request, response);
	}

	private void ListarSueldo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("pago", new MySQL_Pago().findAll());
		request.getRequestDispatcher("/Empleado.jsp").forward(request, response);
	}

	private void GuardarSueldo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sue, det;
		sue = request.getParameter("sueldo");
		det = request.getParameter("detalle");

		Pago bean = new Pago();
		bean.setSueldo(Double.valueOf(sue));
		bean.setDetalle(det);

		int estado = new MySQL_Pago().save(bean);
		if (estado == 1) {
			System.out.println("Se guardo con Exito");
		} else {
			System.out.println("No se guardo con Éxito");
		}
		ListarSueldo(request, response);

	}

}
