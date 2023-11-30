package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlEventosDAO;
import ong.dao.MySqlVoluntarioDAO;
import ong.dao.MySqlnscripcionDAO;
import ong.entity.Eventos;
import ong.utils.MySqlConectar;

/**
 * Servlet implementation class ServletEventos
 */
@WebServlet("/ServletEventos")
public class ServletEventos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public ServletEventos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 String tipo = request.getParameter("accion");
		    //validar tipo
		  if (tipo.equals("guardar")) {
			  grabarEventos(request, response);
		  } else if(tipo.equals("eliminar"))
			  eliminarEvento(request,response);
		  else if(tipo.equals("listaEventos"))
				listaEventos(request,response);
		  else if (tipo.equals("buscarEvento"))
				buscarEvento(request, response);
	}

	private void buscarEvento(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod = request.getParameter("id"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/eventos/buscar/" + cod)).GET().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");

			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());	

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void listaEventos(HttpServletRequest request, HttpServletResponse response) {
		try {
			//crear objeto de la classe HTTPCLIENT
			HttpClient http = HttpClient.newHttpClient();
			//crear objeto de la clase HTTPREQUEST --> Solicitud
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/eventos/lista"))
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

	private void eliminarEvento(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		int eventId = Integer.parseInt(id);

		// Inicializar el resultado de la operación
		int result = 0;

		Connection con = null;

		try {
			con = new MySqlConectar().getConectar();
			// Deshabilitar el autocommit para iniciar una tr	ansacción
			con.setAutoCommit(false);

			// Eliminar voluntarios inscritos en el evento
			int inscripcionResult = new MySqlnscripcionDAO().deleteByEventId(eventId);

			// Eliminar voluntarios que están inscritos en el evento
			int voluntarioResult = new MySqlVoluntarioDAO().deleteByEventId(eventId);

			// Eliminar el evento si y solo si no hubo problemas al eliminar las
			// inscripciones y los voluntarios
			if (inscripcionResult >= 0 && voluntarioResult >= 0) {
				result = new MySqlEventosDAO().deleteById(eventId);
			} else {
				// Si hubo problemas al eliminar inscripciones o voluntarios, hacer un rollback
				con.rollback();
			}

			// Confirmar la transacción
			con.commit();
			System.out.println("SI");
			String tipoMensaje = "error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);

			request.getSession().setAttribute("MENSAJE", "Evento eliminado");
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if (con != null) {
					// Si hay una excepción, hacer un rollback
					con.rollback();
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (con != null) {
					// Restablecer el autocommit
					con.setAutoCommit(true);
					con.close();
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		//XD
		/*try {
			String tipoMensaje = "";

			String cod = request.getParameter("id"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();

			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/eventos/eliminar/" + cod)).DELETE().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			if (response_lista.statusCode() == 200) {
				tipoMensaje = "success";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "Evento eliminado con éxito");
			} else {
				tipoMensaje = "error";
				request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE", "No se puede eliminar el Evento");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}*/
		response.sendRedirect("AdEventos.jsp");
	}

	private void grabarEventos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// 1. recuperar los valores de los controles (cajas) del form
		// usar atributo name.
		String nom, id, ubi, ini, fin, eini, efin, det, vac;
		nom = request.getParameter("nombreEspecialidad");
		id = request.getParameter("id");
		ubi = request.getParameter("ubicacion");
		ini = request.getParameter("inicioInscripcion");
		fin = request.getParameter("finalInscripcion");
		eini = request.getParameter("inicioEvento");
		efin = request.getParameter("finalEvento");
		det = request.getParameter("detalleEvento");
		vac = request.getParameter("vacantes");

		// cambiar fechas a formato date (string to date)
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// inicio Inscripcion
		Date fecha = null;
		try {
			fecha = dateFormat.parse(ini);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// final inscripcion
		Date fechaF = null;
		try {
			fechaF = dateFormat.parse(fin);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// inicio evento
		Date fechaEi = null;
		try {
			fechaEi = dateFormat.parse(eini);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// final evento
		Date fechaEf = null;
		try {
			fechaEf = dateFormat.parse(efin);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// 2.Crear objeto de la clase Especialidad
		Eventos bean = new Eventos();
		// 3.Setear los atributos del objeto "bean" con las variables
		bean.setId_evento(Integer.parseInt(id));
		bean.setNombre(nom);
		bean.setUbicacion(ubi);
		bean.setInicio_inscripcion(new java.sql.Date(fecha.getTime()));
		bean.setFinal_inscripcion(new java.sql.Date(fechaF.getTime()));
		bean.setEinicio(new java.sql.Date(fechaEi.getTime()));
		bean.setEfinal(new java.sql.Date(fechaEf.getTime()));
		bean.setDetalle(det);
		bean.setVacantes(Integer.parseInt(vac));
		String tipoMensaje = "error"; // Color por defecto: rojo
		// 4.invocar al método save y enviar el objeto "bean"
		// validar estado
		 // Convertir objeto a JSON
	    Gson gson = new Gson();
	    String json = gson.toJson(bean);


	    // Invocar al servicio web correspondiente y enviar el objeto convertido a JSON
	    String url = (bean.getId_evento() == 0) ? "http://localhost:8091/eventos/registrar" : "http://localhost:8091/eventos/actualizar";

	    try {
	        HttpClient client = HttpClient.newHttpClient();
	        HttpRequest requestEnviar = (bean.getId_evento()== 0)
	                ? HttpRequest.newBuilder().uri(URI.create(url)).header("Content-type", "application/json").POST(BodyPublishers.ofString(json)).build()
	                : HttpRequest.newBuilder().uri(URI.create(url)).header("Content-type", "application/json").PUT(BodyPublishers.ofString(json)).build();

	        HttpResponse<String> responseLista = client.send(requestEnviar, BodyHandlers.ofString());

	        if (responseLista.statusCode() == 200) {
	            tipoMensaje = (bean.getId_evento() == 0) ? "success" : "warning";
	            request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
	            request.getSession().setAttribute("MENSAJE", (bean.getId_evento() == 0) ? "Evento registrado con éxito" : "Evento actualizado con éxito");
	        } else {
	            tipoMensaje = "error";
	            request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
	            request.getSession().setAttribute("MENSAJE", (bean.getId_evento() == 0) ? "Error en el registro del evento" : "Error en la actualización del evento");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new ServletException("Error al procesar la solicitud", e);
	    }


		response.sendRedirect("AdEventos.jsp");
	}
//delegado
}
