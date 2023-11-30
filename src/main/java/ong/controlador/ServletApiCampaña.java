package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandler;
import java.net.http.HttpResponse.BodyHandlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.entity.CampañaAp;



@WebServlet("/ServletApiCampaña")
public class ServletApiCampaña extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletApiCampaña() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//se agrega la codificacion para caracteres especiales
		request.setCharacterEncoding("UTF-8");
		String acccion=request.getParameter("tipo");
		if(acccion.equals("listaCampana"))
			listaCampaña(request,response);
		/*else if(acccion.equals("listaCarreras"))
			listaCarreras(request,response);*/
		else if(acccion.equals("grabar"))
			grabarCampaña(request,response);
		else if(acccion.equals("buscar"))
			buscarCampaña(request,response);
		else if(acccion.equals("eliminar"))
			eliminarCampaña(request,response);
	}
	private void eliminarCampaña(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String cod;
			cod=request.getParameter("codigo");
			
			//Crear objeto de la clase HttpClient
			HttpClient http = HttpClient.newHttpClient();
			//Crear objeto de la clase HttpRequest ===========>Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/campana/eliminar/"+cod))
					.DELETE().build();
			//Crear objeto de la clase HttpResponse ========> respuesta
			HttpResponse<String> response_lista = http.send(request_lista, BodyHandlers.ofString());
			
			request.getSession().setAttribute("ERROR","Campaña eliminado");
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Campania.jsp");
	}
	private void buscarCampaña(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod;
			cod=request.getParameter("codigo");
			//Crear objeto de la clase HttpClient
			HttpClient http = HttpClient.newHttpClient();
			//Crear objeto de la clase HttpRequest ===========>Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/campana/buscar/"+cod))
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

	private void listaCampaña(HttpServletRequest request, HttpServletResponse response) {
		try {
			//Crear objeto de la clase HttpClient
			HttpClient http = HttpClient.newHttpClient();
			//Crear objeto de la clase HttpRequest ===========>Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/campana/lista"))
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
	private void grabarCampaña(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String cod,nom,des;
			cod=request.getParameter("codigo");
			nom=request.getParameter("nombre");
			des=request.getParameter("descripcion");
			//Crear objeto de la clase alumno
			//Alumno a = new Alumno();
			CampañaAp cam = new CampañaAp();
			//settear
			cam.setCodigo(Integer.parseInt(cod));
			cam.setNombre(nom);
			cam.setDescripcion(des);
			//Crear objeto de la clase carrera
			//enviar "c" al objeto "a#
			//CONVERTIR A JSON
			Gson gson = new Gson();
			String json = gson.toJson(cam);
			//validar
			if(Integer.parseInt(cod)==0) {
				//Crear objeto de la clase HttpClient
				HttpClient http = HttpClient.newHttpClient();
				//Crear objeto de la clase HttpRequest ===========>Solicitud
				HttpRequest request_crear = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/campana/registrar"))
						.header("Content-Type", "application/json")
						.POST(BodyPublishers.ofString(json)).build();
				//Crear objeto de la clase HttpResponse ========> respuesta
				HttpResponse<String> response_lista = http.send(request_crear, BodyHandlers.ofString());
				request.getSession().setAttribute("MENSAJE","Campaña Registrado");	
			}else {
				//Crear objeto de la clase HttpClient
				HttpClient http = HttpClient.newHttpClient();
				//Crear objeto de la clase HttpRequest ===========>Solicitud
				HttpRequest request_crear = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/campana/actualizar"))
						.header("Content-Type", "application/json")
						.PUT(BodyPublishers.ofString(json)).build();
				//Crear objeto de la clase HttpResponse ========> respuesta
				HttpResponse<String> response_lista = http.send(request_crear, BodyHandlers.ofString());
				request.getSession().setAttribute("MODIFICADO","Campaña Actualizado");
			}
			
			//request.getSession().setAttribute("MENSAJE","Alumno actualizado");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("Campania.jsp");
	}

	/*private void listaCarreras(HttpServletRequest request, HttpServletResponse response) {
		try {
			//Crear objeto de la clase HttpClient
			HttpClient http = HttpClient.newHttpClient();
			//Crear objeto de la clase HttpRequest ===========>Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/carrera/lista"))
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
	}*/

}



