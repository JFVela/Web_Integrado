package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.dao.MySqlEspecialidadesDAO;
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
		 String tipo = request.getParameter("accion");
		    //validar tipo
		    if (tipo.equals("guardar")) {
		        grabarEspecialidad(request, response);
		    } else if(tipo.equals("actualizar")) {
				actualizarEspecialidad(request,response);
		    }else if(tipo.equals("eliminar"))
				eliminarEspecialidad(request,response);	
	}

	private void actualizarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
		//4.invocar al método update y enviar el objeto "bean"
		System.out.println(nom + id);
		int estado=new MySqlEspecialidadesDAO().update(bean);
		//validar estado
		if(estado==1) {
			tipoMensaje = "warning";
	    	request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE","Especialidad actualizada");
		}else {
			
			 request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			 request.getSession().setAttribute("MENSAJE","Error en la actualización");
		}
		response.sendRedirect("AdEspecialidades.jsp");	

		}

	private void eliminarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id=request.getParameter("id");
		//invocar al método deleteById y enviar la variable "cod"
		int estado=new MySqlEspecialidadesDAO().deleteById(Integer.parseInt(id));
		//validar estado
		if(estado==1) {
			System.out.println("SI");
			 String tipoMensaje = "error";
			 request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);

			request.getSession().setAttribute("MENSAJE","Especialidad eliminado");

	}else {
			System.out.println("NO");
		}
		//crear atributo de tipo sesión
		//invocar método listarDocente
		//listarDocente(request,response);
		response.sendRedirect("AdEspecialidades.jsp");	
	}

	private void grabarEspecialidad(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
		if(id!=null){
			//4.invocar al método save y enviar el objeto "bean"
			int estado=new MySqlEspecialidadesDAO().save(bean);
			//validar estado
			if(estado==1) {
		        tipoMensaje = "success"; // Para mensajes de éxito (verde)
		        request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE","Especialidad registrada");
			}else {
				 tipoMensaje = "error";
				 request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
				request.getSession().setAttribute("MENSAJE","Error en el registro");
		}
		
		response.sendRedirect("AdEspecialidades.jsp");	
		}

	}
}	
