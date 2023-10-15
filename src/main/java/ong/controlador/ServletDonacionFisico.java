package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.dao.MySqlDonacionFiscaDAO;
import ong.entity.DonacionFisica;


@WebServlet("/ServletDonacionFisico")
public class ServletDonacionFisico extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ServletDonacionFisico() {
        super();
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo = request.getParameter("accion");

		if (tipo.equals("insertar")) {
			insertarDonFisica(request, response);
		} else if (tipo.equals("listado")) {
			listarDonFisica(request, response);
		}else if(tipo.equals("eliminar"))
			eliminar(request,response);	}
	
	private void eliminar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dato=request.getParameter("dato");
		//invocar al método deleteById y enviar la variable "cod"
		int estado=new MySqlDonacionFiscaDAO().deleteById(Integer.parseInt(dato));
		//validar estado
		if(estado==1)
			System.out.println("SI");
		else
			System.out.println("NO");
		request.getSession().setAttribute("MENSAJE","Donacion fisica eliminado");
		//invocar método listarDocente
		//listarDocente(request,response);
		response.sendRedirect("Donacion_Fisica.jsp");			
	}
	private void listarDonFisica(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setAttribute("locaciones", new MySqlDonanteDAO().findAll());
				request.getRequestDispatcher("/Donacion_Fisica.jsp").forward(request, response);		
	}
	private void insertarDonFisica(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id,dnidon,idlocal,descrip,estadol;
		id=request.getParameter("id");
		dnidon=request.getParameter("dnidonante");
		idlocal=request.getParameter("idlocal");
		descrip=request.getParameter("descripcion");
		estadol=request.getParameter("estado");
		//2.crear objeto de la clase Docente
		DonacionFisica bean=new DonacionFisica();
		//3.setear los atributos del objeto "bean" con las variables
		bean.setIdFisico(Integer.parseInt(id));
		bean.setDniDonantes(Integer.parseInt(dnidon));
		bean.setIdLocal(Integer.parseInt(idlocal));
		bean.setDescripcion(descrip);
		bean.setEstado(Boolean.parseBoolean(estadol));
		//validar variable cod
		if(Integer.parseInt(id)==0){
			//4.invocar al método save y enviar el objeto "bean"
			int estado=new MySqlDonacionFiscaDAO().save(bean);
			//validar estado
			if(estado==1)
				request.getSession().setAttribute("MENSAJE","Donacion Fisica registrado");
			else
				request.getSession().setAttribute("MENSAJE","Error en el registro");
		}
		else {
			//4.invocar al método update y enviar el objeto "bean"
			int estado=new MySqlDonacionFiscaDAO().update(bean);
			//validar estado
			if(estado==1)
				request.getSession().setAttribute("MENSAJE","Donacion Fisica actualizado");
			else
				request.getSession().setAttribute("MENSAJE","Error en la actualización");
		}		
		response.sendRedirect("Donacion_Fisica.jsp");	
		
	}

}
