package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.utils.JavaEmail;

@WebServlet("/ServletDonacionEmail")
public class ServletDonacionEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String codigo=JavaEmail.GenerarCodigo();
	
    public ServletDonacionEmail() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo=request.getParameter("tipo");
		if(tipo.equals("tipo1")){
			enviarEmail(request, response);
		}else if(tipo.equals("tipo2")) {
			confirmar(request,response);
		}
	}

	private void confirmar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String campoConfirmacion=request.getParameter("codigo");
		
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		if(campoConfirmacion.equals(codigo)) {
			out.print("valido");
		}else {
			out.print("invalido");
		}		
	}

	private void enviarEmail(HttpServletRequest request, HttpServletResponse response) {
		String receptor=request.getParameter("correo");
		try {
			
			JavaEmail.enviarMail(receptor,codigo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
