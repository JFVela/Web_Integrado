package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.dao.MySqlTipoDonacionDAO;
import ong.entity.Tipo_Donacion;


@WebServlet("/ServletTipoDonacion")
public class ServletTipoDonacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletTipoDonacion() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("accion");
		if(tipo.equals("grabar"))
			grabarTipoDonacion(request,response);
		if(tipo.equals("eliminar"))
			eliminarTipoDonacion(request,response);
	}


	private void eliminarTipoDonacion(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		String cod = request.getParameter("codigo");
		int estado=new MySqlTipoDonacionDAO().deleteById(Integer.parseInt(cod));
		
		if(estado==1)
			System.out.println("SI");
		else
			System.out.println("NO");
		
		//crear atributo de tipo sesion
		request.getSession().setAttribute("ERROR","TipoDeDonacion eliminado");
		//invocar metodo listardocente
		//listarDocente(request, response);
		response.sendRedirect("Tipodedonacion.jsp");
		
	}


	private void grabarTipoDonacion(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
	
		String cod, nom;
		
		cod = request.getParameter("codigo");
		nom = request.getParameter("nombre");
		
		Tipo_Donacion bean = new Tipo_Donacion();
		
		bean.setId(Integer.parseInt(cod));
		bean.setNombre(nom);
		
		if(Integer.parseInt(cod)==0) {
			int estado = new MySqlTipoDonacionDAO().save(bean);
			
			if(estado==1)
				request.getSession().setAttribute("MENSAJE","TipodeDonacion registrado");
			else
				request.getSession().setAttribute("ERROR","Error en el Registro");
			
		}
		else  {
			int estado = new MySqlTipoDonacionDAO().update(bean);
			
			if(estado==1)
				request.getSession().setAttribute("MODIFICADO","TIPO Actualizado");
			else
				request.getSession().setAttribute("ERROR","error en el Actualizado");
		}
		
		response.sendRedirect("Tipodedonacion.jsp");
		
	}
	
	}


