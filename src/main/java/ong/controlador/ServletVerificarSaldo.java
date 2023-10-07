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

@WebServlet("/ServletVerificarSaldo")
public class ServletVerificarSaldo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletVerificarSaldo() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saldo=request.getParameter("monto");
		int tipomon=Integer.parseInt(request.getParameter("tmone"));
		int numeroTarjeta = Integer.parseInt(request.getParameter("numcuen"));
		int mes = Integer.parseInt(request.getParameter("expirationMonth"));
		int ano = Integer.parseInt(request.getParameter("expirationYear"));
		int cvc = Integer.parseInt(request.getParameter("cvv"));
		Tarjeta tarjeta = new Tarjeta();
		tarjeta.setNumCuenta(numeroTarjeta);
		tarjeta.setMes(mes);
		tarjeta.setAño(ano);
		tarjeta.setCvc(cvc);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		if (saldo != null && !saldo.isEmpty()) {
	        try {
	            double saldoActual = new MySqlTarjetaDAO().saldoTarjeta(tarjeta);
	    		if(tipomon==1) {
	    			if (saldoActual < Double.parseDouble(saldo)) {
		    	        out.print("Agotado");
		    	    }
	    		}else {
	    			if (saldoActual < Double.parseDouble(saldo)*3.81) {
		    	        out.print("Agotado");
		    	    }
	    		}
	        }catch (NumberFormatException e) {
	            // La cadena no es un número válido, manejar el error aquí
	            out.print("Error: El monto no es un número válido");
	        }
	    } else {
	        out.print("Error: El monto está vacío");
	    }
	}

}
