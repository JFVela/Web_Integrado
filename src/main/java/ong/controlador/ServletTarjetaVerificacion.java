package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.dao.MySqlTarjetaDAO;
import ong.entity.Tarjeta;

@WebServlet("/ServletTarjetaVerificacion")

public class ServletTarjetaVerificacion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletTarjetaVerificacion() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Obtén los parámetros enviados desde la solicitud AJAX
		int numeroTarjeta = Integer.parseInt(request.getParameter("numcuen"));
		int mes = Integer.parseInt(request.getParameter("expirationMonth"));
		int ano = Integer.parseInt(request.getParameter("expirationYear"));
		int cvc = Integer.parseInt(request.getParameter("cvv"));
		
		// Crea un objeto Tarjeta con los datos recibidos
		Tarjeta tarjeta = new Tarjeta();
		tarjeta.setNumCuenta(numeroTarjeta);
		tarjeta.setMes(mes);
		tarjeta.setAño(ano);
		tarjeta.setCvc(cvc);

		// Realiza la verificación utilizando la clase MySqlTarjetaDAO
		boolean esValida = new MySqlTarjetaDAO().verificacionTarjeta(tarjeta);
		
		// Envía una respuesta al cliente
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		if (esValida) {
	            out.print("valido");
	        
	    } else {
	        out.print("invalido");
	    }
		

		

	
	}

}
