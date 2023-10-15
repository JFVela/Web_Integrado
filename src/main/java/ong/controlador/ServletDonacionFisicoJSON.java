package ong.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ong.dao.MySqlDonacionFiscaDAO;
import ong.dao.MySqlLocacionDAO;
import ong.entity.DonacionFisica;
import ong.entity.Locacion;

@WebServlet("/ServletDonacionFisicoJSON")
public class ServletDonacionFisicoJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ServletDonacionFisicoJSON() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//obtener lista de todos
		List<DonacionFisica> lista=new MySqlDonacionFiscaDAO().findAll();
		//crear objeto de la clase Gson
		Gson gson=new Gson();
		//convertir a JSON(STRING) el arreglo lista
		String json=gson.toJson(lista);
		//preparar salida en formato JSON
		response.setContentType("application/json;charset=UTF-8");
		//
		PrintWriter pw=response.getWriter();
		pw.print(json);	
	}

}
