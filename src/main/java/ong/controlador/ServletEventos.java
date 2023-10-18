package ong.controlador;

import java.io.IOException;
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
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String tipo = request.getParameter("accion");
		    //validar tipo
	  if (tipo.equals("guardar")) {
		  grabarEventos(request, response);
	  } else if(tipo.equals("eliminar"))
		  eliminarEvento(request,response);
	}

	private void eliminarEvento(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 String id = request.getParameter("id");
		    int eventId = Integer.parseInt(id);

		    // Inicializar el resultado de la operación
		    int result = 0;

		    Connection con = null;

		    try {
		        con = new MySqlConectar().getConectar();
		        // Deshabilitar el autocommit para iniciar una transacción
		        con.setAutoCommit(false);

		        // Eliminar voluntarios inscritos en el evento
		        int inscripcionResult = new MySqlnscripcionDAO().deleteByEventId(eventId);

		        // Eliminar voluntarios que están inscritos en el evento
		        int voluntarioResult = new MySqlVoluntarioDAO().deleteByEventId(eventId);

		        // Eliminar el evento si y solo si no hubo problemas al eliminar las inscripciones y los voluntarios
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

				request.getSession().setAttribute("MENSAJE","Evento eliminado");
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
		response.sendRedirect("AdEventos.jsp");	
	}

	private void grabarEventos(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//1. recuperar los valores de los controles (cajas) del form
		//usar atributo name.
		String nom, id, ubi,ini, fin,eini, efin,det, vac;
		nom = request.getParameter("nombreEspecialidad");
		id = request.getParameter("id");
		ubi = request.getParameter("ubicacion");
		ini = request.getParameter("inicioInscripcion");
		fin = request.getParameter("finalInscripcion");
		eini = request.getParameter("inicioEvento");
		efin = request.getParameter("finalEvento");
		det = request.getParameter("detalleEvento");
		vac = request.getParameter("vacantes");

		
		//cambiar fechas a formato date (string to date)
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//inicio Inscripcion
		Date fecha = null;
		try {
		    fecha = dateFormat.parse(ini);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		//final inscripcion
		Date fechaF = null;
		try {
		    fechaF = dateFormat.parse(fin);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		//inicio evento
		Date fechaEi = null;
		try {
		    fechaEi = dateFormat.parse(eini);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		//final evento
		Date fechaEf = null;
		try {
		    fechaEf = dateFormat.parse(efin);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		//2.Crear objeto de la clase Especialidad
		Eventos bean = new Eventos();
		//3.Setear los atributos del objeto "bean" con las variables
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
		//4.invocar al método save y enviar el objeto "bean"
		//validar estado
		if(Integer.parseInt(id)==0) {
			int estado=new MySqlEventosDAO().save(bean);

	        if(estado==1) {
		        tipoMensaje = "success"; // Para mensajes de éxito (verde)
	        	request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
	        	request.getSession().setAttribute("MENSAJE","Evento registrado");
	        }else {
				request.getSession().setAttribute("MENSAJE","Error en el registro");
	        }
		}else {
			int estado=new MySqlEventosDAO().update(bean);

			if(estado==1) {
		        tipoMensaje = "warning"; 
        		request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE","Evento actualizado");
			}else {
				 tipoMensaje = "error";
				 request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE","Error en la actualización");
			}
		}
		
		response.sendRedirect("AdEventos.jsp");	
				}
	

}
