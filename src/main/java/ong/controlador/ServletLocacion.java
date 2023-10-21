package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		if (tipo.equals("insertar")) {
			insertarLocacion(request, response);
		} else if (tipo.equals("listado")) {
			listarLocacion(request, response);
		}else if(tipo.equals("eliminar"))
			eliminar(request,response);
	}


	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dato=request.getParameter("dato");
		String tipoMensaje;
		//invocar al método deleteById y enviar la variable "cod"
		int estado=new MySqlLocacionDAO().deleteById(Integer.parseInt(dato));
		//validar estado
		if(estado==1) {
			tipoMensaje="error";
			request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
			request.getSession().setAttribute("MENSAJE", "Locacion Eliminado");
		}else {
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
				//validar variable cod
				if(Integer.parseInt(id)==0){
					//4.invocar al método save y enviar el objeto "bean"
					int estado=new MySqlLocacionDAO().insertar(bean);
					//validar estado
					if(estado==1) {
						tipoMensaje="success";
					request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
					request.getSession().setAttribute("MENSAJE", "Locación Registrada");
					}else {
						tipoMensaje="error";
						request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
						request.getSession().setAttribute("MENSAJE", "Error al Registrar Locacion");
					}
				}
				else {
					//4.invocar al método update y enviar el objeto "bean"
					int estado=new MySqlLocacionDAO().update(bean);
					//validar estado
					if(estado==1) {
						tipoMensaje="warning";
						request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
						request.getSession().setAttribute("MENSAJE", "Locación Actualizada");
					}else {
						tipoMensaje="error";
						request.getSession().setAttribute("TIPO_MENSAJE", tipoMensaje);
						request.getSession().setAttribute("MENSAJE", "Error al Actualizar");
					}
				}			
				response.sendRedirect("Locacion.jsp");	
	}
}
