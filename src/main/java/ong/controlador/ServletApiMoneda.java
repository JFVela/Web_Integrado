package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse.BodyHandlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.entity.MonedaAp;



@WebServlet("/ServletApiMoneda")
public class ServletApiMoneda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletApiMoneda() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String accion = request.getParameter("tipo");
		if(accion.equals("listaMoneda"))
			listaMoneda(request,response);
		else if(accion.equals("grabar"))
			grabarMoneda(request,response);
		else if(accion.equals("buscar"))
			buscarMoneda(request,response);
		else if(accion.equals("eliminar"))
			eliminarMoneda(request,response);
	}


	private void eliminarMoneda(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String cod;
			cod=request.getParameter("codigo");
			
			//Crear objeto de la clase HttpClient
			HttpClient http = HttpClient.newHttpClient();
			//Crear objeto de la clase HttpRequest ===========>Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/moneda/eliminar/"+cod))
					.DELETE().build();
			//Crear objeto de la clase HttpResponse ========> respuesta
			HttpResponse<String> response_lista = http.send(request_lista, BodyHandlers.ofString());
			
			request.getSession().setAttribute("ERROR","Moneda Borrada");
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Moneda.jsp");
		
	}


	private void buscarMoneda(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod;
			cod=request.getParameter("codigo");
			//Crear objeto de la clase HttpClient
			HttpClient http = HttpClient.newHttpClient();
			//Crear objeto de la clase HttpRequest ===========>Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/moneda/buscar/"+cod))
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


	private void grabarMoneda(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String cod,nom,val;
			cod=request.getParameter("codigo");
			nom=request.getParameter("nombre");
			val=request.getParameter("valor");
			//Crear objeto de la clase alumno
			//Alumno a = new Alumno();
			MonedaAp mon = new MonedaAp();
			//settear
			mon.setCodigo(Integer.parseInt(cod));
			mon.setNombre(nom);
			mon.setValor(Double.parseDouble(val));
			//Crear objeto de la clase carrera
			//enviar "c" al objeto "a#
			//CONVERTIR A JSON
			Gson gson = new Gson();
			String json = gson.toJson(mon);
			//validar
			if(Integer.parseInt(cod)==0) {
				//Crear objeto de la clase HttpClient
				HttpClient http = HttpClient.newHttpClient();
				//Crear objeto de la clase HttpRequest ===========>Solicitud
				HttpRequest request_crear = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/moneda/registrar"))
						.header("Content-Type", "application/json")
						.POST(BodyPublishers.ofString(json)).build();
				//Crear objeto de la clase HttpResponse ========> respuesta
				HttpResponse<String> response_lista = http.send(request_crear, BodyHandlers.ofString());
				request.getSession().setAttribute("MENSAJE","Nueva Moneda Agregada");	
			}else {
				//Crear objeto de la clase HttpClient
				HttpClient http = HttpClient.newHttpClient();
				//Crear objeto de la clase HttpRequest ===========>Solicitud
				HttpRequest request_crear = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/moneda/actualizar"))
						.header("Content-Type", "application/json")
						.PUT(BodyPublishers.ofString(json)).build();
				//Crear objeto de la clase HttpResponse ========> respuesta
				HttpResponse<String> response_lista = http.send(request_crear, BodyHandlers.ofString());
				request.getSession().setAttribute("MODIFICADO","MONEDA Actualizada");
			}
			
			//request.getSession().setAttribute("MENSAJE","Alumno actualizado");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Moneda.jsp");
		
	}


	private void listaMoneda(HttpServletRequest request, HttpServletResponse response) {
		try {
			//Crear objeto de la clase HttpClient
			HttpClient http = HttpClient.newHttpClient();
			//Crear objeto de la clase HttpRequest ===========>Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/moneda/lista"))
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
