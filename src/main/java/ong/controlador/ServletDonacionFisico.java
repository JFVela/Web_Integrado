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

import ong.dao.MySqlDonacionFiscaDAO;
import ong.entity.*;


@WebServlet("/ServletDonacionFisico")
public class ServletDonacionFisico extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ServletDonacionFisico() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("accion");

		if (tipo != null) {
			if (tipo.equals("insertar"))
				insertarDonFisica(request, response);
			else if (tipo.equals("listado"))
		        listarDonFisica(request, response);
			else if (tipo.equals("eliminar"))
		        eliminar(request, response);
			else if (tipo.equals("buscar"))
		        buscar(request, response);
			

		}
	}

	
	private void buscar(HttpServletRequest request, HttpServletResponse response) {
		try {
			String cod = request.getParameter("id"); // Corregir el nombre del parámetro
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request_lista = HttpRequest.newBuilder()
					.uri(URI.create("http://localhost:8091/donfisica/buscar/" + cod)).GET().build();

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
					.uri(URI.create("http://localhost:8091/donfisica/eliminar/" + dato)).DELETE().build();

			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			tipoMensaje="error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE","Donacion Fisica eliminado");
		}catch(Exception ex) {
			ex.printStackTrace();
			tipoMensaje="error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE","Error al eliminar donación física");
		}
		response.sendRedirect("Donacion_Fisica.jsp");			
	}
	private void listarDonFisica(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request_lista = HttpRequest.newBuilder().uri(URI.create("http://localhost:8091/donfisica/lista"))
					.GET().build();
			HttpResponse<String> response_lista = client.send(request_lista, BodyHandlers.ofString());
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.print(response_lista.body());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	private void insertarDonFisica(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id,dnidon,idlocal,descrip,estadol,tipoMensaje;
		id=request.getParameter("id");
		dnidon=request.getParameter("dnidonante");
		idlocal=request.getParameter("idlocal");
		descrip=request.getParameter("descripcion");
		estadol=request.getParameter("estado");
		//2.crear objeto de la clase Docente
		DonacionFisica bean=new DonacionFisica();
		//3.setear los atributos del objeto "bean" con las variables
		bean.setId_fisica(Integer.parseInt(id));
		//bean.setDonan_dni(Integer.parseInt(dnidon));
		bean.setDescripcion(descrip);
		bean.setEstado(Boolean.parseBoolean(estadol));
		
		Donante donan=new Donante();
		donan.setDni(Integer.parseInt(dnidon));
		bean.setDonan(donan);
		
		Locacion lc=new Locacion();
		lc.setId_local(Integer.parseInt(idlocal));
		bean.setLocal_don(lc);
		
		Gson g = new Gson();
		String json = g.toJson(bean);
		//validar variable cod
		if(bean.getId_fisica()==0){
			try {
				HttpClient client = HttpClient.newHttpClient();
				HttpRequest request_crear = HttpRequest.newBuilder()
						.uri(URI.create("http://localhost:8091/donfisica/registrar"))
						.header("Content-type", "application/json").POST(BodyPublishers.ofString(json)).build();

				HttpResponse<String> response_crear = client.send(request_crear, BodyHandlers.ofString());
				if (response_crear.statusCode() == 200) {
					tipoMensaje="success";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE","Donacion Fisica registrada");
				} else {
					tipoMensaje = "error";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Error en el registro de la donación");
				}
				
			}catch(Exception ex) {
				ex.printStackTrace();
				
			}
		}
		else {
			try {
				HttpClient client = HttpClient.newHttpClient();
				HttpRequest request_crear = HttpRequest.newBuilder()
						.uri(URI.create("http://localhost:8091/donfisica/actualizar"))
						.header("Content-type", "application/json").PUT(BodyPublishers.ofString(json)).build();

				HttpResponse<String> response_act = client.send(request_crear, BodyHandlers.ofString());

			
				if (response_act.statusCode() == 200) {
					tipoMensaje="warning";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE","Donacion Fisica actualizado");
				} else {
					tipoMensaje = "error";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Error en la actualización");
				}

				
			}catch(Exception ex) {
				ex.printStackTrace();

			}
			
		}		
		response.sendRedirect("Donacion_Fisica.jsp");	
		
	}

}
