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

import ong.dao.MySqlLocacionDAO;
import ong.entity.Locacion;

@WebServlet("/ServletLocacion")
public class ServletLocacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletLocacion() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("accion");
		
		if (tipo.equals("insertar"))
			insertarLocacion(request, response);
		 else if (tipo.equals("listado")) 
			listarLocacion(request, response);
		else if(tipo.equals("eliminar"))
			eliminar(request,response);
			else if(tipo.equals("eliminar"))
			eliminar(request,response);
			else if(tipo.equals("buscar"))
				buscar(request,response);
		}


	private void buscar(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod = request.getParameter("id"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/local/buscar/" + cod)).GET().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dato=request.getParameter("dato");
		String tipoMensaje;
		try {
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/local/eliminar/" + dato)).DELETE().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			tipoMensaje="error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Locacion Eliminado");
		}catch(Exception ex) {
			ex.printStackTrace();
			tipoMensaje="error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Error al eliminar");
		}
		
		//invocar método listarDocente
		//listarDocente(request,response);
		response.sendRedirect("Locacion.jsp");		
	}

	private void listarLocacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//request.setAttribute("locaciones", new MySqlDonanteDAO().findAll());
		request.getRequestDispatcher("/Locacion.jsp").forward(request, response);
		
	}


	private void insertarLocacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//1.recuperar los valores de los controles(cajas,select) del formulario 
				//usar atributo name.
				String id,nom,direc,tipoMensaje;
				id=request.getParameter("id");
				nom=request.getParameter("nombre");
				direc=request.getParameter("direccion");
				//2.crear objeto de la clase Docente
				Locacion bean=new Locacion();
				//3.setear los atributos del objeto "bean" con las variables
				bean.setId(Integer.parseInt(id));
				bean.setNombre(nom);
				bean.setDireccion(direc);
				Gson g = new Gson();
				String json = g.toJson(bean);
				//validar variable cod
				if(Integer.parseInt(id)==0){
					try {
						HttpClient client = HttpClient.newHttpClient();
						HttpRequest request_crear = HttpRequest.newBuilder()
								.uri(URI.create("http://localhost:8091/local/registrar"))
								.header("Content-type", "application/json").POST(BodyPublishers.ofString(json)).build();

						HttpResponse<String> response_crear = client.send(request_crear, BodyHandlers.ofString());
						
						tipoMensaje="success";
						request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
						request.getSession().setAttribute("MENSAJE", "Locación Registrada");
					}catch(Exception ex) {
						ex.printStackTrace();
						tipoMensaje="error";
						request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
						request.getSession().setAttribute("MENSAJE", "Error al Registrar Locacion");
					}
				}
				else {
					try {
						HttpClient client = HttpClient.newHttpClient();
						HttpRequest request_crear = HttpRequest.newBuilder()
								.uri(URI.create("http://localhost:8091/local/actualizar"))
								.header("Content-type", "application/json").PUT(BodyPublishers.ofString(json)).build();

						HttpResponse<String> response_act = client.send(request_crear, BodyHandlers.ofString());

					
						tipoMensaje="warning";
						request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
						request.getSession().setAttribute("MENSAJE", "Locación Actualizada");
					}catch(Exception ex) {
						ex.printStackTrace();
						tipoMensaje="error";
						request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
						request.getSession().setAttribute("MENSAJE", "Error al Actualizar");
					}
				}			
				response.sendRedirect("Locacion.jsp");	
	}
}
