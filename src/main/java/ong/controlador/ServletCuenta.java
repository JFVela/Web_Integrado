package ong.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ong.dao.MySqlCuentaDAO;
import ong.entity.Cuenta;


@WebServlet("/ServletCuenta")
public class ServletCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletCuenta() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//se agrega la codificacion para caracteres especiales
				request.setCharacterEncoding("UTF-8");
				String tipo = request.getParameter("accion");
				if(tipo.equals("recargar"))
					addCredito(request,response);
	}


	private void addCredito(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		String sal, num;
		sal = request.getParameter("monto");
		num = request.getParameter("cuenta");
		
		Cuenta bean = new Cuenta();
		
		bean.setSaldo(Double.parseDouble(sal));
		bean.setNumero(Integer.parseInt(num));
		
		int estado = new MySqlCuentaDAO().recargarCuenta(bean);
		
		if(estado==1) {
			request.getSession().setAttribute("MENSAJE","Credito Agregado Exitosamente");
		}
		else {
			request.getSession().setAttribute("ERROR","Error al Añadir");
		}
		response.sendRedirect("Cuenta.jsp");
	}

}
