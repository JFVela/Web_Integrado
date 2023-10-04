package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CerrarSesionServlet
 */
@WebServlet("/CerrarSesionServlet")
public class CerrarSesionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CerrarSesionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Obtener la sesión actual o crear una nueva si no existe
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Invalidar la sesión (cerrarla)
            session.invalidate();
        }

        // Redirigir a una página de inicio de sesión
	}

}
