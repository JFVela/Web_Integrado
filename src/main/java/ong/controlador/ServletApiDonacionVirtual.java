package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletApiDonacionVirtual")
public class ServletApiDonacionVirtual extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletApiDonacionVirtual() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//se agrega la codificacion para caracteres especiales
		request.setCharacterEncoding("UTF-8");
		String accion=request.getParameter("tipo");
		if(accion.equals("listaDonantesVirtuales"))
			listaDonantesVirtuales(request,response);
	}

	private void listaDonantesVirtuales(HttpServletRequest request, HttpServletResponse response) {
		try {
			//Crear objeto de la clase HttpClient
			HttpClient http = HttpClient.newHttpClient();
			//Crear objeto de la clase HttpRequest ===========>Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/donacionvirtual/lista"))
					.GET().build();
			//Crear objeto de la clase HttpResponse ========> respuesta
			HttpResponse<String> response_lista = http.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");
			//
			PrintWriter pw=response.getWriter();
			pw.print(response_lista.body());
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	}

}
