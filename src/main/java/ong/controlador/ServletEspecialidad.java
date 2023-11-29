package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlEspecialidadesDAO;
import ong.dao.MySqlEventosDAO;
import ong.entity.Especialidad;

/**
 * Servlet implementation class ServletEspecialidad
 */
@WebServlet("/ServletEspecialidad")
public class ServletEspecialidad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEspecialidad() {
        super();
        // TODO Auto-generated constructor stub
    }

		/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 String tipo = request.getParameter("accion");
		    //validar tipo
		    if (tipo.equals("guardar")) {
		        grabarEspecialidad(request, response);
		    }else if(tipo.equals("eliminar")) {
				eliminarEspecialidad(request,response);	
		    }else if(tipo.equals("listaEspecialidad"))
				listaEspecialidad(request,response);
		    else if (tipo.equals("buscarEspecialidad"))
				buscarEspecialidad(request, response);
	}



	private void buscarEspecialidad(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod = request.getParameter("id"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/especialidad/buscar/" + cod)).GET().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());

		} catch (Exception e) {
			e.printStackTrace();
		}
		}

	private void listaEspecialidad(HttpServletRequest request, HttpServletResponse response) {
			try {
				//crear objeto de la classe HTTPCLIENT
				HttpClient http = HttpClient.newHttpClient();
				//crear objeto de la clase HTTPREQUEST --> Solicitud
				HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/especialidad/lista"))
											.GET().build();
				
				//crear objeto de la clase HTTPRESPONSE ---
				HttpResponse<String> response_lista = http.send(request_lista, BodyHandlers.ofString());
				//Preparar salida en format JSON
				response.setContentType("application/json;charset=UTF-8");
				//
				PrintWriter pw = response.getWriter();
				pw.print(response_lista.body());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	private void eliminarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 String id = request.getParameter("id");
		    int especialidadId = Integer.parseInt(id);

		    int estado = new MySqlEspecialidadesDAO().deleteWithVolunteers(especialidadId);

		    if (estado == 1) {
		        System.out.println("SI");
		        String tipoMensaje = "error";
		        request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
		        request.getSession().setAttribute("MENSAJE", "Especialidad eliminada");
		    } else {
		        System.out.println("NO");
		    }

		    response.sendRedirect("AdEspecialidades.jsp");
		}

	private void grabarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//1. recuperar los valores de los controles (cajas) del form
		//usar atributo name.
		String nom, id;
		nom = request.getParameter("nombre");
		id = request.getParameter("id");
		
		//2.Crear objeto de la clase Especialidad
		Especialidad bean = new Especialidad();
		//3.Setear los atributos del objeto "bean" con las variables
		bean.setNombre(nom);
		bean.setIdEspecialidades(Integer.parseInt(id));
	    String tipoMensaje = "error"; // Color por defecto: rojo

		//validar variable cod
	    /*if(Integer.parseInt(id)==0) {
			//4.invocar al método save y enviar el objeto "bean"
			int estado=new MySqlEspecialidadesDAO().save(bean);
			//validar estado
			if(estado==1) {
		        tipoMensaje = "success"; // Para mensajes de éxito (verde)
		        request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE","Especialidad registrada");
			}
		}else {
			int estado=new MySqlEspecialidadesDAO().update(bean);

			if(estado==1) {
				tipoMensaje = "warning";
		    	request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE","Especialidad actualizada");
			}else {
				 tipoMensaje = "error";
				 request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE","Error en la actualización");
			}}*/
	    Gson gson = new Gson();
	    String json = gson.toJson(bean);

	    // Invocar al servicio web correspondiente y enviar el objeto convertido a JSON
	    String url = (bean.getIdEspecialidades() == 0) ? "http://localhost:8091/especialidad/registrar" : "http://localhost:8091/especialidad/actualizar";

	    try {
	        HttpClient client = HttpClient.newHttpClient();
	        HttpRequest requestEnviar = (bean.getIdEspecialidades() == 0)
	                ? HttpRequest.newBuilder().uri(URI.create(url)).header("Content-type", "application/json").POST(BodyPublishers.ofString(json)).build()
	                : HttpRequest.newBuilder().uri(URI.create(url)).header("Content-type", "application/json").PUT(BodyPublishers.ofString(json)).build();

	        HttpResponse<String> responseLista = client.send(requestEnviar, BodyHandlers.ofString());

	        if (responseLista.statusCode() == 200) {
	            tipoMensaje = (bean.getIdEspecialidades() == 0) ? "success" : "warning";
	            request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
	            request.getSession().setAttribute("MENSAJE", (bean.getIdEspecialidades() == 0) ? "Especialidad registrada con éxito" : "Especialidad actualizada con éxito");
	        } else {
	            tipoMensaje = "error";
	            request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
	            request.getSession().setAttribute("MENSAJE", (bean.getIdEspecialidades() == 0) ? "Error en el registro de la especialidad" : "Error en la actualización de la especialidad");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new ServletException("Error al procesar la solicitud", e);
	    }
		
		response.sendRedirect("AdEspecialidades.jsp");	
		

	}
}	
