package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ong.dao.*;

@WebServlet("/ServletVerificarDonacion")
public class ServletVerificarDonacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ServletVerificarDonacion() {
        super();
            }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String dni=request.getParameter("dni");
		boolean respuesta=new MySqlDonanteDAO().verificarDonacion(Integer.parseInt(dni));
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		if (respuesta) {
	        response.getWriter().write("true");
	    } else {
	        response.getWriter().write("false");
	    }
	}

}
