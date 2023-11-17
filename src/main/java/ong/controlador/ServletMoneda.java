package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.dao.MySqlMonedaDAO;
import ong.entity.Moneda;

@WebServlet("/ServletMoneda")
public class ServletMoneda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletMoneda() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//se agrega la codificacion para caracteres especiales
		request.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("accion");
		if(tipo.equals("grabar"))
			grabarMoneda(request,response);
		if(tipo.equals("eliminar"))
			eliminarMoneda(request,response);
	}

	private void eliminarMoneda(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void grabarMoneda(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		String cod, nom,val;
		
		cod = request.getParameter("codigo");
		nom = request.getParameter("nombre");
		val = request.getParameter("valor");
		
		Moneda bean = new Moneda();
		
		bean.setId(Integer.parseInt(cod));
		bean.setNombre(nom);
		bean.setValor(Double.parseDouble(val));
		
		if(Integer.parseInt(cod)==0) {
			int estado = new MySqlMonedaDAO().save(bean);
			
			if(estado==1)
				request.getSession().setAttribute("MENSAJE","Nueva Moneda Agregada");
			else
				request.getSession().setAttribute("ERROR","Error en el Registro");
			
		}
		else  {
			int estado = new MySqlMonedaDAO().update(bean);
			
			if(estado==1)
				request.getSession().setAttribute("MODIFICADO","Moneda Actualizada");
			else
				request.getSession().setAttribute("ERROR","error al Actualizar");
		}
		
		response.sendRedirect("Moneda.jsp");
		
	}

}
