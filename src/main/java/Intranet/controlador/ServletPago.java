package Intranet.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	private void ListarSueldo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void GuardarSueldo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
