package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.dao.MySqlCampañaDAO;
import ong.entity.Campaña;

@WebServlet("/ServletCampaña")
public class ServletCampaña extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ServletCampaña() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//se agrega la codificacion para caracteres especiales
		request.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("accion");
		if(tipo.equals("grabar"))
			grabarCampana(request,response);
		if(tipo.equals("eliminar"))
			eliminarCampana(request,response);
	}

	private void eliminarCampana(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		String cod = request.getParameter("codigo");
		int estado=new MySqlCampañaDAO().deleteById(Integer.parseInt(cod));
		
		if(estado==1)
			System.out.println("SI");
		else
			System.out.println("NO");
		
		//crear atributo de tipo sesion
		request.getSession().setAttribute("ERROR","Campaña Eliminada");
		//invocar metodo listardocente
		//listarDocente(request, response);
		response.sendRedirect("Campania.jsp");
		
	}

	private void grabarCampana(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		//request.setCharacterEncoding("UTF-8");

		String cod, nom,des;
		
		cod = request.getParameter("codigo");
		nom = request.getParameter("nombre");
		des = request.getParameter("descripcion");
		
		Campaña bean = new Campaña();
		
		bean.setId(Integer.parseInt(cod));
		bean.setNombre(nom);
		bean.setDescripcion(des);
		
		if(Integer.parseInt(cod)==0) {
			int estado = new MySqlCampañaDAO().save(bean);
			
			if(estado==1)
				request.getSession().setAttribute("MENSAJE","Campaña registrado");
			else
				request.getSession().setAttribute("ERROR","Error en el Registro");
			
		}
		else  {
			int estado = new MySqlCampañaDAO().update(bean);
			
			if(estado==1)
				request.getSession().setAttribute("MODIFICADO","Campaña Actualizado");
			else
				request.getSession().setAttribute("ERROR","error en el Actualizada");
		}
		
		response.sendRedirect("Campania.jsp");
		
	}

}
