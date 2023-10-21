package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.dao.MySqlDonanteDAO;
import ong.dao.MySqlLocacionDAO;

@WebServlet("/ServletVerificarLocacionEntrega")
public class ServletVerificarLocacionEntrega extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletVerificarLocacionEntrega() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		boolean respuesta=new MySqlLocacionDAO().verificarLocacion(Integer.parseInt(id));
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		if (respuesta) {
	        response.getWriter().write("true");
	    } else {
	        response.getWriter().write("false");
	    }
	}

}
