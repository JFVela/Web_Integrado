package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlCuentaDAO;
import ong.entity.Cuenta;
import ong.interfaces.CuentaDAO;

@WebServlet("/ServletBuscarCuenta")
public class ServletBuscarCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletBuscarCuenta() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		if (request.getMethod().equals("GET")) {
		    int numeroCuenta = Integer.parseInt(request.getParameter("numeroCuenta"));
		    CuentaDAO cuentaDAO = new MySqlCuentaDAO();
		    Cuenta cuenta = null;

		    for (Cuenta c : cuentaDAO.findAll()) {
		        if (c.getNumero() == numeroCuenta) {
		            cuenta = c;
		            break;
		        }
		    }

		    if (cuenta != null) {
		        Gson gson = new Gson();
		        String cuentaJSON = gson.toJson(cuenta);
		        out.println(cuentaJSON);
		    } else {
		        
		        out.println("{\"error\": true}");
		        System.out.println("No existe");
		        
		    }
		} else {
		    response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		    out.println("Método no permitido");
		}

	}

}
